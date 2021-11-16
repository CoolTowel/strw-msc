% % written by Maojin Lang
% % Modified from template LION-msc (https://www.ctan.org/pkg/lion-msc)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strw-msc}[2021/10/30]

\DeclareOption{openleft}{\OptionNotUsed}
            
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions*\relax
\LoadClass[a4paper,
           twoside,
           12pt,
           bibliography=totoc
           ]{scrbook}

% % basic settings

\RequirePackage[english]{babel}

% binding setting
\RequirePackage[
			  %  bindingoffset=6mm
			   ]{geometry}

% == start : define several variables to be placed on the titlepage.
\gdef\@abstracttext{\color{red}Please use $\backslash$\texttt{abstracttext\{\ldots\}} to define an abstract in the document preamble. \color{black}\lipsum[1]}
\gdef\@studentid{\color{red}use $\backslash$\texttt{studentid\{\ldots\}} to define}
\gdef\@supervisor{\color{red}use $\backslash$\texttt{supervisor\{\ldots\}} to define}
\gdef\@corrector{\color{red}use $\backslash$\texttt{corrector\{\ldots\}} to define}
\gdef\@affiliation{\color{black}Leiden Observatory, Leiden University}
\gdef\@address{\color{black}P.O. Box 9513, NL-2300 RA Leiden, The Netherlands}
\gdef\@degree{\color{black}Master of Science}
\gdef\@major{\color{black}Astronomy}

\def\abstracttext#1{\gdef\@abstracttext{#1}}
\def\studentid#1{\gdef\@studentid{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\corrector#1{\gdef\@corrector{#1}}
\gdef\affiliation#1{\gdef\@affiliation{#1}}
\gdef\address#1{\gdef\@address{#1}}
\gdef\degree#1{\gdef\@degree{#1}}
\gdef\major#1{\gdef\@major{#1}}

% Math env.
\RequirePackage{amsmath}

% unicode-math
\RequirePackage[mathrm=sym,
		    mathup=sym,
		    mathit=sym,
		    mathsf=sym,
		    mathbf=sym,
		    mathtt=sym]{unicode-math}

% font: use utopia
\RequirePackage{fourier-otf}

% % layout settings

% Modify the header
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}
\rohead{\leftmark}

% make Page left intentionally blank. page automatically
\newcommand*{\blankpage}{%
  \par\vspace*{\fill}%
  {\centering Page left intentionally blank.\par}
  \vspace{\fill}%
}

\DeclareNewLayer[ % require scrlayer package
    foreground,
    textarea,
    contents=\blankpage
  ]{blankpage.fg}
\DeclarePageStyleByLayers{blank}{blankpage.fg}
\KOMAoptions{cleardoublepage=blank} % make the \blankpage as the default blank page style

% Colored text
\RequirePackage{xcolor}
\definecolor{linkblue}{RGB}{0,100,200}
\definecolor{linkred}{RGB}{220,20,30}

% reference
\RequirePackage[sort&compress]{natbib}

% hyperlinks
\RequirePackage[hidelinks]{hyperref}

\DeclareOption{colourful}{
\hypersetup{
            colorlinks = true,
            linkcolor = linkred,
            urlcolor  = linkblue,
            citecolor = linkblue,
            anchorcolor = linkblue}
            }

\ProcessOptions\relax

% insertion of graphics
\RequirePackage{graphicx}

% For standard formatting of dates I use the datetime package
\RequirePackage[us]{datetime}

% Support of SI-unit
\RequirePackage{siunitx}

% Journal abbr.
\input{reference_setting/journal_abbr}

% Produce dummy text to be used in example.
\RequirePackage{lipsum}

