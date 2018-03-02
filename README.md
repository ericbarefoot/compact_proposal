# Compact Proposal

A LaTeX class for producing compact and nicely formatted grant proposal documents.

This is a LaTeX class to make a compact proposal document. It provides easy switches for common formatting needs, including margins, headers, figures, and page numbering. It also allows for compiling draft and submission versions. Note you should compile this document twice in `draft` mode if you want margin notes to work right.

##  Usage

Call this document class with `\documentclass{compact_proposal}`. It takes the following options (currently):
* `draft` - which builds the document with double spacing, an extra margin for notes, and allows three kinds of notes.
* `nonotes` which disables notes, but preserves spacing and geometry choices.
* `final` which single spaces, collapses lists, and makes standard 1 inch margins. 

Allowed notes in `draft` mode are:
* `\cnote{}` which inputs a grey highlighted text reading 'citation needed:yourtexthere'
* `\pnote{}` which inputs a yellow highlighted text with a note for yourself in it.
* `\mnote{}{}` which highlights text in the first braces grey, then puts in a margin note that contains text in the second braces, and connects the two with a grey line. 

## Setting up with symbolic links

This class, or really any github-based class, can be called by a symbolic link in your `tex`-tree. This has the benefit of allowing changes from the repository during development to be pulled directly down to the repository, and your use of the class, wherever on your system, will automatically call this version of the class file. This allows you to keep only one version of the file, and not be forced to place it in every folder you want to use the class with.

A proper symbolic link resides in your `tex`-tree and points to the github repository. One example, with pseudocode is below. 

For a linux user with the default location of the `texlive` install, the following yields a proper symbolic link:

    sudo mkdir <local_path_to_textree>/tex/latex/compact_proposal
    sudo ln -s <local_path_above_this_repo>/compact_proposal/compact_proposal/compact_proposal.cls <local_path_to_textree>/tex/latex/compact_proposal/compact_proposal.cls

Note that the `tex`-tree is everything below `/usr/share/texlive/texmf-dist/`.

After the above command, a call to hash the `tex`-tree is necessary.

    sudo texhash