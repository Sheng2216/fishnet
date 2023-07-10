#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Colors
# -----------------------------------------------------------------------------

COLOR_INFO="\e[32m" # green
COLOR_WARNING="\e[33m" # yellow
COLOR_ERROR="\e[31m" # red
COLOR_END="\e[0m"

WIDTH=20

function pad() {
    
    TEXT=$1
    LENGTH=$2
    FILL=$3
    
    START=$( echo $TEXT | wc -c )
    COUNT=$(( $LENGTH - $START ))
    printf "$TEXT"
    for (( i = 0; i < "$COUNT"; ++i )); do printf "$FILL"; done

}

# -----------------------------------------------------------------------------
# Tests
# -----------------------------------------------------------------------------

function test_corecell {

    DEVICE=$1
    
    pad $DEVICE $WIDTH " "
    pad "Corecell" $WIDTH " "
    
    local COM_TYPE=""
    if [[ "$DEVICE" == *"tty"* ]]; then COM_TYPE="-u"; fi
    OUTPUT=$( timeout ${TIMEOUT:-3}s artifacts/corecell/chip_id $COM_TYPE -d $DEVICE )
    STATUS=$?
    
    if [[ $STATUS -eq 0 ]]; then
        EUI=$( echo $OUTPUT | grep 'EUI' | sed 's/^.*0x//' | tr [a-z] [A-Z] )
        pad $EUI $WIDTH " "
        FOUND=1
    fi

    echo ""

}

# -----------------------------------------------------------------------------
# Create reset file
# -----------------------------------------------------------------------------

cp reset_lgw.sh.legacy reset_lgw.sh
sed -i "s#{{RESET_GPIO}}#\"${RESET_GPIO:-6 17}\"#" reset_lgw.sh
sed -i "s#{{POWER_EN_GPIO}}#${POWER_EN_GPIO:-0}#" reset_lgw.sh
sed -i "s#{{POWER_EN_LOGIC}}#${POWER_EN_LOGIC:-0}#" reset_lgw.sh
chmod +x reset_lgw.sh

# -----------------------------------------------------------------------------
# Test all devices
# -----------------------------------------------------------------------------

pad "DEVICE" $WIDTH " "
pad "DESIGN" $WIDTH " "
pad "RESPONSE" $WIDTH " "; echo ""
pad "" $WIDTH "-"
pad "" $WIDTH "-"
pad "" $WIDTH "-"; echo ""

SCAN_USB=${SCAN_USB:-1}
SCAN_SPI=${SCAN_SPI:-1}

if [[ $SCAN_USB -eq 1 ]]; then
    if [[ $SCAN_SPI -eq 1 ]]; then
        DEVICES=$( ls /dev/spidev* /dev/ttyACM* /dev/ttyUSB* 2> /dev/null )
    else
        DEVICES=$( ls /dev/ttyACM* /dev/ttyUSB* 2> /dev/null )
    fi
else
    if [[ $SCAN_SPI -eq 1 ]]; then
        DEVICES=$( ls /dev/spidev* 2> /dev/null )
    else
        DEVICES=""
    fi
fi

for DEVICE in $DEVICES; do
    FOUND=0
    [[ $FOUND -eq 0 ]] && test_corecell $DEVICE
done