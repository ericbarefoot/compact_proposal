%%	LaTeX Class for making pretty compact proposal documents for NSF etc.
%%	Eric Barefoot
%%	Feb 2018


%% Identification %%
%% section provides name of class, release date and TeX format.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{compactproposal}[2018/02/08 Compact Proposal LaTeX class]

%% Preliminary declarations
%% 

\LoadClass[12pt]{article}
\RequirePackage{geometry}
\RequirePackage{floatflt}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{soul}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{wrapfig}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[font = footnotesize]{caption}
\RequirePackage[textsize=footnotesize, linecolor=gray, bordercolor=white, backgroundcolor=white]{todonotes}
\RequirePackage{enumitem}

\renewcommand{\labelitemi}{$\star$}

\newtoggle{draft}
\newtoggle{nonotes}

%% Options
%%

\DeclareOption{draft}{\toggletrue{draft}}
\DeclareOption{final}{\togglefalse{draft}}
\DeclareOption{nonotes}{\toggletrue{nonotes}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% More declarations 
%% 

%\newcommand{\mnote}[2]{\sethlcolor{lgrey} \hl{#1} \todo{#2}}


\definecolor{lgrey}{gray}{0.75}

\iftoggle{draft}{%
	\doublespacing
	\newcommand{\cnote}[2][citation needed]{\sethlcolor{lgrey} \hl{[#1:#2]}}
	\newcommand{\pnote}[1]{\sethlcolor{GreenYellow} \textcolor{black}{\hl{[#1]}}}
	\newcommand{\mnote}[2]{\sethlcolor{lgrey} \hl{#1} \todo{#2}}
	\geometry{%
		left = 1in,%
		right = 2.5in,%
		top = 1in,%
		bottom = 1in,%
		papersize = {10in, 11in},%
		marginparwidth = 2in%
	}
}{%
	\newcommand{\cnote}[2][citation needed]{\sethlcolor{lgrey} \hl{[#1:#2]}}
	\newcommand{\pnote}[1]{\sethlcolor{GreenYellow} \textcolor{black}{\hl{[#1]}}}
	\newcommand{\mnote}[2]{#1}
	\geometry{letterpaper, margin=1in}	
}

\iftoggle{nonotes}{%
	\renewcommand{\cnote}[2]{}{}
	\renewcommand{\pnote}[1]{}
}{%
}


\renewcommand{\maketitle}{%
	{%
		\centering\large\fontseries{b}\selectfont%
		\@title \\%
		\rule[1ex]{\textwidth}{0.5pt}%
%			\ifboolexpr{ test {\ifdefempty{\author}} and test {\ifdefempty{\date}} } {
%				\rule[1ex]{\textwidth}{0.5pt}%
%			}{
%				\normalsize\fontseries{m}\selectfont\@author{} --- \@date{} \\%
%				\rule[1ex]{\textwidth}{0.5pt}%
%			}
%		\vspace{-1\baselineskip}
	}
}

\renewcommand{\section}{%
	\@startsection
	{section}{1}{\z@}{0\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\selectfont\centering}%
}

\newenvironment{tightitemize}{%
	\begin{itemize}[noitemsep,nolistsep]
}{%
	\end{itemize}
}

\setcounter{secnumdepth}{0}


