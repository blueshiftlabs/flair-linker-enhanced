FlairLinker.zip: manifest.json FlairLinker.user.js icon-16.png icon-48.png icon-128.png
	zip -u -v -db $@ $^

clean:
	rm FlairLinker.zip
