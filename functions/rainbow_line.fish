function rainbow_line
    set -f SECTION_COLUMNS (math --scale=0 $COLUMNS / 7)
    set -f COLOR_DELTA (math --base="hex" --scale=0 0xFF / $SECTION_COLUMNS)
    set -f RED 0x00
    set -f GREEN 0x00
    set -f BLUE 0x00

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f RED (math --base="hex" --scale=0 min 0xFF,(math --base="hex" --scale=0 $RED + $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f GREEN (math --base="hex" --scale=0 min 0xFF,(math --base="hex" --scale=0 $GREEN + $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f RED (math --base="hex" --scale=0 max 0x00,(math --base="hex" --scale=0 $RED - $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f BLUE (math --base="hex" --scale=0 min 0xFF,(math --base="hex" --scale=0 $BLUE + $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f GREEN (math --base="hex" --scale=0 max 0x00,(math --base="hex" --scale=0 $GREEN - $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq 1 $SECTION_COLUMNS)
        set -f RED (math --base="hex" --scale=0 min 0xFF,(math --base="hex" --scale=0 $RED + $COLOR_DELTA))
        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    for COL in (seq (math 6 "*" $SECTION_COLUMNS) (math $COLUMNS - 1))
        set -f RED (math --base="hex" --scale=0 max 0x00,(math --base="hex" --scale=0 $RED - $COLOR_DELTA))
        set -f BLUE (math --base="hex" --scale=0 max 0x00,(math --base="hex" --scale=0 $BLUE - $COLOR_DELTA))

        set_color --background (printf '%02x' $RED)(printf '%02x' $GREEN)(printf '%02x' $BLUE)
        echo -n " "
    end

    set_color --background normal
    echo ""
end
