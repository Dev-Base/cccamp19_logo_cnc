$fn=100;
width = 1000;
height = 300;
font_height = 155;

difference()
{
    //Base plate
    square(size=[width,height], center = true);

    //Text
    text("/dev/base", halign="center", valign="center", size=font_height, font="Cantarel: Bold");    
}