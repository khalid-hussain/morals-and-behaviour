default: epub

combine:
	cat \
	metadata.yaml \
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
	12-the-way-to-attend-halaqaat.md > combined.md

epub: combine
	pandoc -f markdown+startnum+four_space_rule \
	-t epub \
	-o akhlaq-wa-siyar.epub --toc \
	--epub-embed-font="fonts/LinBiolinum-Regular.ttf" \
	--epub-embed-font="fonts/LinBiolinum-Italic.ttf" \
	--epub-embed-font="fonts/LinBiolinum-Bold.ttf" \
	combined.md

latex: combine
	pandoc -f markdown+startnum+four_space_rule \
	-t latex -o ../book/content.tex \
	--toc --pdf-engine=xelatex \
	--top-level-division=chapter \
	combined.md

clean:
	rm combined.md