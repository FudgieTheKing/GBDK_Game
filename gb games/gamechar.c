#include <gb/gb.h>

struct gamechar {
	UBYTE spritids[2]; // all characters use 4 sprites
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};