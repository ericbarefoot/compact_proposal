# Compact Proposal

A LaTeX class for producing compact and nicely formatted grant proposal documents.

This is a LaTeX class to make a compact proposal document. It provides easy switches for common formatting needs, including margins, headers, figures, and page numbering. It also allows for compiling draft and submission versions. Note you should compile this document twice in `draft` mode if you want margin notes to work right.

##  Usage

Call this document class with `\documentclass{compactproposal}`. It takes the following options (currently):
* `draft` - which builds the document with double spacing, an extra margin for notes, and allows three kinds of notes.
* `nonotes` which disables notes, but preserves spacing and geometry choices.
* `final` which single spaces, collapses lists, and makes standard 1 inch margins. 

Allowed notes in `draft` mode are:
* `\cnote{}` which inputs a grey highlighted text reading 'citation needed:yourtexthere'
* `\pnote{}` which inputs a yellow highlighted text with a note for yourself in it.
* `\mnote{}{}` which highlights text in the first braces grey, then puts in a margin note that contains text in the second braces, and connects the two with a grey line. 
