package dungeonfreak.app;

import dungeonfreak.ui.GameRunner;


class Main {
    static function main() {
        var runner = new GameRunner();

        runner.run( new BootScreen() );
    }
}