package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.group.FlxTypedGroup;

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
    var playerSprite:FlxSprite;
    var tiles:Array<Array<FlxSprite>> = new Array<Array<FlxSprite>>();
    var cities:FlxTypedGroup<City>;

	override public function create():Void
	{
        for (x in 0 ... Main.map.w) {
            var tileCol:Array<FlxSprite> = new Array<FlxSprite>();
            tiles.push(tileCol);
            for (y in 0 ... Main.map.h) {
                var terrain = Main.map.getTerrain(10*x, 10*y);
                var tile = new FlxSprite();
                switch (terrain) {
                case WorldMap.PLAINS:
                    tile.loadGraphic("assets/images/plain.png");
                case WorldMap.FOREST:
                    tile.loadGraphic("assets/images/tree.png");
                case WorldMap.MOUNTAINS:
                    tile.loadGraphic("assets/images/mountain.png");
                case WorldMap.ROAD:
                    tile.loadGraphic("assets/images/road.png");
                default:
                    tile.makeGraphic(100, 100, FlxColor.RED);
                }
                tile.setGraphicSize(10, 10);
                tile.updateHitbox();
                tile.x = 10*x;
                tile.y = 10*y;
                tileCol.push(tile);
            }
            cities = new FlxTypedGroup<City>();
            add(cities);
            for (city in Main.map.cities) {
                city.makeGraphic(100, 100, FlxColor.PURPLE);
                city.setGraphicSize(10, 10);
                city.updateHitbox();
                cities.add(city);
            }
        }

        playerSprite = new FlxSprite();
        playerSprite.loadGraphic("assets/images/player.png");
        playerSprite.setGraphicSize(10, 10);
        playerSprite.updateHitbox();
        add(playerSprite);

        FlxG.camera.follow(playerSprite, FlxCamera.STYLE_TOPDOWN_TIGHT);
        FlxG.camera.setBounds(0, 0, 10*Main.map.w, 10*Main.map.h, true);
        FlxG.camera.flash(0);

        Main.player.x = 500;
        Main.player.y = 500;
        Main.player.setDest(500, 500);

        MenuState.playMusic();

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

    private var mouseStartX=0.0;
    private var mouseStartY=0.0;
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
            mouseDragging = false;
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

        Main.player.move();
        playerSprite.x = Main.player.x;
        playerSprite.y = Main.player.y;

		super.update();

        FlxG.overlap(playerSprite, cities, touchCity);
	}

    private var hud:HUD = null;

    private function touchCity(ps:FlxSprite, city:City):Void {
        hud = new HUD();
        add(hud);
    }

    override public function draw() {
        var camW = FlxG.camera.width;
        var camH = FlxG.camera.height;
        var startX;
        if (playerSprite.x < camW/2) {
            startX = camW/2;
        } else if (playerSprite.x >= 10*Main.map.w - camW/2) {
            startX = 10*Main.map.w - camW/2;
        } else {
            startX = playerSprite.x;
        }
        var startY;
        if (playerSprite.y < camH/2) {
            startY = camH/2;
        } else if (playerSprite.y >= 10*Main.map.h - camH/2) {
            startY = 10*Main.map.h - camH/2;
        } else {
            startY = playerSprite.y;
        }
        for (x in (Std.int((startX-camW/2)/10)-5) ... (Std.int((startX+camW/2)/10))+5) {
            for (y in (Std.int((startY-camH/2)/10)-5) ... (Std.int((startY+camH/2)/10))+5) {
                if (x >= 0 && x < Main.map.w && y >= 0 && y < Main.map.h) {
                    tiles[x][y].draw();
                }
            }
        }

        super.draw();
    }
}