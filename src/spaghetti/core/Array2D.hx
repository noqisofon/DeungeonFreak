package spaghetti.core;

import haxe.ds.Vector;
import spaghetti.geom.Point;
import spaghetti.geom.Size;
import spaghetti.geom.Rect;


/*!
 *
 */
class Array2D<T> implements IArray2D<T> {
    /*!
     *
     */
    public function new(width : Int, height : Int) {
        width_      = width;
        height_     = height;

        values_     = new Vector<T>( width * height );
        // point_cache_ = new ObjectMap();
    }

    /*!
     *
     */
    public static function withSize<A>(a_size : Size) : Array2D<A> {
        return new Array2D<A>( a_size.width, a_size.height );
    }

    public var          width  (get, never) : Int;
    public function get_width()             : Int { return width_; }

    public var          height (get, never) : Int;
    public function get_height()            : Int { return height_; }

    public var          size   (get, never) : Size;
    public function get_size()              : Size { return new Size( this.width, this.height ); }
    
    public var          bounds (get, never) : Rect;
    public function get_bounds()            : Rect { return new Rect( 0, 0, this.width, this.height ); }
    
    /*!
     * 
     *
     * \param x
     * \param y
     *
     * \return 
     */ 
    public function at(x : Int, y : Int) : Null<T> {
        return values_[calcIndex( x, y )];
    }
    
    /*!
     * 
     * 
     * \param x
     * \param y
     * \param value
     */ 
    public function put(x : Int, y : Int, value : T) : Void {
        values_[calcIndex( x, y )] = value;
    }

    /*!
     *
     */
    public function fill(value : T) : Void {
        for ( index in 0...values_.length ) {
            values_[index] = value;
        }
    }

    /*!
     *
     */
    public function fillMap(callback : Point -> T) : Void {
        for ( index in 0...values_.length ) {
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
        // if ( point_cache_.exists( index ) ) {
        //     a_point = point_cache_.get( index );
        // } else {
        var x = index % width;
        var y = Math.floor( index / height );
        
        a_point = new Point( x, y );
        // point_cache_.set( index, a_point );
        // }
        return a_point;
    }

    private var width_      : Int;
    private var height_     : Int;
    private var values_     : Vector<T>;
    // private var point_cache_ : Map<Int, Point>;    
}

// Local Variables:
//   coding: utf-8
// End: