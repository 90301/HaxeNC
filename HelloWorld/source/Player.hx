package ;
import Math;
class Player {
    var inventory:Array<Good> = new Array<Good>();
    public var x=0;
    public var y=0;
    var moveSpeed = 2;
    var destX =0;
    var destY =0;

    public function new() {
        inventory.push(new Good());
    }
    public function setDest(dX,dY) {
        destX=dX;
        destY=dY;
    }
    //call this every time you want to move
    //this is a function so we can speed up time
    public function move() {
    if ((x-destX)>moveSpeed && (y-destY)>moveSpeed) {
        var diffX:Float = destX-x;
        var diffY:Float = destY-y;
        if (Math.abs(diffX)>Math.abs(diffY)) {
            diffY=diffY/Math.abs(diffX);
            diffX=diffX/Math.abs(diffX);
        } else {
            diffX=diffX/Math.abs(diffY);
            diffY=diffY/Math.abs(diffY);
        }
        var xspeed=diffX*moveSpeed;
        var yspeed=diffY*moveSpeed;
        x+=Std.int(xspeed);
        y+=Std.int(yspeed);

    }
    }
}
