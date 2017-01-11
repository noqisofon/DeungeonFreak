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
     * 0xaarrggbb
     */
    public static function fromARGB(packed_color : Int) : Color {
        var a_color : Color;
        if ( color_cache__.exists( packed_color ) ) {
            a_color = color_cache__.get( packed_color );
        } else {
            var alpha =  this >>> 24;
            var red   = (this >>> 16) & 0xff;
            var green = (this >>>  8) & 0xff;
            var blue  =  this         & 0xff;
 
            a_color = new Color( red, green, blue, alpha );

            color_cache__[packed_color] = a_color;
        }
        return a_color;
    }

    public var red    (get, set) : Int;
    public var green  (get, set) : Int;
    public var blue   (get, set) : Int;
    public var alpha  (get, set) : Int;

    public static var          black (get, never) : Color;
    public static function get_black()            : Color { return Color.from( 0x00000000 ); }

    /*!
     *
     */
    public function toArgb() : PackedARGB {
        return PackedARGB( this.red, this.green, this.blue, this.alpha );
    }
}

// Local Variables:
//   coding: utf-8
// End: