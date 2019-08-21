$fn=100;
width = 1000;
height = 300;

channel_offsets = [-50,0,50];
channel_height = 20;
channel_edge_distance = 50;

difference()
{
    //Base plate
    square(size=[width,height], center = true);

    //Channels
    for (a = channel_offsets) 
    {
        translate([0,a])
        {
            square(size=[width - 2*channel_edge_distance,channel_height], center = true);
        }    
    }
}