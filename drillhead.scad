use <MCAD/boxes.scad>

height=40;
inner=29;
outer=40;
rod_dia=5;
rod_dist=25;
hndl_w=40;

screw_dia=6;

holder_width=30;
holder_len=40;

screw_head=8;
screw_head_sink=5;
screw_fit_dia=10;
screw_fit_sink=3;
screw_dia=5;


/* M4 screw: 8-9 mm actual */

difference() {
	union() {
	cylinder(height,outer,outer);
	 translate([-outer,0,height/2]) 
		    cube([holder_len, holder_width ,height], center=true);
	}
	cylinder(height,inner,inner);
	translate([-outer,0,height/2])  cube([(outer-inner)*5,4,height], center=true);

      translate([-outer-holder_len/4,0,height/2])  rotate([90,0,0])  {
           cylinder(holder_width*2,screw_dia/2,screw_dia/2, center=true); 	
	 }

      translate([-outer-holder_len/4,holder_width/2,height/2])  rotate([90,0,0])  {
          cylinder(screw_head_sink*2,screw_head,screw_head,$fn=6,center=true);
}

      translate([-outer-holder_len/4,-holder_width/2,height/2])  rotate([90,0,0])  {
           cylinder(screw_fit_sink*2,screw_fit_dia/2,screw_fit_dia/2, center=true); 	
	 }
//   
//	   cylinder(holder_width*2,screw_dia,screw_dia); 
	 //  
	
}



translate([inner,-outer,0]) 
 difference() {
      translate([hndl_w/2,outer,height/2])  roundedBox([hndl_w,outer*2, height], 2, true);	
	/* Two rods for directing */
      translate([hndl_w/2,outer-rod_dist,0])  cylinder(height,rod_dia,rod_dia);
      translate([hndl_w/2,outer+rod_dist,0])  cylinder(height,rod_dia,rod_dia);
	/* Transmission stuff */
      translate([hndl_w/2,outer,0])  cylinder(height,screw_dia,screw_dia);
	
}

