width=80; //(+2 = 82)
height=25; //(+2 = 27)

depth=7;
tdepth=10;

thickness=2;
border=1;




radius = height/3;
drill_rad=1.5;
drill_x=60;
drill_y=39;

sma_dia=7;

sd_out=6;

module bottom() {
difference() {
union() {
cube([width+thickness*2,height+thickness*2,depth],center=true);
translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([(drill_x/2), drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,radius,radius,center=true);
translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,radius,radius,center=true);

}
translate([0,0,thickness]) cube([width,height,depth],center=true);
translate([0,0,depth-border]) cube([width+border*2,height+border*2,depth],center=true);
translate([-(drill_x/2),-drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([(drill_x/2), drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([-(drill_x/2),drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
translate([(drill_x/2), -drill_y/2,0]) cylinder(depth,drill_rad,drill_rad,center=true);
/* a cut for the uart console */
translate([0,height/2,0]) cube([11,11,2.7],center=true);
}
}


module top() {
	difference() {
	 union() {
	 cube([width+thickness*2,height+thickness*2,tdepth],center=true);
       translate([-(drill_x/2),-drill_y/2,0]) cylinder(tdepth,radius,radius,center=true);	
       translate([(drill_x/2), drill_y/2,0]) cylinder(tdepth,radius,radius,center=true);
       translate([-(drill_x/2),drill_y/2,0]) cylinder(tdepth,radius,radius,center=true);
       translate([(drill_x/2), -drill_y/2,0]) cylinder(tdepth,radius,radius,center=true);

   }
	translate([0,0,tdepth-border]) cube([width+border*2,height+border*2,tdepth],center=true);
      
	translate([-(drill_x/2),-drill_y/2,0]) cylinder(tdepth,drill_rad,drill_rad,center=true);
      translate([(drill_x/2), drill_y/2,0]) cylinder(tdepth,drill_rad,drill_rad,center=true);
      translate([-(drill_x/2),drill_y/2,0]) cylinder(tdepth,drill_rad,drill_rad,center=true);
      translate([(drill_x/2), -drill_y/2,0]) cylinder(tdepth,drill_rad,drill_rad,center=true);
	
	translate([0,0,thickness]) cube([width,height,tdepth],center=true);

/* sma */
//      translate([0, -height/2, -1]) rotate([90,0,0]) cylinder(tdepth,sma_dia/2,sma_dia/2,center=true);

/* sd */
 	translate([width/2-19, height/2, tdepth/2])  cube([17,sd_out*2,3*2],center=true);

/* miniusb*/
	translate([width/2-19, -height/2, tdepth/2])  cube([11,height*1.5,6*2],center=true);
 	translate([width/2-19, -drill_y/2-4, tdepth/2])  cube([11,radius*2,height*2],center=true);
	

/* usb & power */
translate([width/2,0,tdepth/2+border]) cube([11,height-2,8.1*2],center=true);
      
/* btn & led */
	translate([-width/2+5,height/2-3,0]) cylinder(tdepth*2,drill_rad,drill_rad,center=true);
	translate([-width/2+5,-height/2+3,0]) cylinder(tdepth*2,drill_rad,drill_rad,center=true);



/* HDMI */ 
translate([-width/2,0,tdepth/2+border]) cube([11,12,5*2],center=true);
      }

}


//bottom();
//translate([0,0,30])
 top();


