$fn=100;

width = 1000;
height = 300;
thickness = 10;

channel_offsets = [-50,0,50];
channel_height = 20;
channel_edge_distance = 50;
corner_distance = 12;
corner_hole_dia = 5;
corner_hole_distance_y = height/2 - corner_distance;
corner_hole_distance_x = width/2 - corner_distance;

font_height = 155;
    
difference()
{
    //Base plate
    cube(size=[width,height,thickness], center = true);

    //Text
    translate([0,0,-(thickness/2)])
    {
        linear_extrude(height = thickness)
        {
            text("/dev/base", halign="center", valign="center", size=font_height, font="Cantarel: Bold");    
        }
    }

    //Wire channels
    for (a = channel_offsets) 
    {
        translate([0,a,-(thickness/4)])
        {
            cube(size=[width - 2*channel_edge_distance,channel_height,thickness/2], center = true);
        }    
    }
    
    //corner holes
    translate([corner_hole_distance_x , corner_hole_distance_y, 0])cylinder(h=thickness,r=corner_hole_dia /2, center=true);
    translate([-corner_hole_distance_x , corner_hole_distance_y, 0])cylinder(h=thickness,r=corner_hole_dia /2, center=true);
    translate([corner_hole_distance_x , -corner_hole_distance_y, 0])cylinder(h=thickness,r=corner_hole_dia /2, center=true);
    translate([-corner_hole_distance_x , -corner_hole_distance_y, 0])cylinder(h=thickness,r=corner_hole_dia /2, center=true);
    
    //middle holes
    translate([0, corner_hole_distance_y, 0])cylinder(h=height,r=corner_hole_dia /2, center=true);
    translate([0, -corner_hole_distance_y, 0])cylinder(h=height,r=corner_hole_dia /2, center=true);
}