#include "cl.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

#define CL_CONFIG "/home/ben/.config/dwm/colors"

static char color_fg[8]         = "#ffffff"; 
static char color_bg[8]         = "#1b1b1b";
static char color_border[8]     = "#1b1b1b";
static char color_sel_fg[8]     = "#1b1b1b";
static char color_sel_bg[8]     = "#ffffff";
static char color_sel_border[8] = "#ffffff";

void refresh_dmenucmd(char* fg, char* bg, char* sfg, char* sbg);
void refresh_scheme(void);

static inline bool ishexchar(char* s)
{
    switch (*s) {
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
        return 1;
    }
    return isdigit(*s);
}

static inline bool ishexcolor(char* s)
{
    if (*s++ != '#') {
        return 0;
    }
    for (; ishexchar(s); ++s) {  }
    return !*s;
}

void cl_refresh(void)
{

    char tmp_fg[8]         = "#ffffff"; 
    char tmp_bg[8]         = "#1b1b1b";
    char tmp_border[8]     = "#1b1b1b";
    char tmp_sel_fg[8]     = "#1b1b1b";
    char tmp_sel_bg[8]     = "#ffffff";
    char tmp_sel_border[8] = "#ffffff";

    FILE* f = fopen(CL_CONFIG, "r");

    if (!f) { 
        refresh_dmenucmd(color_fg, color_bg, color_sel_fg, color_sel_bg);
        refresh_scheme();
        return;
    }

    char*    l = NULL;
    uint64_t c = 0;


    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_fg, l, 7);
    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_bg, l, 7);
    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_border, l, 7);
    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_sel_fg, l, 7);
    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_sel_bg, l, 7);
    if (getline(&l, &c, f) < 7) { goto end; }
    memcpy(tmp_sel_border, l, 7);

    if (!ishexcolor(tmp_fg)) { goto end; }
    if (!ishexcolor(tmp_bg)) { goto end; }
    if (!ishexcolor(tmp_border)) { goto end; }
    if (!ishexcolor(tmp_sel_fg)) { goto end; }
    if (!ishexcolor(tmp_sel_bg)) { goto end; }
    if (!ishexcolor(tmp_sel_border)) { goto end; }

    memcpy(color_fg,         tmp_fg, 7);
    memcpy(color_bg,         tmp_bg, 7);
    memcpy(color_border,     tmp_border, 7);
    memcpy(color_sel_fg,     tmp_sel_fg, 7);
    memcpy(color_sel_bg,     tmp_sel_bg, 7);
    memcpy(color_sel_border, tmp_sel_border, 7);

end:

    refresh_dmenucmd(color_fg, color_bg, color_sel_fg, color_sel_bg);
    refresh_scheme();

    free(l);
    fclose(f);
}

char* cl_get_fg(void)         { return color_fg; }
char* cl_get_bg(void)         { return color_bg; }
char* cl_get_border(void)     { return color_border; }
char* cl_get_sel_fg(void)     { return color_sel_fg; }
char* cl_get_sel_bg(void)     { return color_sel_bg; }
char* cl_get_sel_border(void) { return color_sel_border; }
