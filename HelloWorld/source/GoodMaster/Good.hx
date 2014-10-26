package goodmaster;

class Good {
    var name = "";
    var type = -1;
    var mass = 0;
    var special:Dynamic;

    public function new(nameL:String,typeL:String,massL:Int,v1:Int,v2:Int) {
    //two args
    //food
    //hunger satisfication v1
    //Deterioration v2 (higher is faster spoiling, 0 is never spoiling)

        name = nameL;
        type = goodLookup(typeL);
        if (type==0) {
            createFood(v1,v2);
        } else {
            trace("You dun goofed and typed food wrong");
        }
    }
    public function new(nameL:String,typeL:String,massL:Int,v1:Int,v2:Int,v3:Bool,v4:Int) {
    //four args
    //weapon
    //v1:damage
    //v2:speed (wait time to attack again, 60 cycles per sec so speed=60 is 1 atk/sec 30= 2 atk/sec)
    //v3:ranged weapon? (true if ranged, false if melee)
    //v4:range (1 distance unit per point)


        name = nameL;
        type = goodLookup(typeL);
        if (type==1) {
            createWeapon(v1,v2,v3,v4);
        } else {
            trace("You dun goofed and typed weapon wrong");
        }
    }

    public function createFood(hungerSat:Int,deterior:Int):Void {
        special = new Food(hungerSat,deterior);
    }
    public function createWeapon(damage:Int,speed:Int,projectile:Bool,range:Int):Void {
    //4 args
        if (projectile!=true && range!=1) {
            range = 1;
        }

    }
    public function goodLookup(str:String):Int {
        var rtrn = -1;
        if (str=="food") {
            rtrn = 0;
        }
        if (str=="weapon") {
            rtrn = 1;
        }
        if (str=="armor") {
            rtrn = 2;
        }

    return rtrn;

    }

}
