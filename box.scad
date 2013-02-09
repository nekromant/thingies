
width=105;
length=135;
bthickness=2;
wthickness=2;

mwidth=10;
mlength=40;
mdepth=15;

rows=8;
cols=3;


offs_x = (width - (mwidth + wthickness) * rows)/2;
offs_y = (length - (mlength + wthickness) * cols)/2;


difference() {
cube([width,length,bthickness+mdepth]);

for (j= [0:1:cols-1]) {
 for (i= [0:1:rows-1]) {
	translate([offs_x + i*(mwidth+wthickness),offs_y + j*(mlength+wthickness),0]) cube([mwidth,mlength,mdepth]);
 }
}

}

//translate([0,0,-bthickness])cube([bthickness,length,bthickness*2+mdepth]);
//translate([width,0,-bthickness])cube([bthickness,length,bthickness*2+mdepth]);
translate([0,0,-bthickness])cube([width,bthickness,bthickness*2+mdepth]);
translate([0,length,-bthickness])cube([width,bthickness,bthickness*2+mdepth]);

