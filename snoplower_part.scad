w=73/2;
h=11.5;
h2=17.5;
r=11;
d_offs = 56.8/2;

r1=11/2;
r2=5.8/2;

difference() {
union() {
rotate([0,0,r]) cube([w,h,14]);
rotate([0,0,-r]) translate([-w,0,0])cube([w,h,14]);
rotate([0,0,r]) cube([w,h2,10]);
rotate([0,0,-r]) translate([-w,0,0]) cube([w,h2,10]);
}
	translate([-d_offs,12,-1]) cylinder(10,r1,r1,$fn=6);
	translate([d_offs,12,-1]) cylinder(10,r1,r1,$fn=6);
	translate([-d_offs,12,-1]) cylinder(20,r2,r2,$fn=20);
	translate([d_offs,12,-1]) cylinder(20,r2,r2,$fn=20
);

	
}