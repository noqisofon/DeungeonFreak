package spaghetti.core;

import haxe.ds.Vector;


/*!
 *
 */
class Array2D<T> {
    /*!
     *
     */
    public function new(width : Int, height : Int) {
        this.width  = width;
        this.height = height;

        values_     = new Vector( width * height );
        pointCache_ = new ObjectMap();
    }

    /*!
     *
     */
    public static withSize(a_size : Size) {
        return new Array2D( a_size.width, a_size.height );
    }

    /*!
     *
     */
    public function get_size() : Size {
        return new Size( this.width, this.height );
    }

    /*!
     *
     */
    public function get_bounds() : Rect {
        return new Rect( 0, 0, this.width, this.height );
    }

    /*!
     *
     */
    @:arrayAccess
    public inline function at(x : Int, y : Int) : T {
        return values_[calcIndex( x, y )];
    }
    
    /*!
     *
     */
    @:arrayAccess
    public inline function put(x : Int, y : Int, value : T) : Void {
        values_[calcIndex( x, y )] = value;
    }

    /*!
     *
     */
    public function fill(value : T) : Void {
        for ( index in 0..values_.length ) {
            values_[index] = value;
        }
    }

    /*!
     *
     */
    public function fillMap(callback : Point -> T) : Void {
        for ( index in 0..values_.length ) {
            values_[index] = callback( indexToPoint( index ) );
        }
    }

    /*!
     *
     */
    private function calcIndex(x : Int, y : Int) : Int {
        return ( y * this.width ) + x;
    }

    /*!
     *
     */
    private function indexToPoint(index : Int) : Point {
        var a_point : Point;
        // if ( pointCache_.exists( index ) ) {
        //     a_point = pointCache_.get( index );
        // } else {
        var x = index % width;
        var y = Math.floor( index / height );
        
        a_point = new Point( x, y );
        pointCache_.set( index, a_point );
        // }
        return a_point;
    }

    public var width  (default, never) : Int;
    public var height (default, never) : Int;

    public var size   (get, never) : Size;
    public var bounds (get, never) : Rect;

    private var values_     : Array<T>;
    // private var pointCache_ : Map<Int, Point>;    
}

// Local Variables:
//   coding: utf-8
// End: