package ;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
class HUD extends FlxSprite {
    public function new() {
        super();
        var i = 0;
        for (goodi in Main.player.inventory) {
            var good = goodi.goodRef;
            var btn = new FlxButton(0, 32*i, good.name);
            i++;
        }
    }
}
