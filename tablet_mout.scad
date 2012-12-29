use <MCAD/boxes.scad>

/* HDD stand base */
width=71;
length=105;
screw_dist=76;
thickness=5;
drill_rad=1.5;
base_thickness=2;


module halfcircle(r1,r2,h) {
           r = max(r1,r2);
  	   difference() {     
	cylinder(h,r1,r2);
	 translate([-r,0,0]) cube([r*2,r,r]);
	}
}

rm=23;
rl=20;
halfcircle(rl,rm);
translate([0,0,28]) halfcircle(rm,rl,base_thickness);
translate([-rm,0,0]) cube([rm*2,5,28+base_thickness]);

