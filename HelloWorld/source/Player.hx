package ;
import goodinv.GoodI;
import Math;
class Player {
    var inventory:Array<GoodI> = new Array<GoodI>();
    public var x:Float = 0.0;
    public var y:Float = 0.0;
    var moveSpeed:Float = 2.0;
    var baseMoveSpeed:Float = 2.0;
    var destX:Float = 0.0;
    var destY:Float = 0.0;

    public function new() {
        var testGood:GoodI = new GoodI(0,5);
        inventory.push(testGood);
    }
    public function setDest(dX,dY) {
        destX=dX;
        destY=dY;
    }
    /*
    This sets the moveSpeed variable by checking the terrian at the Players location
     */
    public function getMoveSpeed():Void {
        var xInt:Int=Math.round(x);
        var yInt:Int=Math.round(y);
        var terrain:Int = Main.map.getTerrain(xInt,yInt);
        var mod:Dynamic=1;
        if (terrain==0) {
            mod=1.5;
        }
        if (terrain==1){
            mod=.5;
        }

        if (terrain==2){
            mod=.3;
        }

        if (terrain==3){
            mod=2;
        }


        moveSpeed=baseMoveSpeed*mod;
    }
    //call this every time you want to move
    //this is a function so we can speed up time
    //speeding up time can be done by calling this function MULTIPLE times per cycle
    //this prevents going through walls if we implement that.
    public function move() {
    getMoveSpeed();
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
            if (Math.abs(x-destX)>Math.abs(xspeed)) {
                x+=xspeed;
            } else {
                x = destX;
            }
            if (Math.abs(y-destY)>Math.abs(yspeed)) {
                y+=yspeed;
            } else {
                y = destY;
            }
        }
    //}
}
