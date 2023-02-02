// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    { " ", "", 6000, 0 },
    { "", "sensors | awk '/Core 0/ {print $3}'", 10, 0 },
    { "", "cpu", 30, 0 },
    { "", "memory", 30, 0 },
    { "", "clock", 1, 0 },
    { "", "battery", 60, 0 },
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
