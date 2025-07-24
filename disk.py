import subprocess
import os
import fcntl
import errno
import time
import sys


# Création du point de montage
# subprocess.run(["mkdir /media/disk"])

# Constantes issues de /usr/include/linux/cdrom.h
CDROM_DRIVE_STATUS   = 0x5326
CDS_NO_INFO          = 0
CDS_NO_DISC          = 1
CDS_TRAY_OPEN        = 2
CDS_DRIVE_NOT_READY  = 3
CDS_DISC_OK          = 4

DEV = '/dev/sr0'

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
        # Ouverture en lecture seule, non bloquante
        fd = os.open(device, os.O_RDONLY | os.O_NONBLOCK)
        try:
            return fcntl.ioctl(fd, CDROM_DRIVE_STATUS, 0)
        finally:
            os.close(fd)
    except OSError as e:
        if e.errno == errno.ENOMEDIUM:
            return CDS_NO_DISC
        elif e.errno == errno.ENOTTY:
            print(f"❌ {device} n'est pas un lecteur CD-ROM.", file=sys.stderr)
        elif e.errno == errno.EACCES:
            print(f"❌ Permission refusée sur {device}.", file=sys.stderr)
        elif e.errno == errno.ENOENT:
            print(f"❌ Le périphérique {device} n'existe pas.", file=sys.stderr)
        else:
            print(f"❌ Erreur inconnue : {e}", file=sys.stderr)
        return CDS_NO_INFO

if __name__ == '__main__':
    try:
        previous_state = None
        while True:
            code = check_disc(DEV)
            if code != previous_state:
                print(f"🔄 Changement d’état : {status_str(code)}")
                print(code)
                print(code)
                if code == 4:
                        subprocess.run(["mkdir", "/media/disk"])
                        subprocess.run(["mount", "/dev/sr0", "/media/disk"])
                if code == 2:
                        subprocess.run(["umount", "/media/disk"])
                previous_state = code
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n👋 Arrêté par l'utilisateur.")
        sys.exit(0)




















# 
# 
