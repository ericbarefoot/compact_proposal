%%	LaTeX Class for making pretty compact proposal documents for NSF etc.
%%	Eric Barefoot
%%	Feb 2018

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	TODO
%	customize subsection headings - but what should they look like?
%	add margin and font size functionality
%	add font selection functionality
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Identification %%
%% section provides name of class, release date and TeX format.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{compactproposal}[2018/02/08 Compact Proposal LaTeX class]

%% Preliminary declarations
%% 

\LoadClass[12pt]{article}
\RequirePackage{geometry}	%	for margins etc
\RequirePackage{floatflt}	%	for wrapping figures
\RequirePackage{etoolbox}	%	for if-then statements
\RequirePackage{setspace}	%	easy doublespacing
\RequirePackage{soul}		%	for colors and highlighting
\RequirePackage[dvipsnames]{xcolor}	%	for colors
\RequirePackage{graphicx}	%	for figure inclusion
\RequirePackage{float}		% 	for normal floating
\RequirePackage[font = footnotesize]{caption}	%	for captions
\RequirePackage[textsize=footnotesize, linecolor=gray, bordercolor=white, backgroundcolor=white]{todonotes}	%	allows formatting for margin notes
\RequirePackage{enumitem}	%	allows for customizing lists for compactness
\RequirePackage{lineno}

\newtoggle{draft}
\newtoggle{nonotes}

%% Options
%%

%	\DeclareOption{margin}{\toggletrue{draft}}	% need to use a keval package to enable the ability to set the margin size.

%	set toggles for different options which put the document in draft mode (double spaced with extra space.) 
%	and allows or disallows notes. Also allows for standard options from article.

\DeclareOption{draft}{\toggletrue{draft}}						%	allows draft mode
\DeclareOption{final}{\togglefalse{draft}\toggletrue{nonotes}}	%	allows a final submission mode
\DeclareOption{nonotes}{\toggletrue{nonotes}}					%	allow removal of notes
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}	%	inherit article class options
\ProcessOptions\relax

%% More declarations 
%% 

\setcounter{secnumdepth}{0}			%	prevents automatic numbering for sections
\renewcommand{\labelitemi}{$\star$}	%	sets a new list delimiter - a star
\definecolor{lgrey}{gray}{0.75}		%	make a light grey color for mnotes

\iftoggle{draft}{%
	\doublespacing	% make double spaced.
	\newcommand{\cnote}[2][citation needed]{\sethlcolor{lgrey} \hl{[#1:#2]}}		% make note for needed citations. 
	\newcommand{\pnote}[1]{\sethlcolor{GreenYellow} \textcolor{black}{\hl{[#1]}}}	% make note for personal notes.
	\newcommand{\mnote}[2]{\sethlcolor{lgrey} \hl{#1} \todo{#2}}					% make note for margin discussion.
%		make a custom page size that allows an extra area for margins.
	\geometry{%
		left = 1in,%
		right = 2.5in,%
		top = 1in,%
		bottom = 1in,%
		papersize = {10in, 11in},%
		marginparwidth = 2in
	}
	\linenumbers
}{%
%		sets the paper size and standard 1 inch margins. need to add functionality eventually to be able to set margins
%		and paper size and text size.
	\geometry{letterpaper, margin=1in}	
	\newcommand{\cnote}[1]{}
	\newcommand{\pnote}[1]{}
	\newcommand{\mnote}[1]{}
}

%	allows an option to disable notes entirely, but preserve draft mode
\iftoggle{nonotes}{%
	\renewcommand{\cnote}[1]{}
	\renewcommand{\pnote}[1]{}
	\renewcommand{\mnote}[1]{}
}{%
}

% 	customize title to be lower profile and centered at the top.
\renewcommand{\maketitle}{%
	{%
		\centering\fontseries{b}\selectfont%
		\@title \\%
		\rule[1ex]{\textwidth}{0.5pt}%
%	This is to try to change the behavior to allow author and date to appear or disappear.
%			\ifboolexpr{ test {\ifdefempty{\author}} and test {\ifdefempty{\date}} } {
%				\rule[1ex]{\textwidth}{0.5pt}%
%			}{
%				\normalsize\fontseries{m}\selectfont\@author{} --- \@date{} \\%
%				\rule[1ex]{\textwidth}{0.5pt}%
%			}
	}
}

% 	customize section header to be lower profile and centered at the top.
\renewcommand{\section}{%
	\@startsection
	{section}{1}{\z@}{0.5\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\selectfont\centering}%
}

\renewcommand{\subsection}{%
	\@startsection
	{subsection}{1}{\z@}{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\fontshape{it}\selectfont\raggedright}%
}

% 	customize itemize to be lower profile.
\newenvironment{tightitemize}{%
	\begin{itemize}[noitemsep,nolistsep]
}{%
	\end{itemize}
}

\newenvironment{tightenum}{%
	\begin{enumerate}[noitemsep,nolistsep]
}{%
	\end{enumerate}
}

\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}