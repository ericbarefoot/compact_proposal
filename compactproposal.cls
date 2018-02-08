%% Identification %%
%% section provides name of class, release date and TeX format.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{compactproposal}[2018/02/08 Compact Proposal LaTeX class]

%% Preliminary declarations
%% 
\LoadClass[12pt,letterpaper,twocolumn]{article}
\RequirePackage{xcolor}
\definecolor{redcol}{HTML}{882B21}
\newcommand{\headlinecolor}{\normalcolor}

%% Options
%%

\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{redcol}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% More declarations 
%% 

\renewcommand{\maketitle}{%
	\twocolumn[%
		\fontsize{50}{60}\fontfamily{phv}\fontseries{b}%
		\fontshape{sl}\selectfont\headlinecolor
		\@title
		\medskip
		]%
}

\renewcommand{\section}{%
	\@startsection
	{section}{1}{\z@}{-1.5ex plus -1ex minus -.2ex}%
	{1ex plus .2ex}{\bf\headlinecolor\centering}%
}

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0}

%	\newenvironment{\section}{%
%	  \@startsection
%	  \setlength\topsep{0pt}
%	  \setlength\parskip{0pt}
%	  \begin{center}
%	}{%
%	  \end{center}
%	}

