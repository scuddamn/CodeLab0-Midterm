/// @description Insert description here
// You can write your code in this editor
image_speed = 1;

anchorY = random_range(900, 1500);

frequency = random_range(0.01, 0.1);

amplitude = random_range(5, 10);

timer = 0;

if(place_meeting (x, y, obj_meow)) {
	hp = hp - 1;
}

if(hp < 0) instance_destroy();

