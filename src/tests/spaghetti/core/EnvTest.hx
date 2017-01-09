package tests.spaghetti.core;

import haxe.Int64;
import haxe.unit.TestCase;
import spaghetti.core.Env;


class EnvTest extends TestCase {
    public function testTickCount() {
        var before = Env.getTickCount();

        Sys.sleep( 0.3 );
        
        var after = Env.getTickCount();

        assertTrue( after > before );
    }
}

// Local Variables:
//   coding: utf-8
// End: