#Este trabalho está licenciado sob a Licença Creative Commons Atribuição-CompartilhaIgual 3.0 Não Adaptada. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by-sa/3.0/ ou envie uma carta para Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

########################################
#
# ATENÇÃO
#
# POR SEGURANÇA, NÃO EDITE ESTE ARQUIVO.
#
########################################

CAP1=cap_aritmetica
CAP3=cap_equacao1d
CAP4=cap_intro
CAP5=cap_linsis
CAP6=cap_nlinsis
CAP7=cap_pvi
CAP8=cap_scilab
CAP9=cap_interp
CAP10=cap_ajuste
CAP11=cap_derivacao
CAP12=cap_integracao
CAP13=cap_pvc
CAP14=cap_python
CAP15=cap_octave

########################################
# FORMATO LIVRO PDF
########################################

pdf: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabtrue \isoctavefalse \ispythonfalse" > main.knd
	cp main-pdf-sci.knd main.knd
	pdflatex main
	bibtex main
	makeindex main
	pdflatex main
	pdflatex main
#	rm -f main.knd

pdf-py: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabfalse \isoctavefalse \ispythontrue" > main.knd
	cp main-pdf-py.knd main.knd
	cp main.tex main-py.tex
	pdflatex main-py
	bibtex main-py
	makeindex main-py
	pdflatex main-py
	pdflatex main-py
	rm -f main.knd

pdf-oct: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabfalse \isoctavetrue \ispythonfalse" > main.knd
	cp main-pdf-oct.knd main.knd
	cp main.tex main-oct.tex
	pdflatex main-oct
	bibtex main-oct
	makeindex main-oct
	pdflatex main-oct
	pdflatex main-oct
#	rm -f main.knd

########################################
# FORMATO LIVRO DVI
########################################

dvi: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabtrue \isoctavefalse \ispythonfalse" > main.knd
	cp main-pdf-sci.knd main.knd
	latex main
	bibtex main
	makeindex main
	latex main
	latex main
#	rm -f main.knd

dvi-py: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabfalse \isoctavefalse \ispythontrue" > main.knd
	cp main-pdf-py.knd main.knd
	cp main.tex main-py.tex
	latex main-py
	bibtex main-py
	makeindex main-py
	latex main-py
	latex main-py
#	rm -f main.knd

dvi-oct: main.tex
#	echo "\isbooktrue \isslidefalse \ishtmlfalse \isscilabfalse \isoctavetrue \ispythonfalse" > main.knd
	cp main-pdf-oct.knd main.knd
	cp main.tex main-oct.tex
	latex main-oct
	bibtex main-oct
	makeindex main-oct
	latex main-oct
	latex main-oct
#	rm -f main.knd


########################################
# FORMADO SLIDES PDF
########################################

slide: main.tex
#	echo "\isbookfalse \isslidetrue \ishtmlfalse \isscilabtrue \isoctavefalse \ispythonfalse" > main.knd
	cp main-slide-sci.knd main.knd
	cp main.tex slide.tex
	pdflatex slide
	bibtex slide
	makeindex slide
	pdflatex slide
	pdflatex slide
#	rm -f main.knd

slide-oct: main.tex
#	echo "\isbookfalse \isslidetrue \ishtmlfalse \isscilabfalse \isoctavetrue \ispythonfalse" > main.knd
	cp main-slide-oct.knd main.knd
	cp main.tex slide-oct.tex
	pdflatex slide-oct
	bibtex slide-oct
	makeindex slide-oct
	pdflatex slide-oct
	pdflatex slide-oct
#	rm -f main.knd

slide-py: main.tex
#	echo "\isbookfalse \isslidetrue \ishtmlfalse \isscilabfalse \isoctavefalse \ispythontrue" > main.knd
	cp main-slide-py.knd main.knd
	cp main.tex slide-py.tex
	pdflatex slide-py
	bibtex slide-py
	makeindex slide-py
	pdflatex slide-py
	pdflatex slide-py
#	rm -f main.knd


########################################
# FORMATO HTML
########################################

html: main-sci.html

html-oct: main-oct.html

html-py: main-py.html

main-sci.html: main.tex
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabtrue \isoctavefalse \ispythonfalse" > main.knd
	cp main-html-sci.knd main.knd
	mkdir -p ./html
	rm -f ./html/*
	latex main
	bibtex main
	latex main
	latex main
	mk4ht htlatex main "myconfig,3,notoc*" "" "-d./html/"
#	rm -f main.knd

main-oct.html: main.tex
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabfalse \isoctavetrue \ispythonfalse" > main.knd
	cp main-html-oct.knd main.knd
	mkdir -p ./html-oct
	rm -f ./html-oct/*
	latex main
	bibtex main
	latex main
	latex main
	mk4ht htlatex main "myconfig,3,notoc*" "" "-d./html-oct/"
#	rm -f main.knd

main-py.html: main.tex
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabfalse \isoctavefalse \ispythontrue" > main.knd
	cp main-html-py.knd main.knd
	mkdir -p ./html-py
	rm -f ./html-py/*
	latex main
	bibtex main
	latex main
	latex main
	mk4ht htlatex main "myconfig,3,notoc*" "" "-d./html-py/"
#	rm -f main.knd

########################################
# FORMATO EPUB
########################################

epub: main.tex
	mkdir -p ./.tmp1
	rm -rf ./.tmp1/*
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabtrue \isoctavefalse \ispythonfalse" > main.knd
	cp main-html-sci.knd main.knd
	latex main 
	bibtex main
	latex main
	latex main
	htlatex main "ebook_config,html,2,notoc*" "" "-d./.tmp1/"
	#rm -f main.knd


	ebook-convert ./.tmp1/main.html main.epub \
	      --authors="Todos os Colaboradores"\
              --cover=./rosto/cover-scilab-epub.png\
	      --comments="Para mais informações sobre este livro visite  http://www.ufrgs.br/numerico"

epub-oct: main.tex
	mkdir -p ./.tmp1
	rm -rf ./.tmp1/*
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabfalse \isoctavetrue \ispythonfalse" > main.knd
	cp main-html-oct.knd main.knd
	latex main 
	bibtex main
	latex main
	latex main
	htlatex main "ebook_config,html,2,notoc*" "" "-d./.tmp1/"
	#rm -f main.knd


	ebook-convert ./.tmp1/main.html main-oct.epub \
	      --authors="Todos os Colaboradores"\
	      --comments="Para mais informações sobre este livro visite  http://www.ufrgs.br/numerico"

epub-py: main.tex
	mkdir -p ./.tmp1
	rm -rf ./.tmp1/*
#	echo "\isbookfalse \isslidefalse \ishtmltrue \isscilabfalse \isoctavefalse \ispythontrue" > main.knd
	cp main-html-py.knd main.knd
	latex main 
	bibtex main
	latex main
	latex main
	htlatex main "ebook_config,html,2,notoc*" "" "-d./.tmp1/"
	#rm -f main.knd


	ebook-convert ./.tmp1/main.html main-py.epub \
	      --authors="Todos os Colaboradores"\
              --cover=./rosto/cover-python-epub.png\
	      --comments="Para mais informações sobre este livro visite  http://www.ufrgs.br/numerico"


########################################
# TODOS AS VERSÕES EM FORMATO PDF
########################################

all-pdf: main.tex
	make clean
	make pdf
	make clean
	make pdf-py
	make clean
	make pdf-oct

########################################
# TODOS AS VERSÕES EM FORMATO Slide
########################################

all-slide: main.tex
	make clean
	make slide
	make clean
	make slide-py
	make clean
	make slide-oct

########################################
# TODOS OS FORMATOS
########################################

all: main.tex
	make clean
	make pdf
	make clean
	make slide
	make clean
	make dvi
	make clean
	make html
	make clean
	make epub

all-oct: main.tex
	make clean
	make pdf-oct
	make clean
	make slide-oct
	make clean
	make dvi-oct
	make clean
	make html-oct
	make clean
	make epub-oct

all-py: main.tex
	make clean
	make pdf-py
	make clean
	make slide-py
	make clean
	make dvi-py
	make clean
	make html-py
	make clean
	make epub-py

.PHONY: clean

clean:
	rm -f *.aux *.log *.out *.toc *.bbl \
		*.idx *.ilg *.ind *.blg *.backup \
		*.4tc *.lg *.tmp *.xref *.png *.html \
		*.4ct *.css *.idv *.maf *.mtc *.mtc0 \
		*.xml
	rm -f ${CAP1}/*.aux ${CAP1}/*.log ${CAP1}/*.backup
	rm -f ${CAP2}/*.aux ${CAP2}/*.log ${CAP2}/*.backup
	rm -f ${CAP3}/*.aux ${CAP3}/*.log ${CAP3}/*.backup
	rm -f ${CAP4}/*.aux ${CAP4}/*.log ${CAP4}/*.backup
	rm -f ${CAP5}/*.aux ${CAP5}/*.log ${CAP5}/*.backup
	rm -f ${CAP6}/*.aux ${CAP6}/*.log ${CAP6}/*.backup
	rm -f ${CAP7}/*.aux ${CAP7}/*.log ${CAP7}/*.backup
	rm -f ${CAP8}/*.aux ${CAP8}/*.log ${CAP8}/*.backup
	rm -f ${CAP9}/*.aux ${CAP9}/*.log ${CAP9}/*.backup
	rm -f ${CAP10}/*.aux ${CAP10}/*.log ${CAP10}/*.backup
	rm -f ${CAP11}/*.aux ${CAP11}/*.log ${CAP11}/*.backup
	rm -f ${CAP12}/*.aux ${CAP12}/*.log ${CAP12}/*.backup
	rm -f ${CAP13}/*.aux ${CAP13}/*.log ${CAP13}/*.backup
	rm -f ${CAP14}/*.aux ${CAP14}/*.log ${CAP14}/*.backup
	rm -f ${CAP15}/*.aux ${CAP15}/*.log ${CAP15}/*.backup
