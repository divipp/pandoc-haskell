
.PHONY: all
all: pandocHaskell.pdf

pandocHaskell.pdf: App.pdf Data.pdf Pandoc.pdf NumClasses.pdf Classes.pdf

%.pdf: %.md
	pandoc --from=markdown --to=latex --toc --number-sections --highlight-style=tango --pdf-engine=xelatex $< --indented-code-classes=haskell --toc-depth=3 -o $@

.PHONY: normalize
normalize: normalized.md
	cp -i pandocHaskell.md pandocHaskellOld.md
	cp normalized.md pandocHaskell.md

normalized.md: pandocHaskell.md FixNormalization.hs
	pandoc --standalone --from=markdown --to=markdown $< --indented-code-classes=haskell --atx-headers -F FixNormalization.hs -o $@

%.png: %.dot
	dot $< -o $@

%.pdf: %.dot
	dot -Tpdf $< -o $@

%.eps: %.dot
	dot -Teps $< -o $@

