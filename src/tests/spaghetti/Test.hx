package tests.spaghetti;

import haxe.unit.TestRunner;
import tests.spaghetti.core.*;
import tests.spaghetti.geom.*;


class Test {
    static function main() {
        var runner = new TestRunner();

        runner.add( new Array2DTest() );
        runner.add( new RandomTest() );
        runner.add( new EnvTest() );

        runner.add( new ColorTest() );

        runner.run();
    }
}