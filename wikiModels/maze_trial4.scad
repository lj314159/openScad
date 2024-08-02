$fn=50;
width=1;
height=15;
length1=40;
length2=200;
module wall(length) {
cube([length,width,height]);
}
wall(length1);
translate([0,length2,0])
    wall(length1);
translate([width,0,0])
    rotate([0,0,90])
        wall(length2);
translate([length1,0,0])
    rotate([0,0,90])
        wall(length2);
// ceiling
translate([0,0,height])
    cube([length1,length2+width,width]);
// laser module
translate([35,5,height-2])
    cylinder(h=4,r=.5);
