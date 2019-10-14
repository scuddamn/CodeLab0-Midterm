/// @description movement and collision
// You can write your code in this editor

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left; 

hspeed = move * walkSpeed;
vspeed = vspeed + grv;

//ability to jump
if (place_meeting(x, y + 1, obj_wall)) && (key_jump){
	vspeed = -7
	}
	

//horizontal collision 
 if(place_meeting(x + hspeed, y, obj_wall)){
	 while(!place_meeting(x + sign(hspeed), y, obj_wall)) {
		x = x + sign(hspeed);	
	 }
	 
	 hspeed = 0;
 }

//vertical collision 
 if(place_meeting(x , y + vspeed, obj_wall)){
	 while(!place_meeting(x, y + sign(vspeed), obj_wall)) {
		y = y + sign(vspeed);
	 }
	 
	 vspeed = 0;
 }
 
 //animation
 
 if(!place_meeting(x, y + 1, obj_wall)){
	 sprite_index = spr_playerJump;
	 image_speed = 0;
	 
	 if(sign(vspeed) > 0) image_index = 1; else image_index = 0;
			 

 } else {
	 image_speed = 1;
	 
	 if(hspeed == 0){
		 sprite_index = spr_player;
	 } else {
		 sprite_index = spr_playerWalk;
		 }
 
 }
 
if(hspeed != 0) {
	image_speed = 1;
	sprite_index = spr_playerWalk;
	image_xscale = sign(hspeed) * -1;
}