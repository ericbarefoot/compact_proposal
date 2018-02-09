testproposal.pdf: testproposal.tex compactproposal.cls
	pdflatex	testproposal.tex
	pdflatex	testproposal.tex
	open	testproposal.pdf	
	
open: 
	open	testproposal.pdf