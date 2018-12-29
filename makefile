.PHONY : build
build:
	haxe -cp ./src -main dungeonfreak.app.Main -cs ./export/dungeonfreak

.PHONY : test
test: spaghetti-test

.PHONY: spaghetti-test
spaghetti-test: ./export/spaghetti-test.n
	neko ./export/spaghetti-test.n

test-srcs = ./src/tests/spaghetti/Test.hx         \
            ./src/tests/spaghetti/geom/ColorTest.hx  \
            ./src/tests/spaghetti/core/EnvTest.hx    \
            ./src/tests/spaghetti/core/RandomTest.hx \
            ./src/tests/spaghetti/core/Array2DTest.hx

./export/spaghetti-test.n: $(test-srcs)
	haxe -cp ./src -main tests.spaghetti.Test -neko $@
