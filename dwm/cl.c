#include "cl.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define CL_CONFIG "/home/ben/.config/dwm/colors"

static char color_fg[8]         = { 0 }; 
static char color_bg[8]         = { 0 };
static char color_border[8]     = { 0 };
static char color_sel_fg[8]     = { 0 };
static char color_sel_bg[8]     = { 0 };
static char color_sel_border[8] = { 0 };

void refresh_dmenucmd(char* fg, char* bg, char* sfg, char* sbg);

void cl_refresh(void)
{
    FILE* f = fopen(CL_CONFIG, "r");

    char*    l = NULL;
    uint64_t c = 0;

    getline(&l, &c, f);
    memcpy(color_fg, l, 7);
    getline(&l, &c, f);
    memcpy(color_bg, l, 7);
    getline(&l, &c, f);
    memcpy(color_border, l, 7);
    getline(&l, &c, f);
    memcpy(color_sel_fg, l, 7);
    getline(&l, &c, f);
    memcpy(color_sel_bg, l, 7);
    getline(&l, &c, f);
    memcpy(color_sel_border, l, 7);

    refresh_dmenucmd(color_fg, color_bg, color_sel_fg, color_sel_bg);

    free(l);
    fclose(f);
}

char* cl_get_fg(void)         { return color_fg; }
char* cl_get_bg(void)         { return color_bg; }
char* cl_get_border(void)     { return color_border; }
char* cl_get_sel_fg(void)     { return color_sel_fg; }
char* cl_get_sel_bg(void)     { return color_sel_bg; }
char* cl_get_sel_border(void) { return color_sel_border; }
