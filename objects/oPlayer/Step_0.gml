/// @description Add platformer mechanics

// Get keyboard inputs
// keyboard_check(key) will return 1 if pressed(true) or 0 if not pressed(false)
key_right = keyboard_check(vk_right);	// ord('D') for letter D
key_left = keyboard_check(vk_left);		// ord('A') for letter A
key_jump = keyboard_check(vk_space);	

//work out where to move horizontally
hsp = (key_right - key_left) * hsp_walk;
/*
	Right key only is pressed:
	hsp = (1 - 0) * 4; = hsp =1 * 4 or 4
	left key only pressed:
	hsp = (0 - 1) * 4 = -1 * 4 = -4
	mo keys:
	0 - 0 * 4 = 0 * 4 = 0
	Both Keys are pressed:
	1 - 1 * 4 = 0 * 4 = 0
*/

// move character by hsp
x = x + hsp;