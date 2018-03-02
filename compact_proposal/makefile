all: test_proposal_final.pdf test_proposal_draft.pdf open

.PHONY = all open

test_proposal_draft.pdf: test_proposal_draft.tex compactproposal.cls
	pdflatex	test_proposal_draft.tex
	pdflatex	test_proposal_draft.tex
	open	test_proposal_draft.pdf	
	
test_proposal_final.pdf: test_proposal_final.tex compactproposal.cls
	pdflatex	test_proposal_final.tex
	pdflatex	test_proposal_final.tex
	open	test_proposal_final.pdf	
	
open: 
	open	test_proposal_draft.pdf
	open	test_proposal_final.pdf
	