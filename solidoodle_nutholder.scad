outer = 30;
inner = 11;
height = 12;
drill=3;

indiag = sqrt(2*inner*inner);

difference() {
union() {
difference() {
cube([outer,outer,height],center=true);
translate([0,outer-5,0]) cube([outer,outer,height],center=true);

rotate([0,0,45]) cube([inner,inner,height],center=true);
}
translate([0,0,-height/2]) cube([outer,outer,4],center=true);
}
translate([7.5,7.5,0]) cylinder(height*2,drill/2,drill/2,center=true);
translate([-7.5,-7.5,0]) cylinder(height*2,drill/2,drill/2,center=true);
translate([7.5,-7.5,0]) cylinder(height*2,drill/2,drill/2,center=true);
translate([-7.5,7.5,0]) cylinder(height*2,drill/2,drill/2,center=true);

translate([0,0,0]) rotate([0,90,0]) cylinder(outer*2,drill/2,drill/2,center=true,$fn=6);
translate([0,0,0]) rotate([90,90,0]) cylinder(outer*2,drill/2,drill/2,center=true,$fn=6);
translate([0,0,0]) rotate([0,90,0]) cylinder(indiag+4,drill,drill,center=true, $fn=6);
translate([0,0,0]) rotate([90,90,0]) cylinder(indiag+4,drill,drill,center=true, $fn=6);
translate([0,0,-outer]) cylinder(outer*4,inner/2,inner/2,center=true);

}

