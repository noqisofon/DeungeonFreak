package spaghetti.core;

import sys.io.File;
import sys.io.FileInput;


class Env {

    public static function getTickCount() : Int {
#if cs
        // C# では TickCount を使えばいいけど………
        return sys.system.Environment.TickCount;
#else
        // linux なら、'/proc/uptime' の 1 つ目の値を 1000 倍して返せばいいっぽい 
        var input = File.read( "/proc/uptime" );

        var line = input.readLine();

        input.close();

        var parts = line.split( " " );

        return Math.floor( Std.parseFloat( parts[0] ) * 1000.0 );
#end
    }
}

// Local Variables:
//   coding: utf-8
// End: