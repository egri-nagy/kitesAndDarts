////////////////////////////// 
// kitesanddarts.scad
// http://www.thingiverse.com/thing:12003
// Matt Moses, 2011
// mmoses152@gmail.com
//
// Kites and Darts are a type of non-periodic tiling invented by Roger Penrose.  
// The tiles cover the plane in an infinite variety of beautiful, non-repeating patterns.  
// The Golden Ratio (1/2)*(1+sqrt(5)) features prominently in the tiles, in their
// construction and in their patterns.  In the limit, the ratio of kites to darts is the
// golden ratio.  So if you print 1000 darts you should print 1618 kites.  
// There are seven ways the tiles can be arranged around a vertex.  
// These seven patterns were given names by John Conway and appear in the 
// stl files: sun, star, ace, deuce, jack, queen, king.
// See these links for more information:
// http://intendo.net/penrose/info.html
// http://mathworld.wolfram.com/PenroseTiles.html
// http://en.wikipedia.org/wiki/Penrose_tiling

phi = (1 + sqrt(5))/2;
ca = cos(36);
sa = sin(36);
$fn = 40;

kscale = 12;
hkite = 4;
hmark = 2;
bigmark = 5;
littlemark = 1;
explode = 2;

//kite(kscale, hkite, hmark, bigmark, littlemark,explode);
//dart(kscale, hkite, hmark, bigmark, littlemark,explode);
//kitemarkings(kscale, hkite, 5*hmark, bigmark, littlemark,explode);
//dartmarkings(kscale, hkite, 5*hmark, bigmark, littlemark,explode);

//sun(kscale, hkite, hmark, bigmark, littlemark,explode);
//star(kscale, hkite, hmark, bigmark, littlemark,explode);
//ace(kscale, hkite, hmark, bigmark, littlemark,explode);
//deuce(kscale, hkite, hmark, bigmark, littlemark,explode);
jack(kscale, hkite, hmark, bigmark, littlemark,explode);
//queen(kscale, hkite, hmark, bigmark, littlemark,explode);
//king(kscale, hkite, hmark, bigmark, littlemark,explode);
//kitebase(kscale, hkite);

//---------------------------------------------------
module sun(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	for (i = [0, 1, 2, 3, 4, 5])
	{
		rotate(72*i, [0,0,1])
		translate([explode,0,0])
		kite(kscale,hkite,hmark,bigmark,littlemark);
	}
}
//---------------------------------------------------


//---------------------------------------------------
module star(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	for (i = [0, 1, 2, 3, 4, 5])
	{
		rotate(72*i, [0,0,1])
		translate([explode,0,0])
		dart(kscale,hkite,hmark,bigmark,littlemark);
	}
}
//---------------------------------------------------


//---------------------------------------------------
module ace(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	rotate(180,[0,0,1])
	translate([-kscale*(1+1/phi),0,0])
	{
		translate([-explode,0,0])
		dart(kscale,hkite,hmark,bigmark,littlemark);
		
		translate([kscale*(2 + phi + 1/phi), explode/2, 0])
		rotate(180-36,[0,0,1])
			kite(kscale,hkite,hmark,bigmark,littlemark);

		translate([kscale*(2 + phi + 1/phi), -explode/2, 0])
		rotate(180+36,[0,0,1])
			kite(kscale,hkite,hmark,bigmark,littlemark);
	}
}
//---------------------------------------------------


//---------------------------------------------------
module deuce(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	rotate(180,[0,0,1]){ 	

	translate([-kscale*(1+phi),0,0])
	{
		translate([-explode,-explode/2,0])
		rotate(-36,[0,0,1])
		dart(kscale,hkite,hmark,bigmark,littlemark);

		translate([-explode, explode/2, 0])
		rotate(36,[0,0,1])
		dart(kscale,hkite,hmark,bigmark,littlemark);
	}

	translate([0,explode/2,0])
	rotate(72,[0,0,1])
	translate([kscale*(1+phi),0,0])
	rotate(180,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([0,-explode/2,0])
	rotate(-72,[0,0,1])
	translate([kscale*(1+phi),0,0])
	rotate(180,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	}
}
//---------------------------------------------------


//---------------------------------------------------
module jack(kscale, hkite, hmark, bigmark, littlemark,explode)
{

	translate([-kscale*(1+phi)-explode/2,0,0])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([explode/2, explode/2, 0])
	rotate(36,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([explode/2, -explode/2, 0])
	rotate(-36,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([0,explode,0])
	rotate(180+36,[0,0,1])
	translate([-kscale*(1+phi)*cos(36),-kscale*(1+phi)*sin(36),0])
	dart(kscale,hkite,hmark,bigmark,littlemark);

	translate([0,-explode,0])
	rotate(180-36,[0,0,1])
	translate([-kscale*(1+phi)*cos(36),kscale*(1+phi)*sin(36),0])
	dart(kscale,hkite,hmark,bigmark,littlemark);

}
//---------------------------------------------------


//---------------------------------------------------
module queen(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	translate([-explode/2, explode/2, 0])
	translate([-kscale*(1+phi),0,0])
	rotate(36,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([-explode/2, -explode/2, 0])
	translate([-kscale*(1+phi),0,0])
	rotate(-36,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	dart(kscale,hkite,hmark,bigmark,littlemark);

	translate([kscale*(1+phi)*cos(36), kscale*(1+phi)*sin(36)+explode,0])
	rotate(180,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([kscale*(1+phi)*cos(36), -kscale*(1+phi)*sin(36)-explode,0])
	rotate(180,[0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);
}
//---------------------------------------------------


//---------------------------------------------------
module king(kscale, hkite, hmark, bigmark, littlemark,explode)
{
	for (i = [-1, 0, 1])
	{
		rotate(72*i, [0,0,1])
		translate([explode/2,0,0])
		dart(kscale,hkite,hmark,bigmark,littlemark);
	}

	translate([-kscale*(1+phi)*sin(18) -explode/2, -kscale*(1+phi)*cos(18)-explode/2,0])
	rotate(108, [0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);

	translate([-kscale*(1+phi)*sin(18) -explode/2, kscale*(1+phi)*cos(18)+explode/2,0])
	rotate(-108, [0,0,1])
	kite(kscale,hkite,hmark,bigmark,littlemark);
	
}
//---------------------------------------------------


//---------------------------------------------------
module kite(kscale, hkite, hmark, bigmark, littlemark)
{
difference(){
	kitebase(kscale, hkite);
	translate([0,0,hmark])
	kitemarkings(kscale, hkite, hmark, bigmark, littlemark);
}
}
//---------------------------------------------------


//---------------------------------------------------
module kitebase(kscale, hkite)
{
	linear_extrude(height = hkite, convexity = 10, twist = 0)
	polygon( points = [ [0,0], 
				[kscale*(1+phi)*ca, -kscale*(1+phi)*sa],
				[kscale*(1+phi), 0],
				[kscale*(1+phi)*ca, kscale*(1+phi)*sa] ]);
}
//---------------------------------------------------


//---------------------------------------------------
module kitemarkings(kscale, hkite, hmark, bigmark, littlemark)
{
	translate([0,0,1])
    intersection(){
		kitebase(kscale, hmark);
		difference(){
			cylinder(r = kscale*phi + bigmark, h = hmark);
			translate([0,0,-0.05*hmark])
			cylinder(r = kscale*phi - bigmark, h = 1.1*hmark);
		}
	}
	intersection(){
		kitebase(kscale, hmark);
		translate([kscale*(1+phi),0,0])
		difference(){
			cylinder(r = kscale+littlemark, h = hmark);
			translate([0,0,-0.05*hmark])
			cylinder(r = kscale-littlemark, h = 1.1*hmark);
		}
	}
}
//---------------------------------------------------


//---------------------------------------------------
module dart(kscale, hkite, hmark, bigmark, littlemark)
{
    difference(){dartbase(kscale, hkite);
	translate([0,0,hmark])
	dartmarkings(kscale, hkite, hmark, bigmark, littlemark);
    }
}
//---------------------------------------------------


//---------------------------------------------------
module dartbase(kscale, hkite)
{
	linear_extrude(height = hkite, convexity = 10, twist = 0)
	polygon( points = [ [0,0], 
				[kscale*(1+phi)*ca, -kscale*(1+phi)*sa],
				[kscale*(1+1/phi), 0],
				[kscale*(1+phi)*ca, kscale*(1+phi)*sa] ]);
}
//---------------------------------------------------


//---------------------------------------------------
module dartmarkings(kscale, hkite, hmark, bigmark, littlemark)
{
    translate([0,0,1])
	intersection(){
		dartbase(kscale, hmark);
		difference(){
			cylinder(r = kscale + bigmark, h = hmark);
			translate([0,0,-0.05*hmark])
			cylinder(r = kscale - bigmark, h = 1.1*hmark);
		}
	}
	intersection(){
        
		dartbase(kscale, hmark);
		translate([kscale*(1+1/phi),0,0])
		difference(){
			cylinder(r = kscale/phi+littlemark, h = hmark);
			translate([0,0,-0.05*hmark])
			cylinder(r = kscale/phi-littlemark, h = 1.1*hmark);
		}
	}
}
//---------------------------------------------------