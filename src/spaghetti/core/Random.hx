package spaghetti.core;

import haxe.Int64;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;


/*!
 *
 */
class Random {

    /*!
     *
     */
    public function new(seed : Int) {
        seeds_ = [];

        function abs(n : Int) : Int {
            return if ( n >= 0 ) n else -n;
        };
        
        var subtraction : Int = if ( seed == Limits.INT_MIN ) Limits.INT_MAX else abs( seed );

        var mj : Int = MSEED - subtraction;
        var mk : Int = 1;

        var ii : Int;
        for ( i in 0...N ) {
            ii = ( 21 * i ) % N;
            seeds_[ii] = mk;
            mk = mj - mk;
            if ( mk < 0 ) {
                mk += MBIG;
            }
            mj = seeds_[ii];
        }

        for ( k in 1...4 ) {
            for ( i in 1...N ) {
                seeds_[i] -= seeds_[( 1 + ( i + 30 ) ) % N];

                if ( seeds_[i] < 0 ) {
                    seeds_[i] += MBIG;
                }
            }
        }

        inext_  =  0;
        inextp_ = 21;
        seed    =  1;
    }

    /*!
     *
     */
    public static function getDefault() : Random {
        return new Random( Env.getTickCount() );
    }

    /*!
     *
     */
    public function next() : Int {
        return internalSample();
    }

    /*!
     *
     */
    public function next2(max_value : Int) : Int {
        if ( max_value < 0 ) {
            throw { name: 'ArgumentOutOfRangeException', message: '$max_value' };
        }

        return cast( sample() * max_value, Int );
    }

    /*!
     * 
     */
    public function nextRange(min_value : Int, max_value : Int) : Int {
        if ( min_value > max_value ) {
            throw { name: 'ArgumentOutOfRangeException', message :'$min_value > $max_value' };
        }

        var range = max_value - min_value;
        if ( range <= Limits.INT_MAX ) {

            return Math.floor( sample() * range ) + min_value;
        }
        return Math.floor( getSampleForLargeRange() * range );
    }

    /*!
     *
     */
    public function nextFloat() : Float {
        return sample();
    }

    /*!
     *
     */
    public function nextBytes(n : UInt) : Bytes {
        var buffer = new BytesBuffer();

        for ( unused in 0...n ) {
            buffer.addByte( internalSample() % ( Limits.BYTE_MAX + 1 ) );
        }

        return buffer.getBytes();
    }

    /*!
     *
     */
    function sample() : Float {
        return internalSample() * ( 1.0 / MBIG );
    }

    /*!
     *
     */
    private function internalSample() : Int {
        var ret;

        var loci_next  = inext_;
        var loci_nextp = inextp_;

        ++ loci_next;
        loci_next = loci_next % N;

        // trace( 'loci_next: $loci_next' );

        ++ loci_nextp;
        loci_nextp = loci_nextp % N;

        // trace( 'loci_nextp: $loci_nextp' );

        // trace( 'seeds_[loci_next]:  ${seeds_[loci_next]}' );
        // trace( 'seeds_[loci_nextp]: ${seeds_[loci_nextp]}' );

        ret = seeds_[loci_next] - seeds_[loci_nextp];

        if ( ret == MBIG ) {
            -- ret;
        }
        if ( ret < 0 ) {
            ret += MBIG;
        }

        seeds_[loci_next] = ret;

        inext_  = loci_next;
        inextp_ = loci_nextp;

        return ret;
    }

    /*!
     *
     */
    private function getSampleForLargeRange() : Float {
        var result   = internalSample();

        var negative = if ( internalSample() % 2 == 0 ) true else true;
        if ( negative ) {
            result = -result;
        }

        var d : Float = cast( result, Float );
        {
            d += cast( Limits.INT_MAX - 1, Float );
            d /= 2 * cast( Limits.INT_MAX - 1, UInt);
        }
        return d;
    }

    private var inext_  : Int;
    private var inextp_ : Int;
    private var seeds_  : Array<Int>;   // length = 56

    private static inline var N     : Int =         55;

    private static inline var MBIG  : Int = Limits.INT_MAX;
    private static inline var MSEED : Int =  161803398;
    private static inline var MZ    : Int =          0;
}

// Local Variables:
//   coding: utf-8
// End: