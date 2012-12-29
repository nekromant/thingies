
use <MCAD/boxes.scad>

/* HDD stand base */
width=71;
length=105;
screw_dist=76;
thickness=5;
drill_rad=1.5;
base_thickness=2;

module side(drill_dist, r,p)
{
	union() {
  	   difference() {
 	   roundedBox([thickness, length, 12], 2, true);	
	   translate([0,drill_dist/2,0]) rotate([0,90,0]) cylinder(15,r,r, center=true);
	   translate([0,-drill_dist/2,0]) rotate([0,90,0]) cylinder(15,r,r, center=true);
	 }
 	    translate([p*thickness/2,0,thickness]) roundedBox([thickness*2, length, thickness/2], 2, true);	
	}


}

union() {
 roundedBox([width+thickness, length, base_thickness], 2, true);
 translate([width/2,0,11/2]) side(screw_dist,drill_rad, -1);
 translate([-width/2,0,11/2]) side(screw_dist, drill_rad, 1);

}