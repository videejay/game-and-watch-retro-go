#!/bin/bash
set -xe

# Would be nice to clone the repo with submodules. If you know how to do this, please make a PR!
git submodule update --init --recursive

# NES
curl -L -o roms/nes/pwn.nes https://github.com/Vector35/PwnAdventureZ/blob/master/PwnAdventureZ-csaw-withkeys.nes?raw=true

# GB
curl -L -o roms/gb/matrix-rain.gb https://github.com/wtjones/matrix-rain-gb/releases/download/0.0.3/matrix-rain.gb


# Download and install GG and SMS open source demoscene ROM
curl -L -o sega_tween.zip https://files.scene.org/get/demos/artists/ben_ryves/sega_tween.zip
unzip sega_tween.zip
cp 'Sega Tween (Normal).gg' roms/gg
cp 'Sega Tween (Normal).sms' roms/sms

make -j $(nproc)
