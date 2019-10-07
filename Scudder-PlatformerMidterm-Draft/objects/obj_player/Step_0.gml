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