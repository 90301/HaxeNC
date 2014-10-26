package GoodInv;
class Food {
    var deterioration = 100;
    var decay = 0;

    public function new() {
    deterioration=100;
    }
    public function new(deteriorationL:Int) {
    this.deterioration=deteriorationL;
    }
    public function cycle(){
    if (deterioration > 0) {
    deterioration -= decay;
    }
    }
}
