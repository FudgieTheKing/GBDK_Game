#include <gb/gb.h>
#include <stdio.h>
#include "guy.c"
#include "back.c"
#include "backtile.c"
#include "windowmap.c"
#include "gamechar.c"
#include <gb/font.h>





struct gamechar player;

UBYTE spritesize = 8;

//movement
void movegamechar(struct gamechar* character, UINT8 x, UINT8 y){
    move_sprite(character->spritids[0], x, y);
    move_sprite(character->spritids[1], x,y+spritesize);



    // ISSUE is hasmoved is not called when it touches the ground which sets Y to the grounds Y
    
}
//creates player
void setupplayer(){
    player.x = 80;
    player.y = 120;
    player.width = 8;
    player.height = 16;

    // load sprites for player
    set_sprite_tile(0, 0);
    player.spritids[0] = 0;
    set_sprite_tile(1, 1);
    player.spritids[1] = 1;

    movegamechar(&player, player.x, player.y);
}

INT16 playerlocation[2]; // stores two INT16 x and y position of player
BYTE jumping = 0;
INT8 walkspeed = 2;
INT16 currentspeedY;
INT16 floorYposition = 120;
UINT8 possibleYSurface;
//better delay
void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}
INT8 gravity = -2;
INT8 wouldHitSurf(UINT8 projectedYPosition)
{
    if(projectedYPosition >= floorYposition){
        return floorYposition;
    }
    return -1;
}

//jump algorithm
void jump()
{
    if(jumping == 0)
    {
        jumping = 1;
        currentspeedY = 10;
        NR10_REG = 0x16; 
        NR11_REG = 0x40;
        NR12_REG = 0x73; 
        NR13_REG = 0x00; 
        NR14_REG = 0xC3;
    }
    currentspeedY = currentspeedY + gravity;

    player.y -= currentspeedY;

    possibleYSurface = wouldHitSurf(player.y);


    if(possibleYSurface == floorYposition)
    {
        
        jumping = 0;
        movegamechar(&player,player.x, possibleYSurface);

    }
    else
    {
        movegamechar(&player,player.x,player.y);
    }

}

void main(){
    UINT8 i = 0;
    set_sprite_data(0,2,guy);
    setupplayer();
    //Music Junk
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
    //animation var
    UINT8 currentspriteindex = 0;
    //font
    font_t min_font;
    font_init();
    min_font = font_load(font_min);
    font_set(min_font);
    //loads sprites and background
    set_bkg_data(37,9,backtile);
    set_bkg_tiles(0,0,40,18,back);
    //window layer
    set_win_tiles(0,0,5,1,windowmap);
    move_win(7,127);
    //display stuff
    SHOW_BKG;
    SHOW_WIN;
    DISPLAY_ON;
    SHOW_SPRITES;
    
   
jumping = 0;
    //ever CPU process
    while(1){

        if(joypad() & J_A || jumping == 1){
            jump();
        }
    
        //scrolls background (x axis,yaxis)
        scroll_bkg(1,0);
        //Controller inputs

        if(joypad() & J_LEFT){
            player.x -= 1*walkspeed;
            movegamechar(&player, player.x, player.y);
        }
        if(joypad() & J_RIGHT){
            player.x += 1*walkspeed;
            movegamechar(&player, player.x, player.y);
        }

        if(joypad() & J_B){
            walkspeed = 4;
        }else{
            walkspeed = 2;
        }



        //cpu processes delay
        performantdelay(5);
    }
}