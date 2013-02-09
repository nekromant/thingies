use <MCAD/involute_gears.scad>
module stepper_mount(w=3) {
translate([1,0,0]) cylinder(
	h=50,
	d=w,
	center=true
	);
translate([-1,0,0]) cylinder(
	h=50,
	d=w,
	center=true
	);
cylinder(
	h=50,
	d=w,
	center=true
	);

}


difference() {
gear(
    number_of_teeth = 61,
    circular_pitch=100,
    hub_diameter = 33,
    bore_diameter = 5.6,
    gear_thickness = 5,
    rim_thickness = 8,
    hub_thickness = 8,
    circles=0);
//stepper_mount(w=4);
};
;
