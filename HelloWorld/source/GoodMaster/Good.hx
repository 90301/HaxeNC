package GoodMaster;
import Bool;
class Good {
    var name = "";
    var type = -1;
    var mass = 0;
    var special;
    public function new(nameL:String,typeL:String,massL:Int,v1:Int,v2:Int) {
    //two args
    //food
    //hunger satisfication v1
    //Deterioration v2 (higher is faster spoiling, 0 is never spoiling)

    name = nameL;
    type = goodLookup(typeL);
    if (type==0) {
        createFood(v1,v2);
    }
    }
    public function new(nameL:String,typeL:String,massL:Int,v1:Int,v2:Int) {
    //two args
    //food
    //hunger satisfication v1
    //Deterioration v2 (higher is faster spoiling, 0 is never spoiling)

        name = nameL;
        type = goodLookup(typeL);
        if (type==0) {
            createFood(v1,v2);
        }
    }

    public function createFood(hungerSat:Int,deterior:Int):Void {
        special = new Food(hungerSat,deterior);
    }
    public function createWeapon(damage:Int,speed:Int,projectile:Bool,range:Int):Void {
    //4 args
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
