package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
    var xPos=0;
    var yPos=0;
    var width = 80;
    var height = 20;
    private var fxbtn:FlxButton;
    private var fxbtns:Array<FlxButton> = new Array<FlxButton>();
	override public function create():Void
	{
        xPos=0;

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */

	override public function destroy():Void
	{
		super.destroy();
	}

    private var mouseStartX=0, mouseStartY=0;
    private var mouseDragging=false;

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
    /*
        xPos+=width;
        if (xPos>400) {
            xPos=0;
            yPos+=height;
        }
        var flxBtn=new FlxButton(xPos,yPos,"a");

        add(flxBtn);
        fxbtns.push(flxBtn);
    */

        if (FlxG.mouse.justPressed) {
            mouseStartX = FlxG.mouse.x;
            mouseStartY = FlxG.mouse.y;
        }

        if (FlxG.mouse.pressed) {
            var mouseDX = FlxG.mouse.x - mouseStartX;
            var mouseDY = FlxG.mouse.y - mouseStartY;
            if (mouseDX > 2 || mouseDY > 2) {
                mouseDragging = true;
            }
            if (mouseDragging) {
            }
        }

        if (FlxG.mouse.justReleased) {
            if (mouseDragging) {
            } else {
                Main.player.setDest(FlxG.mouse.x, FlxG.mouse.y);
            }
        }

		super.update();
	}	
}