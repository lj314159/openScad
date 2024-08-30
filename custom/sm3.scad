$fn=50;
difference() {
translate([0,0,1])
cylinder(30,1);
translate([0,0,.9])
cylinder(r1=0.5,r2=0,h=1);
}
translate([0,0,31])
cylinder(r1=1,r2=.1,h=4);
lowFinPoints = [
[0, 0, 5],     //0
[0,0.5, 1],    //1
[4, 0, 2],     //2
[0, -0.5, 1]]; //3
lowFinFaces = [
[0,1,2],
[0,1,3],
[0,2,3],
[1,2,3]];
midFinPoints = [
[0,0,26], //0
[2,0,22], //1
[2,0,14], //2
[0,0,10], //3
[0,0.5,22], //4
[0,-0.5,22],//5
[0,0.5,14], //6
[0,-0.5,14]];//7
midFinFaces = [
[0,1,5],
[1,2,7,5],
[2,3,7],
[0,4,1],
[4,6,2,1],
[2,6,3],
[0,4,6,3,7,5]
];
for (i = [0:3]) {
    rotate([0,0,i*90])
    polyhedron(points = lowFinPoints, faces = lowFinFaces);
    rotate([0,0,i*90])
    polyhedron(midFinPoints, midFinFaces);
}
