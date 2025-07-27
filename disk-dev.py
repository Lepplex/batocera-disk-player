import subprocess
import os
import fcntl
import errno
import time
import sys
import hashlib

# Constantes issues de /usr/include/linux/cdrom.h
CDROM_DRIVE_STATUS   = 0x5326
CDS_NO_INFO          = 0
CDS_NO_DISC          = 1
CDS_TRAY_OPEN        = 2
CDS_DRIVE_NOT_READY  = 3
CDS_DISC_OK          = 4

DEV = '/dev/sr0' # Batocera default disc drive path is sr0 
game_dirs = """
3do,3ds,abuse,adam,advision,amiga1200,amiga500,amigacd32,amigacdtv,amstradcpc,apfm1000,apple2,apple2gs,arcadia,archimedes,arduboy,astrocde,atari2600,atari5200,atari7800,atari800,atarist,atom,atomiswave,bbc,cl128,c20,c64,camplynx,cannonball,cavestory,cdi,cdogs,cgenius,channelf,chihiro,coco,colecovision,commanderx16,corsixth,cplus4,crvision,daphne,devilutionx,doom3,dos,dreamcast,dxx-rebirth,easyrpg,ecwolf,eduke32,electron,etlegacy,fallout1-ce,fallout2-ce,fbneo,fds,flash,flatpak,fm7,fmtowns,fpinball,fury,gamate,gameandwatch,gamecom,gamecube,gamegear,gamepock,gb,gb2players,gba,gbc,gbc2players,gmaster,gp32,gx4000,gzdoom,hcl,hurrican,ikemen,intellivision,iortcw,jaguar,jaguarcd,jazz2,laser310,lcdgames,lowresnx,lutro,lynx,macintosh,mame,mastersystem,megadrive,megaduck,model2,model3,moonlight,mrboom,msu-md,msx1,msx2,msx2+,msxturbor,mugen,multivision,n64,n64dd,namco2x6,naomi,naomi2,nds,neogeo,neogeocd,nes,ngp,ngpc,o2em,odcommander,openbor,openjazz,openlara,pc88,pc98,pcengine,pcenginecd,pcfx,pdp1,pet,pico,pico8,plugnplay,pokemini,ports,prboom,ps2,ps3,psp,psvita,psx,pv1000,pygame,pyxel,quake3,raze,reminiscence,rott,samcoupe,satellaview,saturn,scummvm,sdlpop,sega32x,segacd,sg1000,sgb,singe,snes,snes-msu1,socrates,solarus,sonic3-air,sonic-mania,sonicretro,spectravideo,steam,sufami,superbroswar,supergrafx,supervision,supracan,systemsp,theforceengine,thextech,thomson,ti99,tic80,triforce,tutor,tyrian,tyrquake,uzebox,vc4000,vectrex,vgmplay,videopacplus,vircon32,virtualboy,vis,vitaquake2,vpinball,vsmile,wasm4,wii,wiiu,windows,windows_installers,wswan,wswanc,x1,x68000,xash3d_fwgs,xbox
""".replace("\n", "").split(",")
MOUNTPOINT = "/media/disk"

# Variables
def kodi_running(kodi_process):
    try:
        subprocess.check_output(["pgrep", "-x", kodi_process])
        return True
    except subprocess.CalledProcessError:
        return False

def status_str(code):
    return {
        CDS_NO_INFO:         "Info indisponible",
        CDS_NO_DISC:         "Pas de disque",
        CDS_TRAY_OPEN:       "Tiroir ouvert",
        CDS_DRIVE_NOT_READY: "Lecteur non prêt",
        CDS_DISC_OK:         "Disque inséré et prêt",
    }.get(code, f"Code inconnu : {code}")

def check_disc(device):
    try:
        # Read only mode
        fd = os.open(device, os.O_RDONLY | os.O_NONBLOCK)
        try:
            return fcntl.ioctl(fd, CDROM_DRIVE_STATUS, 0)
        finally:
            os.close(fd)
    except OSError as e:
        # Diffrents errors, for debugging purposes only, ignore it otherwise
        if e.errno == errno.ENOMEDIUM:
            return CDS_NO_DISC
        elif e.errno == errno.ENOTTY:
            print(f"{device} n'est pas un lecteur CD-ROM.", file=sys.stderr)
        elif e.errno == errno.EACCES:
            print(f"Permission refusée sur {device}.", file=sys.stderr)
        elif e.errno == errno.ENOENT:
            print(f"Le périphérique {device} n'existe pas.", file=sys.stderr)
        else:
            print(f"Erreur inconnue : {e}", file=sys.stderr)
        return CDS_NO_INFO

# This is to check if the disc if really a Batocera Disc Player compatible disc.
def detect_game_dirs(base_path):
    found_dirs = []
    for folder in game_dirs:
        path = os.path.join(base_path, folder)
        if os.path.isdir(path):
            found_dirs.append(folder)
    return found_dirs

def get_disk_signature(path):
    if not os.path.ismount(path):
        return None
    items = []
    for root, dirs, files in os.walk(path):
        for d in dirs:
            items.append(os.path.relpath(os.path.join(root, d), path))
        for f in files:
            items.append(os.path.relpath(os.path.join(root, f), path))
    if not items:
        return "EMPTY"  # If disc is empty
    items.sort()
    hash_obj = hashlib.md5()
    for item in items:
        hash_obj.update(item.encode())
    return hash_obj.hexdigest()

#def disc_inserted():
#    if kodi_running("kodi"):
#        print("Kodi is running, skipping...")
#    else:
#        found = detect_game_dirs(MOUNTPOINT)
#        if found:
#            print(f"Game folders found: {found}")
#            subprocess.run(["killall", "emulationstation"])
#            subprocess.run(["emulationstation"])
#        else:
#            print("Unsupported disc inserted. Skipping...")

# Batocera Disk Player service
# NOTE : the script will "pause" if Kodi is running, because Kodi handle the disc drive itself.
verify_needed = 0
if __name__ == '__main__':
    try:
        previous_state = None
        while True:
            code = check_disc(DEV)
            if code != previous_state:
                # Change of states, for debugging purposes only, ignore it otherwise
                print(f"Changing state : {status_str(code)}")
                print(code)
                if code == 4:
                    subprocess.run(["mkdir", "/media/disk"])
                    subprocess.run(["mount", "/dev/sr0", "/media/disk"])
                    found = detect_game_dirs(MOUNTPOINT)
                    if found:
                        print(f"Game folders found: {found}")
                        if kodi_running("kodi"):
                            print("Kodi is running, skipping...")
                        else:
                            subprocess.run(["killall", "emulationstation"])
                            subprocess.run(["emulationstation"])
                            verify_needed = 1
                    else:
                        print("Unsupported disc inserted. Skipping...")
                if code == 1 and verify_needed == 1:
                            if kodi_running("kodi"):
                                print("Kodi is running, skipping...")
                            else:
                                subprocess.run(["umount", "/media/disk"])
                                subprocess.run(["killall", "emulationstation"])
                                subprocess.run(["emulationstation"])
                                verify_needed = 0
                previous_state = code
            time.sleep(1)
    except KeyboardInterrupt:
        sys.exit(0)
