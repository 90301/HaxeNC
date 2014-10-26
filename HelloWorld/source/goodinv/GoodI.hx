package goodinv;
import goodmaster.Good;
import goodmaster.MasterGoodList;
class GoodI {
    public var goodRef:Good;
    public var special:Dynamic;
    public var quant:Int;
    public function new(itemIDL:Int,quantL:Int) {
        quant = quantL;
        goodRef = Main.mgl.goodList[itemIDL];
    }

}
