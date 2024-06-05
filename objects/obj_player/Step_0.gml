//variable declaration
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

//speed declaration
x_speed = (right_key - left_key) * move_speed;
y_speed = (down_key - up_key) * move_speed;

//run
if keyboard_check(vk_shift) == true {
	x_speed = x_speed*run_speed;
	y_speed = y_speed*run_speed;
	}

//sprite orientation
mask_index = sprite[DOWN];
if x_speed > 0 {face_direction=RIGHT;}
if x_speed < 0 {face_direction=LEFT;}
if y_speed > 0 {face_direction=DOWN;}
if y_speed < 0 {face_direction=UP;}
sprite_index = sprite[face_direction];

//collision detection
if place_meeting(x + x_speed, y, obj_wall) == true{x_speed = 0;}
if place_meeting(x, y + y_speed, obj_wall) == true{y_speed = 0;}

if x_speed == 0 && y_speed == 0 {image_index = 0;}

//moving the player
x += x_speed;
y += y_speed;

//depth
depth = -bbox_bottom;