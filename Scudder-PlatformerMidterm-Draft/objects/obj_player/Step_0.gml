/// @description movement and collision
// You can write your code in this editor

key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
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
 
 //projectiles
 meowDelay = meowDelay -1;
if(mouse_check_button(mb_left)) && (meowDelay < 0){
	sprite_index = spr_playerMeow;
	meowDelay = 5;
	with(instance_create_layer(x, y, "Projectiles", obj_meow)){
		speed = 10;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
		direction = image_angle;

	}
}
 
if(hspeed != 0) {
	//image_speed = 1;
	//sprite_index = spr_playerWalk;
	image_xscale = sign(hspeed) * -1;
}