package ;

import flixel.util.FlxRandom;

class WorldMap {

    public static inline var PLAINS=0;
    public static inline var FOREST=1;
    public static inline var MOUNTAINS=2;
    public static inline var ROAD=3;

    public var w:Int;
    public var h:Int;
    private var map:Array<Array<Int>> = new Array<Array<Int>>();

    public function new(w:Int, h:Int) {
        this.w = w;
        this.h = h;
        var v;
        for (x in 0 ... w) {
            var col:Array<Int> = new Array<Int>();
            map.push(col);
            for (y in 0 ... h) {
                if (x%10 == 0) {
                    if (y%10 == 0) {
                        col.push(FlxRandom.intRanged(0, 3));
                    } else {
                        col.push(col[y-1]);
                    }
                } else {
                    col.push(map[x-1][y]);
                }
            }
        }
    }

    public function getTerrain(x:Int, y:Int) {
        return map[Std.int(x/10)][Std.int(y/10)];
    }

}
