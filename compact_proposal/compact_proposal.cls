%%	LaTeX Class for making pretty compact proposal documents for NSF etc.
%%	Eric Barefoot
%%	Feb 2018

%% Identification %%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{compact_proposal}[2018/02/08 Compact Proposal LaTeX class]

%% Preliminary declarations

\LoadClass{article}
\RequirePackage{geometry}	%	for margins etc
% \RequirePackage{floatflt}	%	for wrapping figures
\RequirePackage{etoolbox}	%	for if-then statements
	\tracingpatches 		% turn on for debugging patches
\RequirePackage{xparse}
\RequirePackage{setspace}	%	easy doublespacing
\RequirePackage{soul}		%	for colors and highlighting
\RequirePackage[dvipsnames]{xcolor}	%	for colors
\RequirePackage{graphicx}	%	for figure inclusion
\RequirePackage{float}		% 	for normal floating
\RequirePackage[font = footnotesize]{caption}	%	for captions
\RequirePackage[textsize = footnotesize,
				linecolor = gray,
				bordercolor = white,
				backgroundcolor = white]{todonotes}	%	allows formatting for margin notes
\RequirePackage{enumitem}	%	allows for customizing lists for compactness
\RequirePackage{kvoptions}
	\SetupKeyvalOptions{%
		family=cp,
		prefix=cp@,
		}
\RequirePackage{lineno}

\newtoggle{@draft}
\newtoggle{@nonotes}

%% Declare the options

% \DeclareOption{margin}{\toggletrue{draft}}	% need to use a keval package to enable the ability to set the margin size.
\DeclareVoidOption{draft}{\toggletrue{@draft}}              % allows draft mode
\DeclareVoidOption{final}{\togglefalse{@draft}}             % allows a final submission mode
\DeclareVoidOption{nonotes}{\toggletrue{@nonotes}}		    % allow removal of notes
\DeclareStringOption[$\star$]{labelitemi}[$\star$]			% allow the enum label specification
\DeclareStringOption{fontspec}								% allow font specification
\DeclareDefaultOption*{\PassOptionsToClass{\CurrentOption}{article}}	%	inherit article class options
\ProcessKeyvalOptions*

%% Define Parameters

\setcounter{secnumdepth}{0}			%	prevents automatic numbering for sections
\definecolor{lgrey}{gray}{0.85}		%	make a light grey color for mnotes
\definecolor{cblue}{RGB}{152,203,244}		%	make a light grey color for mnotes
\definecolor{pyell}{RGB}{255,255,102}		%	make a light grey color for mnotes

%% Define note functions

% \newcommand*{\myparenthetical}[1]{%
%   \ifhmode
%     \unskip
%     \space
%   \fi
%   [#1]%
%   \@ifnextchar{.}{}{%
%   \@ifnextchar{,}{}{%
%   \@ifnextchar{;}{}{%
%   \@ifnextchar{!}{}{%
%   \@ifnextchar{?}{}{%
%   \@ifnextchar{)}{}{%
%   \@ifnextchar\par{}{%
%     \space
%     \ignorespaces
%   }}}}}}}%
% }

% make note for margin discussion.
\NewDocumentCommand{\mnote}{o m}{%
    \nottoggle{@nonotes}{%
    % if not nonotes:
        \iftoggle{@draft}{%
        % if draft:
            \IfValueTF{#1}%
            {% if optional given:
							\ifhmode
								\unskip
								\space
							\fi
						  \sethlcolor{lgrey}%
              \hl{#1}%
              {\setstretch{1}\todo{#2}}%
						  \@ifnextchar{.}{}{%
						  \@ifnextchar{,}{}{%
						  \@ifnextchar{;}{}{%
						  \@ifnextchar{!}{}{%
						  \@ifnextchar{?}{}{%
						  \@ifnextchar{)}{}{%
						  \@ifnextchar\par{}{%
						    \space
						    \ignorespaces
						  }}}}}}}%
            }%
            {% else:
							\ifhmode
								\unskip
								\space
							\fi
							{\setstretch{1}\todo{#2}}%
							\ignorespaces
						}%
        }{%
        % if not draft:
            \IfValueTF{#1}%
            {% if optional given:
							\ifhmode
								\unskip
								\space
							\fi
							#1%
							\@ifnextchar{.}{}{%
						  \@ifnextchar{,}{}{%
						  \@ifnextchar{;}{}{%
						  \@ifnextchar{!}{}{%
						  \@ifnextchar{?}{}{%
						  \@ifnextchar{)}{}{%
						  \@ifnextchar\par{}{%
						    \space
						    \ignorespaces
						  }}}}}}}%
            }%
            {% else:
						% print nothing
							\ifhmode
								\unskip
							\fi
							\@ifnextchar{.}{}{%
							\@ifnextchar{,}{}{%
							\@ifnextchar{;}{}{%
							\@ifnextchar{!}{}{%
							\@ifnextchar{?}{}{%
							\@ifnextchar{)}{}{%
							\@ifnextchar\par{}{%
								\space
								\ignorespaces
							}}}}}}}%
            }%
        }%
    }{%
    % if nonotes:
        \IfValueTF{#1}%
            {% if optional given:
							\ifhmode
								\unskip
								\space
							\fi
							#1%
							\@ifnextchar{.}{}{%
							\@ifnextchar{,}{}{%
							\@ifnextchar{;}{}{%
							\@ifnextchar{!}{}{%
							\@ifnextchar{?}{}{%
							\@ifnextchar{)}{}{%
							\@ifnextchar\par{}{%
								\space
								\ignorespaces
							}}}}}}}%
						}%
            {% else:
						% print nothing
						\ifhmode
							\unskip
						\fi
						\@ifnextchar{.}{}{%
						\@ifnextchar{,}{}{%
						\@ifnextchar{;}{}{%
						\@ifnextchar{!}{}{%
						\@ifnextchar{?}{}{%
						\@ifnextchar{)}{}{%
						\@ifnextchar\par{}{%
							\space
							\ignorespaces
						}}}}}}}%
          }%
    }%
}%

% make note for citations
\NewDocumentCommand{\cnote}{O{citation needed}}{%
	\nottoggle{@nonotes}{%
    % if not nonotes:
        \iftoggle{@draft}{%
        % if draft:
					\ifhmode
						\unskip
						\space
					\fi
					\sethlcolor{cblue}%
          \hl{#1}%
					\@ifnextchar{.}{}{%
					\@ifnextchar{,}{}{%
					\@ifnextchar{;}{}{%
					\@ifnextchar{!}{}{%
					\@ifnextchar{?}{}{%
					\@ifnextchar{)}{}{%
					\@ifnextchar\par{}{%
						\space
						\ignorespaces
					}}}}}}}%
        }{%
        % if not draft:
            % print nothing
						\ifhmode
							\unskip
						\fi
						\@ifnextchar{.}{}{%
						\@ifnextchar{,}{}{%
						\@ifnextchar{;}{}{%
						\@ifnextchar{!}{}{%
						\@ifnextchar{?}{}{%
						\@ifnextchar{)}{}{%
						\@ifnextchar\par{}{%
							\space
							\ignorespaces
						}}}}}}}%
        }%
    }{%
    % if nonotes:
        % print nothing
				\ifhmode
					\unskip
				\fi
				\@ifnextchar{.}{}{%
				\@ifnextchar{,}{}{%
				\@ifnextchar{;}{}{%
				\@ifnextchar{!}{}{%
				\@ifnextchar{?}{}{%
				\@ifnextchar{)}{}{%
				\@ifnextchar\par{}{%
					\space
					\ignorespaces
				}}}}}}}%
    }%
}

% make note for personal inline notes to self
\NewDocumentCommand{\pnote}{o}{%
	\nottoggle{@nonotes}{%
    % if not nonotes:
        \iftoggle{@draft}{%
        % if draft:
        	\IfNoValueTF{#1}%
        	% if no value given:
        	{% print nothing
						\ifhmode
							\unskip
						\fi
						\@ifnextchar{.}{}{%
						\@ifnextchar{,}{}{%
						\@ifnextchar{;}{}{%
						\@ifnextchar{!}{}{%
						\@ifnextchar{?}{}{%
						\@ifnextchar{)}{}{%
						\@ifnextchar\par{}{%
							\space
							\ignorespaces
						}}}}}}}%
					}{%
        	% else print given
						\ifhmode
							\unskip
							\space
						\fi
            \sethlcolor{pyell}%
            \hl{[#1]}%
						\@ifnextchar{.}{}{%
						\@ifnextchar{,}{}{%
						\@ifnextchar{;}{}{%
						\@ifnextchar{!}{}{%
						\@ifnextchar{?}{}{%
						\@ifnextchar{)}{}{%
						\@ifnextchar\par{}{%
							\space
							\ignorespaces
						}}}}}}}%
					}%
        }{%
        % if not draft:
            % print nothing
						\ifhmode
							\unskip
						\fi
						\@ifnextchar{.}{}{%
						\@ifnextchar{,}{}{%
						\@ifnextchar{;}{}{%
						\@ifnextchar{!}{}{%
						\@ifnextchar{?}{}{%
						\@ifnextchar{)}{}{%
						\@ifnextchar\par{}{%
							\space
							\ignorespaces
						}}}}}}}%
        }%
    }{%
    % if nonotes:
        % print nothing
				\ifhmode
					\unskip
				\fi
				\@ifnextchar{.}{}{%
				\@ifnextchar{,}{}{%
				\@ifnextchar{;}{}{%
				\@ifnextchar{!}{}{%
				\@ifnextchar{?}{}{%
				\@ifnextchar{)}{}{%
				\@ifnextchar\par{}{%
					\space
					\ignorespaces
				}}}}}}}%
    }%
}


%% Apply the options

\renewcommand{\labelitemi}{\cp@labelitemi}	%	sets a new list delimiter - a star

\iftoggle{@draft}{%
	\doublespacing	% make double spaced.
%	make a custom page size that allows an extra area for margins.
	\geometry{%
		left = 0.75in,%
		right = 2in,%
		top = 1in,%
		bottom = 1in,%
		marginparwidth = 1.5in
	}%
%	add line numbers in draft mode
	\linenumbers
}{%
%	sets the paper size and standard 1 inch margins. need to add functionality eventually to be able to set margins
%	and paper size and text size.
	\geometry{letterpaper, margin=1in, textwidth=6.5in}
}

%	allows an option to disable notes entirely, but preserve draft mode
\iftoggle{@nonotes}{%
	}{%
}

% font handlers
\ifdefstring{\cp@fontspec}{times}{%
    \RequirePackage{times}
}{}

%% Customize title and evironments/section heads, mostly to be lower profile.

%% @author and @date need to be empty, so this empties both values, stores them
% % as @emptyauthor and @emptydate and then uses for comparison with what get's called in document.

\global\let\@author\@empty  % TeX has already filled @date by now, so empty it
\let\@emptyauthor\@author % store the values before TeX processing

\global\let\@date\@empty  % TeX has already filled @date by now, so empty it
\let\@emptydate\@date	  % now fill with @date to make @emptydate

\renewcommand{\@maketitle}{%
	\newpage%
	% \begingroup
	\begin{center}%
		\let \footnote \thanks%
		{\fontseries{b}\selectfont \@title}% print the title
		\ifdefequal{\@author}{\@emptyauthor}% if author is *not* given in doc
			{}% print nothing
			{\vskip 0.3ex% big skip = 0.3
			 \begin{tabular}[t]{c}%
				 \@author%
			 \end{tabular}%
			}%
		\ifdefequal{\@date}{\@emptydate}% if date is *not* given in doc
			{}%
			{\ifdefequal{\@author}{\@emptyauthor}% check if author was given (determine spacing)
				{\vskip 0.3ex% big skip = 0.3
				 \@date}%
				{\vskip 0.1ex% small skip = 0.1
				 \@date}%
			}%
	\end{center}%
	\vspace{\dimexpr-2.5\parsep-2.5\parskip\relax}%
	\rule[1ex]{\textwidth}{0.5pt}%
}

\renewcommand{\section}{%
	\@startsection
	{section}{0}{\z@}{0.5\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\selectfont\centering}%
}

\renewcommand{\subsection}{%
	\@startsection
	{subsection}{0}{\z@}{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\fontshape{it}\selectfont\raggedright}%
}

\renewcommand{\subsubsection}{%
	\@startsection
	{subsubsection}{0}{\z@}{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\fontseries{b}\fontshape{it}\selectfont\raggedright}%
}

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
