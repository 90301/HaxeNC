package;

import flixel.util.FlxRandom;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSpriteUtil;
import flixel.system.FlxSound;

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
    private var _btnMute:FlxButton;
    public var bgmusic:FlxSound;
    static var musics = ["assets/music/..."];

	override public function create():Void
	{
        inti=0;

        var walkerText = new FlxText(inti, FlxG.width/2 - 75, FlxG.height/2, "Music by Walker Cobb");
        add(walkerText);
        var walkerIsFuckingAwesomeText = new FlxText(inti, FlxG.width/2 - 125, FlxG.height/2 + 32, "He's really awesome. We called him up at 1 in");
        var wifat2 = new FlxText(inti, FlxG.width/2 - 125, FlxG.height/2 + 56, "the morning, and he got us this soundtrack.");
        var walkerYoutubeText = new FlxText(inti, FlxG.width/2 - 100, FlxG.height/2 + 88, "youtube.com/user/WalkerCobbMusic");
        add(walkerIsFuckingAwesomeText);
        add(wifat2);
        add(walkerYoutubeText);
        _btnMute = new FlxButton(FlxG.width/2 - 50, FlxG.height/2 + 120, "Mute", clickMute);
        add(_btnMute);
        _btnPlay = new FlxButton(FlxG.width/2 - 50, FlxG.height/3, "play", clickPlay);
        add(_btnPlay);

        bgmusic = new FlxSound();
        playMusic();
        bgmusic.play();

		super.create();
	}

	private function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }

    private function clickMute():Void {
        if (bgmusic.playing) {
            bgmusic.pause();
            _btnMute.text = "Unmute";
        } else {
            bgmusic.resume();
            _btnMute.text = "Mute";
        }
    }

    private function playMusic():Void {
        bgmusic.loadEmbedded(FlxRandom.getObject(musics), playMusic);
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