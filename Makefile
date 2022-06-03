all: report

SOURCES: example.md

report: ${SOURCES}
	pandoc -o report.pdf --citeproc -N --metadata-file=metadata.yml --bibliography=bibliography.bib --csl=ieee.csl *.md

clean:
	rm *.pdf