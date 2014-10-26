package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSpriteUtil;
/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
    var inti = 0;
    private var _btnPlay:FlxButton;
	override public function create():Void
	{
        inti=0;
        //var ftxt = new FlxText(inti,0,100,"Hello World");
        //add(ftxt);
        _btnPlay = new FlxButton(FlxG.width/2 - 50, FlxG.height/3, "play", clickPlay);
        add(_btnPlay);
		super.create();
	}

	private function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{

        inti++;
		super.update();
	}	
}