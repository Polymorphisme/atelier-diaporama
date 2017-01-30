.PHONY: clean withversion run

INPUT=atelierTheme.md
OUTPUT=atelierTheme.pdf
DEP=$(wildcard *.sty *.jpg *.png)
THEME=AteliersCli

$(OUTPUT): $(INPUT) $(DEP)
	pandoc -st beamer -V theme:$(THEME) -V lang:francais $(INPUT) -o $(OUTPUT)

withversion: $(INPUT) $(DEP)
	<$(INPUT) ./inject_version |\
		pandoc -st beamer -V theme:$(THEME) -V lang:francais -o $(OUTPUT)

run: $(OUTPUT)
	evince $(OUTPUT)

clean:
	rm -f $(OUTPUT)
