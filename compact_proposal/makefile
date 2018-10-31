all: test_proposal_final.pdf test_proposal_draft.pdf test_proposal_draft_nonotes.pdf

clean:
	rm -rf *.aux *.log

.PHONY = all open

test_proposal_draft.pdf: test_proposal_draft.tex compact_proposal.cls
	pdflatex	test_proposal_draft.tex
	pdflatex	test_proposal_draft.tex
	make clean
	# open	test_proposal_draft.pdf

test_proposal_draft_nonotes.pdf: test_proposal_draft_nonotes.tex compact_proposal.cls
	pdflatex	test_proposal_draft_nonotes.tex
	pdflatex	test_proposal_draft_nonotes.tex
	make clean

test_proposal_final.pdf: test_proposal_final.tex compact_proposal.cls
	pdflatex	test_proposal_final.tex
	pdflatex	test_proposal_final.tex
	make clean
	# open	test_proposal_final.pdf

# is there a way to open PDF files in an OS-agnostic way??
# open_both:
# 	open	test_proposal_draft.pdf
# 	open	test_proposal_final.pdf
