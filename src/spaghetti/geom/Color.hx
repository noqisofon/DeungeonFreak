package spaghetti.geom;


/*!
 *
 */
class Color {
    /*!
     *
     */
    public function new(red : Int = 0, green : Int = 0, blue : Int = 0, alpha : Int = 255) {
        this.red   = red;
        this.green = green;
        this.blue  = blue;
        this.alpha = alpha;
    }

    /*!
     *
     */
    public static function fromColorValue(a_color_value : ColorValue) : Color {
        return new Color( Math.floor( a_color_value.red   * 255 ),
                          Math.floor( a_color_value.green * 255 ),
                          Math.floor( a_color_value.blue  * 255 ),
                          Math.floor( a_color_value.alpha * 255 ) );
    }

    /*!
     * 0xaarrggbb
     */
    public static function fromARGB(packed_color : Int) : Color {
        var a_color : Color;
        if ( color_cache__.exists( packed_color ) ) {
            a_color = color_cache__.get( packed_color );
        } else {
            var alpha =  packed_color >>> 24;
            var red   = (packed_color >>> 16) & 0xff;
            var green = (packed_color >>>  8) & 0xff;
            var blue  =  packed_color         & 0xff;
 
            a_color = new Color( red, green, blue, alpha );

            color_cache__[packed_color] = a_color;
        }
        return a_color;
    }

    public var red    (default, default) : Int;
    public var green  (default, default) : Int;
    public var blue   (default, default) : Int;
    public var alpha  (default, default) : Int;

    /*!
     *
     */
    public function equals(other : Color) : Bool {
        return this.red == other.red &&
            this.green == other.green &&
            this.blue == other.blue &&
            this.alpha == other.alpha;
    }

    /*!
     *
     */
    public function toArgb() : PackedARGB {
        return new PackedARGB( this.red, this.green, this.blue, this.alpha );
    }

    /*!
     *
     */
    public function toString() {
        return 'rgba( ${this.red}, ${this.green}, ${this.blue}, ${this.alpha} )';
    }

    private static var color_cache__ : Map<Int, Color>;
}

// abstract EqualityColor(Color) to Color {
//     /*!
//      *
//      */
//     @:op(A == B)
//     public static function equals(left : EqualityColor, right : EqualityColor) : Bool {
//         return left.equals( right );
//     }

//     /*!
//      *
//      */
//     @:op(A != B)
//     public static function nequals(left : EqualityColor, right : EqualityColor) : Bool {
//         return !left.equals( right );
//     }
// }

// Local Variables:
//   coding: utf-8
// End: