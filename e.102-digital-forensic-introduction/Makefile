all: course_1 qcourse_1 course_2 qcourse_2 course_3 qcourse_3
course_1: course_1.md 
	@echo "Compiling course_1 presentation"
	pandoc --slide-level 2 -H LaTeX_additional_preamble.tex -t beamer course_1.md -V theme:Torino -o course_1.pdf

qcourse_1: course_1.md
	@echo "Compiling course_1 html file"
	quarto render course_1.md --to html

course_2: course_2.md 
	@echo "Compiling course_2 presentation"
	pandoc --slide-level 2 -H LaTeX_additional_preamble.tex -t beamer course_2.md -V theme:Torino -o course_2.pdf

qcourse_2: course_2.md
	@echo "Compiling course_2 html file"
	quarto render course_2.md --to html

course_3: course_3.md 
	@echo "Compiling course_3 presentation"
	pandoc --slide-level 2 -H LaTeX_additional_preamble.tex -t beamer course_3.md -V theme:Torino -o course_3.pdf

qcourse_3: course_3.md
	@echo "Compiling course_3 html file"
	quarto render course_3.md --to html

clean:
	@echo "Cleaning up..."
	rm course_1.pdf
	rm course_2.pdf
	rm course_3.pdf
	rm -r .quarto course_1_files course_2_files course_3_files services_files ood_files
