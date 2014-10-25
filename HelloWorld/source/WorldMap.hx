package ;

import flixel.util.FlxRandom;

class WorldMap {

    public static inline var PLAINS=0, FOREST=1, MOUNTAINS=2, PLAINS=3;

    private var map:Array<Array<Int>> = new Array<Array<Int>>();

    public function new(w:Int, h:Int) {
        var v;
        for (x in 0 ... w) {
            var col:Array<Int> = new Array<Int>();
            map.push(col);
            for (y in 0 ... h) {
                if (x%10 == 0) {
                    if (y%10 == 0) {
                        col.push(FlxRandom.intRanged(0, 3));
                    } else {
                        col.push(col[y-1])
                    }
                } else {
                    col.push(map[x-1][y]);
                }
            }
        }
    }

    public function getTerrain(x:Int, y:Int) {
        return map[x][y];
    }

}
