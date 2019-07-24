default: epub

combine-main:
	@printf "\ncombine-main():\n"
	cat \
	_introduction.md \
	1-the-treatment.md \
	2-the-mind-and-repose.md \
	3-knowledge.md \
	4-morals-and-behavior.md \
	5-friends-close-friends.md \
	6-kinds-of-love.md \
	7-kinds-of-physical-beauty.md \
	8-practical-morality.md \
	9-treatment-of-corrupt-morality.md \
	10-characteristics-of-the-soul.md \
	11-mans-desire-to-know.md \
	12-the-way-to-attend-halaqaat.md > main-matter.md

combine-epub: combine-main
	@printf "\ncombine-epub():\n"
	cat \
	metadata.yaml \
	_macros.md \
	main-matter.md > combined.md
	sed -i 's/\[\^mean-[[:alnum:]-]*\]//g' combined.md

combine-latex: combine-main
	@printf "\ncombine-latex():\n"
	cat \
	metadata.yaml \
	_macros.md \
	main-matter.md \
	_definitions.md > combined.md

epub: combine-epub
	@printf "\nepub():\n"
	pp -html combined.md | \
	pandoc -f markdown+startnum+four_space_rule \
	-t epub \
	-o akhlaq-wa-siyar.epub --toc \
	--epub-embed-font="fonts/LinBiolinum-Regular.ttf" \
	--epub-embed-font="fonts/LinBiolinum-Italic.ttf" \
	--epub-embed-font="fonts/LinBiolinum-Bold.ttf" \

latex: combine-latex
	@printf "\nlatex():\n"
	pp -pdf combined.md | \
	pandoc -f markdown+startnum+four_space_rule \
	-t latex \
	--top-level-division=chapter | \
	sed '/\\\def\\\labelenumi/d' > ../book/content.tex

clean:
	@printf "\nclean():\n"
	rm combined.md
	rm main-matter.md