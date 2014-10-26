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
                /*if (x%10 == 0) {
                    if (y%10 == 0) {
                        col.push(FlxRandom.intRanged(0, 3));
                    } else {
                        col.push(col[y-1]);
                    }
                } else {
                    col.push(map[x-1][y]);
                }*/
                col.push(getTerrain(x, y));
            }
        }
    }

    public function getTerrain(x:Int, y:Int) {
        return map[Std.int(x/10)][Std.int(y/10)];
    }



    // Simplex Noise

    private function genTerrain(x:Int, y:Int):Int {
        return Std.int(4 * (simplexNoise(x/8.0, y/8.0)-0.1));
    }

    // Hardcore4Life Simplex

    private static var grad3:Array<Array<Int>> = [[1,1,0], [-1,1,0], [1,-1,0], [-1,-1,0],
                                                  [1,0,1], [-1,0,1], [1,0,-1], [-1,0,-1],
                                                  [0,1,1], [0,-1,1], [0,1,-1], [0,-1,-1]];

    private static var F2 = 0.5*(Math.sqrt(3.0)-1.0);
    private static var G2 = (3.0-Math.sqrt(3.0))/6.0;
    private static var perm:Array<Int> = new Array<Int>();
    private static var permMod12:Array<Int> = initPerm();
    private static function initPerm():Array<Int> {
        var pm12:Array<Int> =  new Array<Int>();
        for (i in 0 ... 512) {
            perm.push(i & 255);
            pm12.push(perm[i] % 12);
        }
        return pm12;
    }

    private static function fastFloor(x:Float):Int {
        var xi = Std.int(x);
        if (x<xi) {
            return xi-1;
        } else {
            return xi;
        }
    }

    private static function dot(g:Array<Int>, x:Float, y:Float):Float {
        return g[0]*x + g[1]*y;
    }

    // 2D Simplex Noise
    public static function simplexNoise(xin:Float, yin:Float):Float {
        var n0:Float;
        var n1:Float;
        var n2:Float;
        var s = (xin+yin)*F2;
        var i = fastFloor(xin+s);
        var j = fastFloor(yin+s);
        var t = (i+j)*G2;
        var X0 = i-t;
        var Y0 = j-t;
        var x0 = xin-X0;
        var y0 = yin-Y0;
        var i1:Int;
        var j1:Int;
        if (x0 > y0) {
            i1 = 1;
            j1 = 0;
        } else {
            i1 = 0;
            j1 = 1;
        }
        var x1 = x0 - i1 + G2;
        var y1 = y0 - j1 + G2;
        var x2 = x0 - 1.0 + 2.0 * G2;
        var y2 = y0 - 1.0 + 2.0 * G2;
        var ii = i & 255;
        var jj = j & 255;
        var gi0 = permMod12[ii+perm[jj]];
        var gi1 = permMod12[ii+i1+perm[jj+j1]];
        var gi2 = permMod12[ii+1+perm[jj+1]];
        var t0 = 0.5 - x0*x0-y0*y0;
        if (t0 < 0) {
            n0 = 0.0;
        } else {
            t0 *= t0;
            n0 = t0 * t0 * dot(grad3[gi0], x0, y0);
        }
        var t1 = 0.5 - x1*x1-y1*y1;
        if (t1 < 0) {
            n1 = 0.0;
        } else {
            t1 *= t1;
            n1 = t1 * t1 * dot(grad3[gi1], x1, y1);
        }
        var t2 = 0.5 - x2*x2-y2*y2;
        if (t2 < 0) {
            n2 = 0.0;
        } else {
            t2 *= t2;
            n2 = t2 * t2 * dot(grad3[gi2], x2, y2);
        }
        return 70.0 * (n0 + n1 + n2);
    }

}
