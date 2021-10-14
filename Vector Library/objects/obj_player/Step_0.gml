// Variables
var move_vec, jump_key, g_force;

// Get inputs
move_vec = new vec2(
	keyboard_check(ord("D")) - keyboard_check(ord("A")),
	keyboard_check(ord("S")) - keyboard_check(ord("W"))
);
jump_key = keyboard_check_pressed(vk_space);

// Gravity handling
g_force = ( position.z<0 )*grav;
if (g_force==0) { speed_vec.z = 0; position.z = 0; } 

// Jumping
if ( jump_key ) speed_vec.z = -jspd;

// Update speed
move_vec.multiply(spd);
speed_vec.lerp_to(new vec3(move_vec, speed_vec.z+g_force), fric);

// Update position
position.add(speed_vec);
x = position.x;
y = position.y;