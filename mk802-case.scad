width=80; //(+2 = 82)
height=25; //(+2 = 27)
depth=7;
thickness=2;
border=1;

include <font/FreeSerif.scad>

radius = height/3;
drill_rad=1.5;
drill_x=60;
drill_y=39;

module bottom() {
difference() {
union() {
cube([width+thickness*2,height+thickness*2,depth],center=true);
translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([(drill_x/2), drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,radius,radius,center=true);

}
translate([0,0,thickness]) cube([width,height,depth],center=true);
translate([0,0,depth-border]) cube([width+border*2,height+border*2,depth],center=true);
translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([(drill_x/2), drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
/* a cut for the uart console */
translate([0,height/2,0]) cube([11,11,2.7],center=true);
}
}


module top() {
	difference() {
	 union() {
	 cube([width+thickness*2,height+thickness*2,depth],center=true);
       translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,radius,radius,center=true);	
       translate([(drill_x/2), drill_y/2,0]) cylinder(depth,radius,radius,center=true);
       translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,radius,radius,center=true);
       translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,radius,radius,center=true);

   }
	translate([0,0,depth-border]) cube([width+border*2,height+border*2,depth],center=true);
      translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
      translate([(drill_x/2), drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
      translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
      translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
	translate([0,0,thickness]) cube([width,height,depth],center=true);
translate([0,0,depth-border]) cube([width+border*2,height+border*2,depth],center=true);
/* HDMI */ 
translate([-width/2,0,depth/2+border]) cube([11,12,4],center=true);
      }

}


bottom();
//translate([0,0,30]) top();


