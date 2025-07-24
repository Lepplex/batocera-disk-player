#!/bin/bash
clear

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}==========================================================${NC}"
echo -e "${YELLOW}              Batocera Disk Player Installer            ${NC}"
echo -e "${BLUE}==========================================================${NC}"

# Disclaimer
echo This script will install the Batocera Disk Player mod.
read -p "DISCLAIMER : The autor(s) are not responsible if anything goes wrong. Do you still want to continue ? (y/n)" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting..."
        exit 1
    fi

echo -e "${BLUE}Creating mount point folder...${NC}"
mkdir -p /media/disk

echo -e "${BLUE}Installing startup script...${NC}"
rm -rf custom.sh
wget -P /userdata/system https://raw.githubusercontent.com/Lepplex/batocera-disk-player/refs/heads/main/custom.sh

echo -e "${BLUE}Installing Batocera Disc Player service...${NC}"
rm -rf disk.py
wget -P /userdata/system https://raw.githubusercontent.com/Lepplex/batocera-disk-player/refs/heads/main/disk.py
 
echo -e "${BLUE}Creating symlinks...${NC}"
ln -sf /media/disk/3do /userdata/roms/3do
ln -sf /media/disk/3ds /userdata/roms/3ds
ln -sf /media/disk/abuse /userdata/roms/abuse
ln -sf /media/disk/adam /userdata/roms/adam
ln -sf /media/disk/advision /userdata/roms/advision
ln -sf /media/disk/amiga1200 /userdata/roms/amiga1200
ln -sf /media/disk/amiga500 /userdata/roms/amiga500
ln -sf /media/disk/amigacd32 /userdata/roms/amigacd32
ln -sf /media/disk/amigacdtv /userdata/roms/amigacdtv
ln -sf /media/disk/amstradcpc /userdata/roms/amstradcpc
ln -sf /media/disk/apfm1000 /userdata/roms/apfm1000
ln -sf /media/disk/apple2 /userdata/roms/apple2
ln -sf /media/disk/apple2gs /userdata/roms/apple2gs
ln -sf /media/disk/arcadia /userdata/roms/arcadia
ln -sf /media/disk/archimedes /userdata/roms/archimedes
ln -sf /media/disk/arduboy /userdata/roms/arduboy
ln -sf /media/disk/astrocde /userdata/roms/astrocde
ln -sf /media/disk/atari2600 /userdata/roms/atari2600
ln -sf /media/disk/atari5200 /userdata/roms/atari5200
ln -sf /media/disk/atari7800 /userdata/roms/atari7800
ln -sf /media/disk/atari800 /userdata/roms/atari800
ln -sf /media/disk/atarist /userdata/roms/atarist
ln -sf /media/disk/atom /userdata/roms/atom
ln -sf /media/disk/atomiswave /userdata/roms/atomiswave
ln -sf /media/disk/bbc /userdata/roms/bbc
ln -sf /media/disk/cl128 /userdata/roms/cl128
ln -sf /media/disk/c20 /userdata/roms/c20
ln -sf /media/disk/c64 /userdata/roms/c64
ln -sf /media/disk/camplynx /userdata/roms/camplynx
ln -sf /media/disk/cannonball /userdata/roms/cannonball
ln -sf /media/disk/cavestory /userdata/roms/cavestory
ln -sf /media/disk/cdi /userdata/roms/cdi
ln -sf /media/disk/cdogs /userdata/roms/cdogs
ln -sf /media/disk/cgenius /userdata/roms/cgenius
ln -sf /media/disk/channelf /userdata/roms/channelf
ln -sf /media/disk/chihiro /userdata/roms/chihiro
ln -sf /media/disk/coco /userdata/roms/coco
ln -sf /media/disk/colecovision /userdata/roms/colecovision
ln -sf /media/disk/commanderx16 /userdata/roms/commanderx16
ln -sf /media/disk/corsixth /userdata/roms/corsixth
ln -sf /media/disk/cplus4 /userdata/roms/cplus4
ln -sf /media/disk/crvision /userdata/roms/crvision
ln -sf /media/disk/daphne /userdata/roms/daphne
ln -sf /media/disk/devilutionx /userdata/roms/devilutionx
ln -sf /media/disk/doom3 /userdata/roms/doom3
ln -sf /media/disk/dos /userdata/roms/dos
ln -sf /media/disk/dreamcast /userdata/roms/dreamcast
ln -sf /media/disk/dxx-rebirth /userdata/roms/dxx-rebirth
ln -sf /media/disk/easyrpg /userdata/roms/easyrpg
ln -sf /media/disk/ecwolf /userdata/roms/ecwolf
ln -sf /media/disk/eduke32 /userdata/roms/eduke32
ln -sf /media/disk/electron /userdata/roms/electron
ln -sf /media/disk/etlegacy /userdata/roms/etlegacy
ln -sf /media/disk/fallout1-ce /userdata/roms/fallout1-ce
ln -sf /media/disk/fallout2-ce /userdata/roms/fallout2-ce
ln -sf /media/disk/fbneo /userdata/roms/fbneo
ln -sf /media/disk/fds /userdata/roms/fds
ln -sf /media/disk/flash /userdata/roms/flash
ln -sf /media/disk/flatpak /userdata/roms/flatpak
ln -sf /media/disk/fm7 /userdata/roms/fm7
ln -sf /media/disk/fmtowns /userdata/roms/fmtowns
ln -sf /media/disk/fpinball /userdata/roms/fpinball
ln -sf /media/disk/fury /userdata/roms/fury
ln -sf /media/disk/gamate /userdata/roms/gamate
ln -sf /media/disk/gameandwatch /userdata/roms/gameandwatch
ln -sf /media/disk/gamecom /userdata/roms/gamecom
ln -sf /media/disk/gamecube /userdata/roms/gamecube
ln -sf /media/disk/gamegear /userdata/roms/gamegear
ln -sf /media/disk/gamepock /userdata/roms/gamepock
ln -sf /media/disk/gb /userdata/roms/gb
ln -sf /media/disk/gb2players /userdata/roms/gb2players
ln -sf /media/disk/gba /userdata/roms/gba
ln -sf /media/disk/gbc /userdata/roms/gbc
ln -sf /media/disk/gbc2players /userdata/roms/gbc2players
ln -sf /media/disk/gmaster /userdata/roms/gmaster
ln -sf /media/disk/gp32 /userdata/roms/gp32
ln -sf /media/disk/gx4000 /userdata/roms/gx4000
ln -sf /media/disk/gzdoom /userdata/roms/gzdoom
ln -sf /media/disk/hcl /userdata/roms/hcl
ln -sf /media/disk/hurrican /userdata/roms/hurrican
ln -sf /media/disk/ikemen /userdata/roms/ikemen
ln -sf /media/disk/intellivision /userdata/roms/intellivision
ln -sf /media/disk/iortcw /userdata/roms/iortcw
ln -sf /media/disk/jaguar /userdata/roms/jaguar
ln -sf /media/disk/jaguarcd /userdata/roms/jaguarcd
ln -sf /media/disk/jazz2 /userdata/roms/jazz2
ln -sf /media/disk/laser310 /userdata/roms/laser310
ln -sf /media/disk/lcdgames /userdata/roms/lcdgames
ln -sf /media/disk/lowresnx /userdata/roms/lowresnx
ln -sf /media/disk/lutro /userdata/roms/lutro
ln -sf /media/disk/lynx /userdata/roms/lynx
ln -sf /media/disk/macintosh /userdata/roms/macintosh
ln -sf /media/disk/mame /userdata/roms/mame
ln -sf /media/disk/mastersystem /userdata/roms/mastersystem
ln -sf /media/disk/megadrive /userdata/roms/megadrive
ln -sf /media/disk/megaduck /userdata/roms/megaduck
ln -sf /media/disk/model2 /userdata/roms/model2
ln -sf /media/disk/model3 /userdata/roms/model3
ln -sf /media/disk/moonlight /userdata/roms/moonlight
ln -sf /media/disk/mrboom /userdata/roms/mrboom
ln -sf /media/disk/msu-md /userdata/roms/msu-md
ln -sf /media/disk/msx1 /userdata/roms/msx1
ln -sf /media/disk/msx2 /userdata/roms/msx2
ln -sf /media/disk/msx2+ /userdata/roms/msx2+
ln -sf /media/disk/msxturbor /userdata/roms/msxturbor
ln -sf /media/disk/mugen /userdata/roms/mugen
ln -sf /media/disk/multivision /userdata/roms/multivision
ln -sf /media/disk/n64 /userdata/roms/n64
ln -sf /media/disk/n64dd /userdata/roms/n64dd
ln -sf /media/disk/namco2x6 /userdata/roms/namco2x6
ln -sf /media/disk/naomi /userdata/roms/naomi
ln -sf /media/disk/naomi2 /userdata/roms/naomi2
ln -sf /media/disk/nds /userdata/roms/nds
ln -sf /media/disk/neogeo /userdata/roms/neogeo
ln -sf /media/disk/neogeocd /userdata/roms/neogeocd
ln -sf /media/disk/nes /userdata/roms/nes
ln -sf /media/disk/ngp /userdata/roms/ngp
ln -sf /media/disk/ngpc /userdata/roms/ngpc
ln -sf /media/disk/o2em /userdata/roms/o2em
ln -sf /media/disk/odcommander /userdata/roms/odcommander
ln -sf /media/disk/openbor /userdata/roms/openbor
ln -sf /media/disk/openjazz /userdata/roms/openjazz
ln -sf /media/disk/openlara /userdata/roms/openlara
ln -sf /media/disk/pc88 /userdata/roms/pc88
ln -sf /media/disk/pc98 /userdata/roms/pc98
ln -sf /media/disk/pcengine /userdata/roms/pcengine
ln -sf /media/disk/pcenginecd /userdata/roms/pcenginecd
ln -sf /media/disk/pcfx /userdata/roms/pcfx
ln -sf /media/disk/pdp1 /userdata/roms/pdp1
ln -sf /media/disk/pet /userdata/roms/pet
ln -sf /media/disk/pico /userdata/roms/pico
ln -sf /media/disk/pico8 /userdata/roms/pico8
ln -sf /media/disk/plugnplay /userdata/roms/plugnplay
ln -sf /media/disk/pokemini /userdata/roms/pokemini
ln -sf /media/disk/ports /userdata/roms/ports
ln -sf /media/disk/prboom /userdata/roms/prboom
ln -sf /media/disk/ps2 /userdata/roms/ps2
ln -sf /media/disk/ps3 /userdata/roms/ps3
ln -sf /media/disk/psp /userdata/roms/psp
ln -sf /media/disk/psvita /userdata/roms/psvita
ln -sf /media/disk/psx /userdata/roms/psx
ln -sf /media/disk/pv1000 /userdata/roms/pv1000
ln -sf /media/disk/pygame /userdata/roms/pygame
ln -sf /media/disk/pyxel /userdata/roms/pyxel
ln -sf /media/disk/quake3 /userdata/roms/quake3
ln -sf /media/disk/raze /userdata/roms/raze
ln -sf /media/disk/reminiscence /userdata/roms/reminiscence
ln -sf /media/disk/rott /userdata/roms/rott
ln -sf /media/disk/samcoupe /userdata/roms/samcoupe
ln -sf /media/disk/satellaview /userdata/roms/satellaview
ln -sf /media/disk/saturn /userdata/roms/saturn
ln -sf /media/disk/scummvm /userdata/roms/scummvm
ln -sf /media/disk/sdlpop /userdata/roms/sdlpop
ln -sf /media/disk/sega32x /userdata/roms/sega32x
ln -sf /media/disk/segacd /userdata/roms/segacd
ln -sf /media/disk/sg1000 /userdata/roms/sg1000
ln -sf /media/disk/sgb /userdata/roms/sgb
ln -sf /media/disk/singe /userdata/roms/singe
ln -sf /media/disk/snes /userdata/roms/snes
ln -sf /media/disk/snes-msu1 /userdata/roms/snes-msu1
ln -sf /media/disk/socrates /userdata/roms/socrates
ln -sf /media/disk/solarus /userdata/roms/solarus
ln -sf /media/disk/sonic3-air /userdata/roms/sonic3-air
ln -sf /media/disk/sonic-mania /userdata/roms/sonic-mania
ln -sf /media/disk/sonicretro /userdata/roms/sonicretro
ln -sf /media/disk/spectravideo /userdata/roms/spectravideo
ln -sf /media/disk/steam /userdata/roms/steam
ln -sf /media/disk/sufami /userdata/roms/sufami
ln -sf /media/disk/superbroswar /userdata/roms/superbroswar
ln -sf /media/disk/supergrafx /userdata/roms/supergrafx
ln -sf /media/disk/supervision /userdata/roms/supervision
ln -sf /media/disk/supracan /userdata/roms/supracan
ln -sf /media/disk/systemsp /userdata/roms/systemsp
ln -sf /media/disk/theforceengine /userdata/roms/theforceengine
ln -sf /media/disk/thextech /userdata/roms/thextech
ln -sf /media/disk/thomson /userdata/roms/thomson
ln -sf /media/disk/ti99 /userdata/roms/ti99
ln -sf /media/disk/tic80 /userdata/roms/tic80
ln -sf /media/disk/triforce /userdata/roms/triforce
ln -sf /media/disk/tutor /userdata/roms/tutor
ln -sf /media/disk/tyrian /userdata/roms/tyrian
ln -sf /media/disk/tyrquake /userdata/roms/tyrquake
ln -sf /media/disk/uzebox /userdata/roms/uzebox
ln -sf /media/disk/vc4000 /userdata/roms/vc4000
ln -sf /media/disk/vectrex /userdata/roms/vectrex
ln -sf /media/disk/vgmplay /userdata/roms/vgmplay
ln -sf /media/disk/videopacplus /userdata/roms/videopacplus
ln -sf /media/disk/vircon32 /userdata/roms/vircon32
ln -sf /media/disk/virtualboy /userdata/roms/virtualboy
ln -sf /media/disk/vis /userdata/roms/vis
ln -sf /media/disk/vitaquake2 /userdata/roms/vitaquake2
ln -sf /media/disk/vpinball /userdata/roms/vpinball
ln -sf /media/disk/vsmile /userdata/roms/vsmile
ln -sf /media/disk/wasm4 /userdata/roms/wasm4
ln -sf /media/disk/wii /userdata/roms/wii
ln -sf /media/disk/wiiu /userdata/roms/wiiu
ln -sf /media/disk/windows /userdata/roms/windows
ln -sf /media/disk/windows_installers /userdata/roms/windows_installers
ln -sf /media/disk/wswan /userdata/roms/wswan
ln -sf /media/disk/wswanc /userdata/roms/wswanc
ln -sf /media/disk/x1 /userdata/roms/x1
ln -sf /media/disk/x68000 /userdata/roms/x68000
ln -sf /media/disk/xash3d_fwgs /userdata/roms/xash3d_fwgs
ln -sf /media/disk/xbox /userdata/roms/xbox
ln -sf /media/disk/xbox360 /userdata/roms/xbox360
ln -sf /media/disk/xegs /userdata/roms/xegs
ln -sf /media/disk/xrick /userdata/roms/xrick
ln -sf /media/disk/zc210 /userdata/roms/zc210
ln -sf /media/disk/zx81 /userdata/roms/zx81
ln -sf /media/disk/zxspectrum /userdata/roms/zxspectrum

echo -e "${GREEN}Batocera Disk Player was succesfully installed !${NC}"
read -p "A reboot is strongly recommanded. Reboot now ? (Y/n)" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Job done, have fun !"
    exit 1
fi
reboot
