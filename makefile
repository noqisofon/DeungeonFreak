.PHONY : build
build:
	haxe -cp ./src -main dungeonfreak.app.Main -neko ./export/dungeonfreak.n
