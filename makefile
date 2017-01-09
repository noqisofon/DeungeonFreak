.PHONY : build
build:
	haxe -cp ./src -main dungeonfreak.app.Main -neko ./export/dungeonfreak.n

.PHONY : test
test: spaghetti-test

.PHONY: spaghetti-test
spaghetti-test: ./export/spaghetti-test.n
	neko ./export/spaghetti-test.n

./export/spaghetti-test.n: ./src/tests/spaghetti/Test.hx ./src/tests/spaghetti/core/Array2DTest.hx ./src/tests/spaghetti/core/RandomTest.hx ./src/tests/spaghetti/core/EnvTest.hx
	haxe -cp ./src -main tests.spaghetti.Test -neko $@
