package ;
import goodmaster.Good;
import Math;
class Player {
    var inventory:Array<Good> = new Array<Good>();
    public var x:Float = 0.0;
    public var y:Float = 0.0;
    var moveSpeed:Float = 2.0;
    var destX:Float = 0.0;
    var destY:Float = 0.0;

    public function new() {
        inventory.push(new Good("Test", "Test", 1, 1, 1));
    }
    public function setDest(dX,dY) {
        destX=dX;
        destY=dY;
    }
    //call this every time you want to move
    //this is a function so we can speed up time
    public function move() {
        var xspeed:Float=0;
        var yspeed:Float=0;
        var noRecalc:Bool = false;
        var diffX:Float = destX-x;
        var diffY:Float = destY-y;
        if (Math.abs(diffX)<=1 && Math.abs(diffY)>1) {
            xspeed=0;
            yspeed=yspeed/Math.abs(yspeed);
            noRecalc = true;
        }
        if (Math.abs(diffY)<=1 && Math.abs(diffX)>1) {
            yspeed = 0;
            xspeed=xspeed/Math.abs(xspeed);
            noRecalc = true;
        }
        if (Math.abs(diffX)<=1 && Math.abs(diffY)<=1) {
            xspeed = 0;
            yspeed = 0;
            noRecalc = true;
        }

        if (Math.abs(diffX)>Math.abs(diffY)) {
            diffY=diffY/Math.abs(diffX);
            diffX=diffX/Math.abs(diffX);
        } else {
            diffX=diffX/Math.abs(diffY);
            diffY=diffY/Math.abs(diffY);
        }
        xspeed=diffX*moveSpeed;
        yspeed=diffY*moveSpeed;
        //if (noRecalc != true) {
            if (Math.abs(x-destX)>Math.abs(xspeed) && Math.abs(y-destY)>Math.abs(yspeed)) {
                x+=xspeed;
                y+=yspeed;
            } else {
                x = destX;
                y = destY;
            }
        }
    //}
}
