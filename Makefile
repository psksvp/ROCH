SOURCES=$(wildcard ./book*.md)

outputDirs:
	mkdir -p ./output

epub: $(SOURCES) outputDirs
	pandoc --embed-resources  -t epub3 --css=./css/style.epub.css \
					--metadata title="The Return of the Condor Heroes (神鵰俠侶)" \
					--metadata author="Jin Yong" \
					--epub-cover-image=cover.jpeg \
					--top-level-division=chapter \
					-o output/HSDS.epub README.md $(SOURCES)
           
html:  $(SRCS) outputDirs
	pandoc --embed-resources=true --standalone \
					-t html5 \
					--toc \
					--css=./css/style.epub.css \
					--top-level-division=chapter \
					--metadata pagetitle="The Return of the Condor Heroes (神鵰俠侶) by Jin Yong" \
					-o output/HSDS.html README.md $(SOURCES)

clean:
	rm -rf output