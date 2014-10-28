package goodmaster;

class MasterGoodList {
    public var goodList:Array<Good> = new Array<Good>();
    public function new() {
    //CREATE ALL THE GOODS!!!!!
    //food (name , type , mass , sation , deterioration)
        var tempGood:Good = new Good("Cookies","food",1,1,5);
        goodList.push(tempGood);

        var tempGood:Good = new Good("Brownies","food",2,2,5);
        goodList.push(tempGood);

        meatForking("beef",5,4,6,false);


    }
    public function meatForking(baseName:String,mass:Int,baseSat:Int,baseDet:Int,lec:Bool):Void{
        var tempGood:Good = new Good(baseName,"food",mass,baseSat,baseDet);
        goodList.push(tempGood);
    }
}
