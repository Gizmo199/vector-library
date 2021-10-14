var s = 32;
var zs = min(position.z/s*4, 0);

// Draw our shadow
draw_set_alpha(.5);
draw_ellipse_color(x-s-zs, y+s-s*.5-zs*.5, x+s+zs, y+s+s*.5+zs*.5, 0, 0, 0);
draw_set_alpha(1);

// Draw our ball
var z = position.z;
var d = point_direction(x,y,mouse_x,mouse_y);
draw_circle_color(x, y+z, s, c_ltgray, c_ltgray, false);

// Fake Specular Glare
var p1 = new vec2(position.x, position.y+position.z);
var p2 = new vec2(mouse_x, mouse_y);
var dis = p2.subtract(p1).normalize().length();

gpu_set_blendmode(bm_add);
draw_set_alpha((dis*100)*.5);
draw_circle_color(x+(dcos(d)*(s/4)), y+z-(dsin(d)*(s/4)), s*(1-dis), c_white, c_black, false);
gpu_set_blendmode(bm_normal);

draw_set_alpha(1);