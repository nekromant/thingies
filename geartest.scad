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
    number_of_teeth = 10,
    circular_pitch=400,
    hub_diameter = 7,
    bore_diameter = 1,
    gear_thickness = 8,
    rim_thickness = 8,
    hub_thickness = 6,
    circles=0);
stepper_mount(w=4);
};
;
