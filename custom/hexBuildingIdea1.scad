module hexagon (
    length = 35,
    width = 14,
    height = 2,
    ) {
    x_0 = 0;
    y_0 = length / 2;
    x_1 = width / 2;
    y_1 = (length / 2) - (width / 2);
    x_2 = width / 2;
    y_2 = (-length / 2) + (width / 2);
    x_3 = 0;
    y_3 = -length / 2;
    x_4 = -width / 2;
    y_4 = (-length / 2) + (width / 2);
    x_5 = -width / 2;
    y_5 = (length / 2) - (width / 2);
    points = [
        [x_0,y_0],
        [x_1,y_1],
        [x_2,y_2],
        [x_3,y_3],
        [x_4,y_4],
        [x_5,y_5]];
    paths = [[0,1,2,3,4,5]];
    linear_extrude(height) { 
    polygon(points, paths);
    }
}
for (i = [0:15]) {
translate([0,0,i*10]) 
hexagon();
}
$fn = 50;
translate([0,17,0])
cylinder(r=.5,h=152); 