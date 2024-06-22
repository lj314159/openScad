$fn=25;
pegtext = "CUBE";
pegtext1 = ["C","U","B","E"];
difference(){
    cube([31.80,15.80,9.60]);
    translate([1.45,1.45])
    cube([28.90,12.90,8.60]);
}
translate([3.90,3.90])
for ( j = [0:1] ) {
    for ( i = [0:3] ) {
        translate([i*8,j*8,9.60]){
            cylinder(h=1.80,r=2.42);
            translate([0,0,1.8])
            linear_extrude(.4)
            text( pegtext1[i], .8, halign="center",valign="center");
        }
    }
}
translate([7.90,7.90])
for ( k = [0:2] ) {
    translate([k*8,0])
    difference(){
        cylinder(h=8.60,r=3.25);
        cylinder(h=8.60,r=2.40);
    }
}