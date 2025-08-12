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

    read -p "Do you really want to uninstall Batocera Disk Player ?" -n 1 -r
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
    sed -i "/${LINE_TO_REMOVE}/d" "$CUSTOM_SH_FILE"

    echo -e "${BLUE}Removing symlinks...${NC}"
    for rom in 3do 3ds abuse adam advision amiga1200 amiga500 amigacd32 amigacdtv amstradcpc apfm1000 apple2 apple2gs arcadia archimedes arduboy astrocde atari2600 atari5200 atari7800 atari800 atarist atom atomiswave bbc cl128 c20 c64 camplynx cannonball cavestory cdi cdogs cgenius channelf chihiro coco colecovision commanderx16 corsixth cplus4 crvision daphne devilutionx doom3 dos dreamcast dxx-rebirth easyrpg ecwolf eduke32 electron etlegacy fallout1-ce fallout2-ce fbneo fds flash flatpak fm7 fmtowns fpinball fury gamate gameandwatch gamecom gamecube gamegear gamepock gb gb2players gba gbc gbc2players gmaster gp32 gx4000 gzdoom hcl hurrican ikemen intellivision iortcw jaguar jaguarcd jazz2 laser310 lcdgames lowresnx lutro lynx macintosh mame mastersystem megadrive megaduck model2 model3 moonlight mrboom msu-md msx1 msx2 msx2+ msxturbor mugen multivision n64 n64dd namco2x6 naomi naomi2 nds neogeo neogeocd nes ngp ngpc o2em odcommander openbor openjazz openlara pc88 pc98 pcengine pcenginecd pcfx pdp1 pet pico pico8 plugnplay pokemini ports prboom ps2 ps3 psp psvita psx pv1000 pygame pyxel quake3 raze reminiscence rott samcoupe satellaview saturn scummvm sdlpop sega32x segacd sg1000 sgb singe snes snes-msu1 socrates solarus sonic3-air sonic-mania sonicretro spectravideo steam sufami superbroswar supergrafx supervision supracan systemsp theforceengine thextech thomson ti99 tic80 triforce tutor tyrian tyrquake uzebox vc4000 vectrex vgmplay videopacplus vircon32 virtualboy vis vitaquake2 vpinball vsmile wasm4 wii wiiu windows windows_installers wswan wswanc x1 x68000 xash3d_fwgs xbox xbox360 xegs xrick zc210 zx81 zxspectrum; do
        unlink "/userdata/roms/$rom"
    done

    echo -e "${GREEN}Batocera Disk Player was succesfully uninstalled !${NC}"
    read -p "A reboot is strongly recommanded. Reboot now ? (Y/n)" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Job done, goodbye !"
        exit 1
    fi
    reboot

else
    echo "Batocera Disk Player is not installed."
fi