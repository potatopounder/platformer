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
//Work out where to move vertically
vsp = vsp + grv;

//work out if we should jump
if (place_meeting(x, y + 1, oWall)) and (key_jump)
{
	vsp = vsp_jump;
}

//check for horizontal collisions
var onepixel = sign(hsp); //sign() returns -1,0, or 1
if (place_meeting(x + hsp, y, oWall))
{
	//move as close as we can
	//move 1px towards the wall until we're 1px away
	while ( !place_meeting(x + onepixel, y, oWall))
	{
		x = x + onepixel;
	}
	hsp = 0; // once 1px away, stop
}
//update x
x = x + hsp;



//check for vertical collisions
var onepixel = sign(vsp);
if (place_meeting(x, y + vsp, oWall))
{
	//close as we can
	while (!place_meeting(x, y + onepixel, oWall))
	{
		y = y + onepixel;	
	}
	vsp = 0;
}

//update y
y = y + vsp;


