package spaghetti.geom;


/*!
 *
 */
class Point implements IPointable {
    /*!
     *
     */
    public function new(x : Int, y : Int) {
        this.x = x;
        this.y = y;
    }

    /*!
     *
     */
    public static function fromSize(a_size : Size) : Point {
        return new Point( a_size.width, a_size.height );
    }

    public var x       (default, default) : Int;
    public var y       (default, default) : Int;

    /*!
     *
     */
    public function offset(dx : Int, dy : Int) : Void {
        this.x += dx;
        this.y += dy;
    }

    /*!
     *
     */
    public function offsetPoint(other : Point) : Void {
        this.x += other.x;
        this.y += other.y;
    }

    /*!
     *
     */
    public static function equality(left : Point, right : Point) : Bool {
        return left.x == right.x && left.y == right.y;
    }
}

// Local Variables:
//   coding: utf-8
// End: