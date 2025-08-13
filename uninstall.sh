#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
CUSTOM_SH_FILE="/userdata/system/custom.sh"
LINE_TO_REMOVE="python3 /userdata/system/disk.py &"
BATODISC_INSTALLED="/userdata/system/disk.py"
clear

echo -e "${BLUE}============================================================${NC}"
echo -e "${YELLOW}              Batocera Disk Player Uninstaller            ${NC}"
echo -e "${BLUE}============================================================${NC}"

# Checking if Batocera Disk Player is installed
if [ -f "$BATODISC_INSTALLED" ]; then

    read -p "Do you really want to uninstall Batocera Disk Player ? (Y/N)" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting..."
        exit 1
    fi

    echo -e "${BLUE}Unistalling Batocera Disc Player service...${NC}"
    pkill -9 -f python3
    rm -rf /userdata/system/disk.py

    echo -e "${BLUE}Removing mount point folder...${NC}"
    rm -rf /media/disk

    echo -e "${BLUE}Uninstalling startup script...${NC}"
    sed -i "#${LINE_TO_REMOVE}#d" "$CUSTOM_SH_FILE"

    echo -e "${BLUE}Removing symlinks...${NC}"
    unlink /userdata/roms/3do/3do
    unlink /userdata/roms/3ds/3ds
    unlink /userdata/roms/abuse/abuse
    unlink /userdata/roms/adam/adam
    unlink /userdata/roms/advision/advision
    unlink /userdata/roms/amiga1200/amiga1200
    unlink /userdata/roms/amiga500/amiga500
    unlink /userdata/roms/amigacd32/amigacd32
    unlink /userdata/roms/amigacdtv/amigacdtv
    unlink /userdata/roms/amstradcpc/amstradcpc
    unlink /userdata/roms/apfm1000/apfm1000
    unlink /userdata/roms/apple2/apple2
    unlink /userdata/roms/apple2gs/apple2gs
    unlink /userdata/roms/arcadia/arcadia
    unlink /userdata/roms/archimedes/archimedes
    unlink /userdata/roms/arduboy/arduboy
    unlink /userdata/roms/astrocde/astrocde
    unlink /userdata/roms/atari2600/atari2600
    unlink /userdata/roms/atari5200/atari5200
    unlink /userdata/roms/atari7800/atari7800
    unlink /userdata/roms/atari800/atari800
    unlink /userdata/roms/atarist/atarist
    unlink /userdata/roms/atom/atom
    unlink /userdata/roms/atomiswave/atomiswave
    unlink /userdata/roms/bbc/bbc
    unlink /userdata/roms/cl128/cl128
    unlink /userdata/roms/c20/c20
    unlink /userdata/roms/c64/c64
    unlink /userdata/roms/camplynx/camplynx
    unlink /userdata/roms/cannonball/cannonball
    unlink /userdata/roms/cavestory/cavestory
    unlink /userdata/roms/cdi/cdi
    unlink /userdata/roms/cdogs/cdogs
    unlink /userdata/roms/cgenius/cgenius
    unlink /userdata/roms/channelf/channelf
    unlink /userdata/roms/chihiro/chihiro
    unlink /userdata/roms/coco/coco
    unlink /userdata/roms/colecovision/colecovision
    unlink /userdata/roms/commanderx16/commanderx16
    unlink /userdata/roms/corsixth/corsixth
    unlink /userdata/roms/cplus4/cplus4
    unlink /userdata/roms/crvision/crvision
    unlink /userdata/roms/daphne/daphne
    unlink /userdata/roms/devilutionx/devilutionx
    unlink /userdata/roms/doom3/doom3
    unlink /userdata/roms/dos/dos
    unlink /userdata/roms/dreamcast/dreamcast
    unlink /userdata/roms/dxx-rebirth/dxx-rebirth
    unlink /userdata/roms/easyrpg/easyrpg
    unlink /userdata/roms/ecwolf/ecwolf
    unlink /userdata/roms/eduke32/eduke32
    unlink /userdata/roms/electron/electron
    unlink /userdata/roms/etlegacy/etlegacy
    unlink /userdata/roms/fallout1-ce/fallout1-ce
    unlink /userdata/roms/fallout2-ce/fallout2-ce
    unlink /userdata/roms/fbneo/fbneo
    unlink /userdata/roms/fds/fds
    unlink /userdata/roms/flash/flash
    unlink /userdata/roms/flatpak/flatpak
    unlink /userdata/roms/fm7/fm7
    unlink /userdata/roms/fmtowns/fmtowns
    unlink /userdata/roms/fpinball/fpinball
    unlink /userdata/roms/fury/fury
    unlink /userdata/roms/gamate/gamate
    unlink /userdata/roms/gameandwatch/gameandwatch
    unlink /userdata/roms/gamecom/gamecom
    unlink /userdata/roms/gamecube/gamecube
    unlink /userdata/roms/gamegear/gamegear
    unlink /userdata/roms/gamepock/gamepock
    unlink /userdata/roms/gb/gb
    unlink /userdata/roms/gb2players/gb2players
    unlink /userdata/roms/gba/gba
    unlink /userdata/roms/gbc/gbc
    unlink /userdata/roms/gbc2players/gbc2players
    unlink /userdata/roms/gmaster/gmaster
    unlink /userdata/roms/gp32/gp32
    unlink /userdata/roms/gx4000/gx4000
    unlink /userdata/roms/gzdoom/gzdoom
    unlink /userdata/roms/hcl/hcl
    unlink /userdata/roms/hurrican/hurrican
    unlink /userdata/roms/ikemen/ikemen
    unlink /userdata/roms/intellivision/intellivision
    unlink /userdata/roms/iortcw/iortcw
    unlink /userdata/roms/jaguar/jaguar
    unlink /userdata/roms/jaguarcd/jaguarcd
    unlink /userdata/roms/jazz2/jazz2
    unlink /userdata/roms/laser310/laser310
    unlink /userdata/roms/lcdgames/lcdgames
    unlink /userdata/roms/lowresnx/lowresnx
    unlink /userdata/roms/lutro/lutro
    unlink /userdata/roms/lynx/lynx
    unlink /userdata/roms/macintosh/macintosh
    unlink /userdata/roms/mame/mame
    unlink /userdata/roms/mastersystem/mastersystem
    unlink /userdata/roms/megadrive/megadrive
    unlink /userdata/roms/megaduck/megaduck
    unlink /userdata/roms/model2/model2
    unlink /userdata/roms/model3/model3
    unlink /userdata/roms/moonlight/moonlight
    unlink /userdata/roms/mrboom/mrboom
    unlink /userdata/roms/msu-md/msu-md
    unlink /userdata/roms/msx1/msx1
    unlink /userdata/roms/msx2/msx2
    unlink /userdata/roms/msx2+/msx2+
    unlink /userdata/roms/msxturbor/msxturbor
    unlink /userdata/roms/mugen/mugen
    unlink /userdata/roms/multivision/multivision
    unlink /userdata/roms/n64/n64
    unlink /userdata/roms/n64dd/n64dd
    unlink /userdata/roms/namco2x6/namco2x6
    unlink /userdata/roms/naomi/naomi
    unlink /userdata/roms/naomi2/naomi2
    unlink /userdata/roms/nds/nds
    unlink /userdata/roms/neogeo/neogeo
    unlink /userdata/roms/neogeocd/neogeocd
    unlink /userdata/roms/nes/nes
    unlink /userdata/roms/ngp/ngp
    unlink /userdata/roms/ngpc/ngpc
    unlink /userdata/roms/o2em/o2em
    unlink /userdata/roms/odcommander/odcommander
    unlink /userdata/roms/openbor/openbor
    unlink /userdata/roms/openjazz/openjazz
    unlink /userdata/roms/openlara/openlara
    unlink /userdata/roms/pc88/pc88
    unlink /userdata/roms/pc98/pc98
    unlink /userdata/roms/pcengine/pcengine
    unlink /userdata/roms/pcenginecd/pcenginecd
    unlink /userdata/roms/pcfx/pcfx
    unlink /userdata/roms/pdp1/pdp1
    unlink /userdata/roms/pet/pet
    unlink /userdata/roms/pico/pico
    unlink /userdata/roms/pico8/pico8
    unlink /userdata/roms/plugnplay/plugnplay
    unlink /userdata/roms/pokemini/pokemini
    unlink /userdata/roms/ports/ports
    unlink /userdata/roms/prboom/prboom
    unlink /userdata/roms/ps2/ps2
    unlink /userdata/roms/ps3/ps3
    unlink /userdata/roms/psp/psp
    unlink /userdata/roms/psvita/psvita
    unlink /userdata/roms/psx/psx
    unlink /userdata/roms/pv1000/pv1000
    unlink /userdata/roms/pygame/pygame
    unlink /userdata/roms/pyxel/pyxel
    unlink /userdata/roms/quake3/quake3
    unlink /userdata/roms/raze/raze
    unlink /userdata/roms/reminiscence/reminiscence
    unlink /userdata/roms/rott/rott
    unlink /userdata/roms/samcoupe/samcoupe
    unlink /userdata/roms/satellaview/satellaview
    unlink /userdata/roms/saturn/saturn
    unlink /userdata/roms/scummvm/scummvm
    unlink /userdata/roms/sdlpop/sdlpop
    unlink /userdata/roms/sega32x/sega32x
    unlink /userdata/roms/segacd/segacd
    unlink /userdata/roms/sg1000/sg1000
    unlink /userdata/roms/sgb/sgb
    unlink /userdata/roms/singe/singe
    unlink /userdata/roms/snes/snes
    unlink /userdata/roms/snes-msu1/snes-msu1
    unlink /userdata/roms/socrates/socrates
    unlink /userdata/roms/solarus/solarus
    unlink /userdata/roms/sonic3-air/sonic3-air
    unlink /userdata/roms/sonic-mania/sonic-mania
    unlink /userdata/roms/sonicretro/sonicretro
    unlink /userdata/roms/spectravideo/spectravideo
    unlink /userdata/roms/steam/steam
    unlink /userdata/roms/sufami/sufami
    unlink /userdata/roms/superbroswar/superbroswar
    unlink /userdata/roms/supergrafx/supergrafx
    unlink /userdata/roms/supervision/supervision
    unlink /userdata/roms/supracan/supracan
    unlink /userdata/roms/systemsp/systemsp
    unlink /userdata/roms/theforceengine/theforceengine
    unlink /userdata/roms/thextech/thextech
    unlink /userdata/roms/thomson/thomson
    unlink /userdata/roms/ti99/ti99
    unlink /userdata/roms/tic80/tic80
    unlink /userdata/roms/triforce/triforce
    unlink /userdata/roms/tutor/tutor
    unlink /userdata/roms/tyrian/tyrian
    unlink /userdata/roms/tyrquake/tyrquake
    unlink /userdata/roms/uzebox/uzebox
    unlink /userdata/roms/vc4000/vc4000
    unlink /userdata/roms/vectrex/vectrex
    unlink /userdata/roms/vgmplay/vgmplay
    unlink /userdata/roms/videopacplus/videopacplus
    unlink /userdata/roms/vircon32/vircon32
    unlink /userdata/roms/virtualboy/virtualboy
    unlink /userdata/roms/vis/vis
    unlink /userdata/roms/vitaquake2/vitaquake2
    unlink /userdata/roms/vpinball/vpinball
    unlink /userdata/roms/vsmile/vsmile
    unlink /userdata/roms/wasm4/wasm4
    unlink /userdata/roms/wii/wii
    unlink /userdata/roms/wiiu/wiiu
    unlink /userdata/roms/windows/windows
    unlink /userdata/roms/windows_installers/windows_installers
    unlink /userdata/roms/wswan/wswan
    unlink /userdata/roms/wswanc/wswanc
    unlink /userdata/roms/x1/x1
    unlink /userdata/roms/x68000/x68000
    unlink /userdata/roms/xash3d_fwgs/xash3d_fwgs
    unlink /userdata/roms/xbox/xbox
    unlink /userdata/roms/xbox360/xbox360
    unlink /userdata/roms/xegs/xegs
    unlink /userdata/roms/xrick/xrick
    unlink /userdata/roms/zc210/zc210
    unlink /userdata/roms/zx81/zx81
    unlink /userdata/roms/zxspectrum/zxspectrum

    echo -e "${GREEN}Batocera Disk Player was succesfully uninstalled !${NC}"
    read -p "A reboot is strongly recommanded. Reboot now ? (Y/n)" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Job done, goodbye !"
        rm -- "$0"
        exit 1
    fi
    rm -- "$0"
    reboot

else
    echo "Batocera Disk Player is not installed."
    rm -- "$0"
fi
