a=10;
b=16;
h=5;
th=3;

difference() {
union() {
translate([-b/2,0,0])  cube([th,a+th,h],center=true);
translate([b/2,0,0])  cube([th,a+th,h],center=true);
translate([0,a/2,0])  cube([b,th,h],center=true);
}
translate([0,a/2,h/4])  cube([b-h/2,th,h/2],center=true);

}
