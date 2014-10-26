package goodmaster;
class MasterGoodList {
    public var goodList:Array<Good> = new Array<Good>();
    public function new() {
    //CREATE ALL THE GOODS!!!!!
    //food (name , type , mass , sation , deterioration)
    var tempGood:Good = new Good("Cookies","food",1,1,5);
    goodList.push(tempGood);

    var tempGood:Good = new Good("Brownies","food",2,1,5);
    goodList.push(tempGood);

    }
}
