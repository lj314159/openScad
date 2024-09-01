module hexBuilding (
    length = 40,
    width = 15,
    height = 2,
    numFloor = 40,
    storyHeight = 10,
    beamRadius = .5
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
    for (i = [0:numFloor]) {
    translate([0,0,i*storyHeight]) 
    linear_extrude(height) { 
    polygon(points, paths);
    }
    }
    translate([x_0,y_0,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
    translate([x_1,y_1,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
    translate([x_2,y_2,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
    translate([x_3,y_3,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
    translate([x_4,y_4,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
    translate([x_5,y_5,0])
    cylinder(r=beamRadius,h=(storyHeight*numFloor)+height);
}
$fn = 50;
for (i = [0:2]) {
    translate([i*40,i*65,0]) 
    hexBuilding(); 
}