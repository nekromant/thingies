thickness=4;
width=32;
length=32+thickness;
height=32+thickness;
holder=length/3;
overhangs=7;
dia=3.2;

module h() 
{
difference() {
	/* base */
	cube([length+holder*2,width,thickness],center=true);
	translate([-length/2-holder/2,0,0]) cylinder(thickness*2,dia/2,dia/2,center=true);
	translate([length/2+holder/2,0,0]) cylinder(thickness*2,dia/2,dia/2,center=true);
}
/* walls */
translate([-length/2,0,height/2]) cube([thickness,width,height],center=true);
translate([length/2,0,height/2]) cube([thickness,width,height],center=true);
/* overhangs */
translate([length/2-overhangs/2,0,height])   cube([overhangs+thickness,width,thickness],center=true);
translate([-length/2+overhangs/2,0,height])   cube([overhangs+thickness,width,thickness],center=true);
}

rotate([90,0,0]) h();



