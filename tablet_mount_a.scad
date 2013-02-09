width=30;
thickness=4;
drill_dia=3;


module mount(length) {
	difference() {
		cube([length,width,thickness]);
		translate([length/2,width/2+width/4,0]) rotate([0,0,90]) cylinder(thickness*2, drill_dia/2,drill_dia/2);
		translate([length/2,width/2-width/4,0]) rotate([0,0,90]) cylinder(thickness*2, drill_dia/2,drill_dia/2);

	}
}

rotate([90,0,0]) {
	mount(50);
	rotate([0,-60,0]) mount(50);
}