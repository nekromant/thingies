
use <MCAD/boxes.scad>

/* HDD stand base */
width=73;
length=105;
screw_dist=76;
thickness=5;
drill_rad=1.5;
base_thickness=2;
height=15;

module side(drill_dist, r,p)
{
	union() {
  	   difference() {
 	   roundedBox([thickness, length, height], 2, true);	
	   translate([0,drill_dist/2,0]) rotate([0,90,0]) cylinder(15,r,r, center=true);
	   translate([0,-drill_dist/2,0]) rotate([0,90,0]) cylinder(15,r,r, center=true);
	 }
 	    translate([p*thickness*3/2,0,height/2]) roundedBox([thickness*4, length, thickness/2], 2, true);	
	}

}

union() {
 roundedBox([width+thickness*2, length, base_thickness], 2, true);
 translate([(width+thickness)/2,0,height/2]) side(screw_dist,drill_rad, -1);
 translate([-(width+thickness)/2,0,height/2]) side(screw_dist, drill_rad, 1);

}