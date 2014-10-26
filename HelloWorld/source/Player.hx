package ;
import Math;
class Player {
    var inventory:Array<Good> = new Array<Good>();
    var x=0;
    var y=0;
    var moveSpeed = 2;
    var destX =0;
    var destY =0;

    public function new() {
    inventory.push(Good())
    }
    public function setDest(dX,dY) {
        destX=dX;
        destY=dY;
    }
    //call this every time you want to move
    //this is a function so we can speed up time
    public function move() {
    if ((x-destX)>moveSpeed && (y-destY)>moveSpeed) {
        var diffX = destX-x;
        var diffY = destY-y;
        if (Math.abs(diffX)>Math.abs(diffY)) {
            diffY=diffY/Math.abs(diffX);
            diffX=diffX/Math.abs(diffX);
        } else {
            diffX=diffX/Math.abs(diffY);
            diffY=diffY/Math.abs(diffY);
        }
        var xspeed=diffX*moveSpeed;
        var yspeed=diffY*moveSpeed;
        x+=xspeed;
        y+=yspeed;

    }
    }
}
