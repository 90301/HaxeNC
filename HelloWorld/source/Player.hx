package ;
import GoodMaster.Good;
import Math;
class Player {
    var inventory:Array<Good> = new Array<Good>();
    public var x:Float = 0.0;
    public var y:Float = 0.0;
    var moveSpeed:Float = 2.0;
    var destX:Float = 0.0;
    var destY:Float = 0.0;

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
        if (Math.abs(x-destX)>Math.abs(xspeed) && Math.abs(y-destY)>Math.abs(yspeed)) {
            x+=xspeed;
            y+=yspeed;
        } else {
            x = destX;
            y = destY;
        }
    }
}
