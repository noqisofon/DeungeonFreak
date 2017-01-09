package spaghetti.geom;


/*!
 *
 */
class Rect implements IRectangle {
    /*!
     *
     */
    public function new(x : Int, y : Int, width : Int, height : Int) {
        this.x      = x;
        this.y      = y;
        this.width  = width;
        this.height = height;
    }

    /*!
     *
     */
    public function get_left() : Int {
        return this.x;
    }

    /*!
     *
     */
    public function get_top() : Int {
        return this.y;
    }

    /*!
     *
     */
    public function get_right() : Int {
        return this.x + this.width;
    }

    /*!
     *
     */
    public function get_bottom() : Int {
        return this.y + this.height;
    }

    /*!
     *
     */
    public function get_topLeft() : Point {
        return new Point( this.left, this.top );
    }

    /*!
     *
     */
    public function get_topRight() : Point {
        return new Point( this.right this.top );
    }

    /*!
     *
     */
    public function get_bottomLeft() : Point {
        return new Point( this.right this.bottom );
    }

    /*!
     *
     */
    public function get_bottomRight() : Point {
        return new Point( this.right this.bottom );
    }

    /*!
     *
     */
    public function get_center() : Point {
        return new Point( Math.floor( ( this.left + this.right ) / 2 ), Math.floor( ( this.top + this.bottom ) / 2 ) );
    }

    /*!
     *
     */
    public function contains(x : Int, y : Int) : Bool {
        if ( x < this.x ) {
            return false;
        }
        if ( x >= this.right ) {
            return false;
        }
        if ( y < this.y ) {
            return false;
        }
        if ( y >= this.bottom ) {
            return false;
        }
        return true;
    }

    /*!
     *
     */
    public function containsPoint(a_point : Point) : Bool {
        return contains( a_point.x, a_point.y );
    }

    /*!
     *
     */
    public function containsRect(other : Rect) : Bool {
        if ( other.left < this.left ) {
            return false;
        }
        if ( other.right > this.right ) {
            return false;
        }
        if ( other.top < this.top ) {
            return false;
        }
        if ( other.bottom > this.bottom ) {
            return false;
        }
        return true;
    }

    /*!
     *
     */
    public function overlaps(other : Rect) : Bool {
        if ( this.left > other.right ) {
            return false;
        }
        if ( this.right < other.left ) {
            return false;
        }
        if ( this.top > other.bottom ) {
            return false;
        }
        if ( this.bottom < other.top ) {
            return false;
        }
        return true;
    }

    public var x       (default, default) : Int;
    public var y       (default, default) : Int;
    public var width   (default, default) : Int;
    public var height  (default, default) : Int;

    public var left        (get, never) : Int;
    public var top         (get, never) : Int;
    public var right       (get, never) : Int;
    public var bottom      (get, never) : Int;

    public var topLeft     (get, never) : Point;
    public var topRight    (get, never) : Point;
    public var bottomLeft  (get, never) : Point;
    public var bottomRight (get, never) : Point;

    public var center      (get, never) : Point;
}

// Local Variables:
//   coding: utf-8
// End: