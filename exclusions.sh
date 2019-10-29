#!/bin/bash

AMSTRADPC=$(cat /usr/share/L4Menu/exclusions/amstradpc)
ARCADE=$(cat /usr/share/L4Menu/exclusions/arcade)
ATARI2600=$(cat /usr/share/L4Menu/exclusions/atari2600)
ATARI5200=$(cat /usr/share/L4Menu/exclusions/atari5200)
ATARI7800=$(cat /usr/share/L4Menu/exclusions/atari7800)
ATARI800=$(cat /usr/share/L4Menu/exclusions/atari800)
ATARILYNX=$(cat /usr/share/L4Menu/exclusions/atarilynx)
DAPHNE=$(cat /usr/share/L4Menu/exclusions/daphne)
FBA=$(cat /usr/share/L4Menu/exclusions/fba)
FDS=$(cat /usr/share/L4Menu/exclusions/fds)
GAMEGEAR=$(cat /usr/share/L4Menu/exclusions/gamegear)
GB=$(cat /usr/share/L4Menu/exclusions/gb)
GBA=$(cat /usr/share/L4Menu/exclusions/gba)
GBC=$(cat /usr/share/L4Menu/exclusions/gbc)
GC=$(cat /usr/share/L4Menu/exclusions/gc)
GENESIS=$(cat /usr/share/L4Menu/exclusions/genesis)
MAMEADVMAME=$(cat /usr/share/L4Menu/exclusions/mameadvmame)
MAMELIBRETRO=$(cat /usr/share/L4Menu/exclusions/mamelibretro)
MAMEMAME4ALL=$(cat /usr/share/L4Menu/exclusions/mamemame4all)
MASTERSYSTEM=$(cat /usr/share/L4Menu/exclusions/mastersystem)
MEGADRIVE=$(cat /usr/share/L4Menu/exclusions/megadrive)
N64=$(cat /usr/share/L4Menu/exclusions/n64)
NDS=$(cat /usr/share/L4Menu/exclusions/nds)
NEOGEO=$(cat /usr/share/L4Menu/exclusions/neogeo)
NES=$(cat /usr/share/L4Menu/exclusions/nes)
NGP=$(cat /usr/share/L4Menu/exclusions/ngp)
NGPC=$(cat /usr/share/L4Menu/exclusions/ngpc)
PORTS=$(cat /usr/share/L4Menu/exclusions/ports)
PS2=$(cat /usr/share/L4Menu/exclusions/ps2)
PSX=$(cat /usr/share/L4Menu/exclusions/psx)
SEGA32X=$(cat /usr/share/L4Menu/exclusions/sega32x)
SEGACD=$(cat /usr/share/L4Menu/exclusions/segacd)
SG1000=$(cat /usr/share/L4Menu/exclusions/sg1000)
SNES=$(cat /usr/share/L4Menu/exclusions/snes)
VECTREX=$(cat /usr/share/L4Menu/exclusions/vectrex)
WII=$(cat /usr/share/L4Menu/exclusions/wii)
ZXSPECTRUM=$(cat /usr/share/L4Menu/exclusions/zxspectrum)

function exclusions() {
  choices=$(whiptail \
    --title "Exclusions" \
    --separate-output \
    --noitem \
    --checklist "Select which emulators to EXCLUDE from syncing." 20 40 5 \
    "amstradpc" "" $AMSTRADPC \
    "arcade" "" $ARCADE \
    "atari2600" "" $ATARI2600 \
    "atari5200" "" $ATARI5200 \
    "atari7800" "" $ATARI7800 \
    "atari800" "" $ATARI800 \
    "atarilynx" "" $ATARILYNX \
    "daphne" "" $DAPHNE \
    "fba" "" $FBA \
    "fds" "" $FDS \
    "gamegear" "" $GAMEGEAR \
    "gb" "" $GB \
    "gba" "" $GBA \
    "gbc" "" $GBC \
    "gc" "" $GC \
    "genesis" "" $GENESIS \
    "mame-advmame" "" $MAMEADVMAME \
    "mame-libretro" "" $MAMELIBRETRO \
    "mame-mame4all" "" $MAMEMAME4ALL \
    "mastersystem" "" $MASTERSYSTEM \
    "megadrive" "" $MEGADRIVE \
    "n64" "" $N64 \
    "nds" "" $NDS \
    "neogeo" "" $NEOGEO \
    "nes" "" $NES \
    "ngp" "" $NGP \
    "ngpc" "" $NGPC \
    "ports" "" $PORTS \
    "ps2" "" $PS2 \
    "psp" "" $PSP \
    "psx" "" $PSX \
    "sega32x" "" $SEGA32X \
    "segacd" "" $SEGACD \
    "sg-1000" "" $SG1000 \
    "snes" "" $SNES \
    "vectrex" "" $VECTREX \
    "wii" "" $WII \
    "zxspectrum" "" $ZXSPECTRUM 3>&1 1>&2 2>&3)


    case $choices in
      amstradpc)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/amstradpc ; then
        echo ON > /usr/share/L4Menu/exclusions/amstradpc
      elif grep -q "ON" /usr/share/L4Menu/exclusions/amstradpc ; then
        echo OFF > /usr/share/L4Menu/exclusions/amstradpc
      fi
      ;;
      arcade)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/arcade ; then
        echo ON > /usr/share/L4Menu/exclusions/arcade
      elif grep -q "ON" /usr/share/L4Menu/exclusions/arcade ; then
        echo OFF > /usr/share/L4Menu/exclusions/arcade
      fi
      ;;
      atari2600)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atari2600 ; then
        echo ON > /usr/share/L4Menu/exclusions/atari2600
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atari2600 ; then
        echo OFF > /usr/share/L4Menu/exclusions/atari2600
      fi
      ;;
      atari5200)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atari5200 ; then
        echo ON > /usr/share/L4Menu/exclusions/atari5200
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atari5200 ; then
        echo OFF > /usr/share/L4Menu/exclusions/atari5200
      fi
      ;;
      atari7800)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atari7800 ; then
        echo ON > /usr/share/L4Menu/exclusions/atari7800
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atari7800 ; then
        echo OFF > /usr/share/L4Menu/exclusions/atari7800
      fi
      ;;
      atari800)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atari800 ; then
        echo ON > /usr/share/L4Menu/exclusions/atari800
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atari800 ; then
        echo OFF > /usr/share/L4Menu/exclusions/atari800
      fi
      ;;
      atarilynx)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atarilynx ; then
        echo ON > /usr/share/L4Menu/exclusions/atarilynx
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atarilynx ; then
        echo OFF > /usr/share/L4Menu/exclusions/atarilynx
      fi
      ;;
      daphne)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/daphne ; then
        echo ON > /usr/share/L4Menu/exclusions/daphne
      elif grep -q "ON" /usr/share/L4Menu/exclusions/daphne ; then
        echo OFF > /usr/share/L4Menu/exclusions/daphne
      fi
      ;;
      fba)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/fba ; then
        echo ON > /usr/share/L4Menu/exclusions/fba
      elif grep -q "ON" /usr/share/L4Menu/exclusions/fba ; then
        echo OFF > /usr/share/L4Menu/exclusions/fba
      fi
      ;;
      fds)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/atari800 ; then
        echo ON > /usr/share/L4Menu/exclusions/atari800
      elif grep -q "ON" /usr/share/L4Menu/exclusions/atari800 ; then
        echo OFF > /usr/share/L4Menu/exclusions/atari800
      fi
      ;;
      gamegear)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/gamegear ; then
        echo ON > /usr/share/L4Menu/exclusions/gamegear
      elif grep -q "ON" /usr/share/L4Menu/exclusions/gamegear ; then
        echo OFF > /usr/share/L4Menu/exclusions/gamegear
      fi
      ;;
      gb)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/gb ; then
        echo ON > /usr/share/L4Menu/exclusions/gb
      elif grep -q "ON" /usr/share/L4Menu/exclusions/gb ; then
        echo OFF > /usr/share/L4Menu/exclusions/gb
      fi
      ;;
      gba)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/gba ; then
        echo ON > /usr/share/L4Menu/exclusions/gba
      elif grep -q "ON" /usr/share/L4Menu/exclusions/gba ; then
        echo OFF > /usr/share/L4Menu/exclusions/gba
      fi
      ;;
      gbc)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/gbc ; then
        echo ON > /usr/share/L4Menu/exclusions/gbc
      elif grep -q "ON" /usr/share/L4Menu/exclusions/gbc ; then
        echo OFF > /usr/share/L4Menu/exclusions/gbc
      fi
      ;;
      gc)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/gc ; then
        echo ON > /usr/share/L4Menu/exclusions/gc
      elif grep -q "ON" /usr/share/L4Menu/exclusions/gc ; then
        echo OFF > /usr/share/L4Menu/exclusions/gc
      fi
      ;;
      genesis)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/genesis ; then
        echo ON > /usr/share/L4Menu/exclusions/genesis
      elif grep -q "ON" /usr/share/L4Menu/exclusions/genesis ; then
        echo OFF > /usr/share/L4Menu/exclusions/genesis
      fi
      ;;
      mame-mameadvmame)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/mameadvmame ; then
        echo ON > /usr/share/L4Menu/exclusions/mameadvmame
      elif grep -q "ON" /usr/share/L4Menu/exclusions/mameadvmame ; then
        echo OFF > /usr/share/L4Menu/exclusions/mameadvmame
      fi
      ;;
      mame-libretro)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/mamelibretro ; then
        echo ON > /usr/share/L4Menu/exclusions/mamelibretro
      elif grep -q "ON" /usr/share/L4Menu/exclusions/mamelibretro ; then
        echo OFF > /usr/share/L4Menu/exclusions/mamelibretro
      fi
      ;;
      mame-mame4all)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/mame4all ; then
        echo ON > /usr/share/L4Menu/exclusions/mame4all
      elif grep -q "ON" /usr/share/L4Menu/exclusions/mame4all ; then
        echo OFF > /usr/share/L4Menu/exclusions/mame4all
      fi
      ;;
      mastersystem)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/mastersystem ; then
        echo ON > /usr/share/L4Menu/exclusions/mastersystem
      elif grep -q "ON" /usr/share/L4Menu/exclusions/mastersystem ; then
        echo OFF > /usr/share/L4Menu/exclusions/mastersystem
      fi
      ;;
      megadrive)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/megadrive ; then
        echo ON > /usr/share/L4Menu/exclusions/megadrive
      elif grep -q "ON" /usr/share/L4Menu/exclusions/megadrive ; then
        echo OFF > /usr/share/L4Menu/exclusions/megadrive
      fi
      ;;
      n64)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/n64 ; then
        echo ON > /usr/share/L4Menu/exclusions/n64
      elif grep -q "ON" /usr/share/L4Menu/exclusions/n64 ; then
        echo OFF > /usr/share/L4Menu/exclusions/n64
      fi
      ;;
      nds)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/nds ; then
        echo ON > /usr/share/L4Menu/exclusions/nds
      elif grep -q "ON" /usr/share/L4Menu/exclusions/nds ; then
        echo OFF > /usr/share/L4Menu/exclusions/nds
      fi
      ;;
      neogeo)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/neogeo ; then
        echo ON > /usr/share/L4Menu/exclusions/neogeo
      elif grep -q "ON" /usr/share/L4Menu/exclusions/neogeo ; then
        echo OFF > /usr/share/L4Menu/exclusions/neogeo
      fi
      ;;
      nes)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/nes ; then
        echo ON > /usr/share/L4Menu/exclusions/nes
      elif grep -q "ON" /usr/share/L4Menu/exclusions/nes ; then
        echo OFF > /usr/share/L4Menu/exclusions/nes
      fi
      ;;
      ngp)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/ngp ; then
        echo ON > /usr/share/L4Menu/exclusions/ngp
      elif grep -q "ON" /usr/share/L4Menu/exclusions/ngp ; then
        echo OFF > /usr/share/L4Menu/exclusions/ngp
      fi
      ;;
      ngpc)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/ngpc ; then
        echo ON > /usr/share/L4Menu/exclusions/ngpc
      elif grep -q "ON" /usr/share/L4Menu/exclusions/ngpc ; then
        echo OFF > /usr/share/L4Menu/exclusions/ngpc
      fi
      ;;
      ports)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/ports ; then
        echo ON > /usr/share/L4Menu/exclusions/ports
      elif grep -q "ON" /usr/share/L4Menu/exclusions/ports ; then
        echo OFF > /usr/share/L4Menu/exclusions/ports
      fi
      ;;
      ps2)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/ps2 ; then
        echo ON > /usr/share/L4Menu/exclusions/ps2
      elif grep -q "ON" /usr/share/L4Menu/exclusions/ps2 ; then
        echo OFF > /usr/share/L4Menu/exclusions/ps2
      fi
      ;;
      psx)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/psx ; then
        echo ON > /usr/share/L4Menu/exclusions/psx
      elif grep -q "ON" /usr/share/L4Menu/exclusions/psx ; then
        echo OFF > /usr/share/L4Menu/exclusions/psx
      fi
      ;;
      sega32x)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/sega32x ; then
        echo ON > /usr/share/L4Menu/exclusions/sega32x
      elif grep -q "ON" /usr/share/L4Menu/exclusions/sega32x ; then
        echo OFF > /usr/share/L4Menu/exclusions/sega32x
      fi
      ;;
      segacd)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/segacd ; then
        echo ON > /usr/share/L4Menu/exclusions/segacd
      elif grep -q "ON" /usr/share/L4Menu/exclusions/segacd ; then
        echo OFF > /usr/share/L4Menu/exclusions/segacd
      fi
      ;;
      sg-1000)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/sg1000 ; then
        echo ON > /usr/share/L4Menu/exclusions/sg1000
      elif grep -q "ON" /usr/share/L4Menu/exclusions/sg1000 ; then
        echo OFF > /usr/share/L4Menu/exclusions/sg1000
      fi
      ;;
      snes)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/snes ; then
        echo ON > /usr/share/L4Menu/exclusions/snes
      elif grep -q "ON" /usr/share/L4Menu/exclusions/snes ; then
        echo OFF > /usr/share/L4Menu/exclusions/snes
      fi
      ;;
      vectrex)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/vectrex ; then
        echo ON > /usr/share/L4Menu/exclusions/vectrex
      elif grep -q "ON" /usr/share/L4Menu/exclusions/vectrex ; then
        echo OFF > /usr/share/L4Menu/exclusions/vectrex
      fi
      ;;
      wii)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/wii ; then
        echo ON > /usr/share/L4Menu/exclusions/wii
      elif grep -q "ON" /usr/share/L4Menu/exclusions/wii ; then
        echo OFF > /usr/share/L4Menu/exclusions/wii
      fi
      ;;
      zxspectrum)
      if grep -q "OFF" /usr/share/L4Menu/exclusions/zxspectrum ; then
        echo ON > /usr/share/L4Menu/exclusions/zxspectrum
      elif grep -q "ON" /usr/share/L4Menu/exclusions/zxspectrum ; then
        echo OFF > /usr/share/L4Menu/exclusions/zxspectrum
      fi
      ;;
      *)
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      ;;
    esac
}
exclusions
# done
# done < results
#
# exitstatus=$?
# if [ $exitstatus = 0 ]; then
#   echo Success_$OPTION
# else
#   echo Fail
# fi
