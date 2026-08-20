%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DEE@ISEP class for MEEC dissertations
% original file adapted and further developed by Vitor M. R. Cunha
% v2.0, Jul 2026
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% original file:
% Masters/Doctoral Thesis 
% Class File
% Version 1.6 (27/8/17)
%
% This class was downloaded from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@latextemplates.com)
% Johannes Böttcher
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need
% to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of
% the file and add comments to make your changes more visible.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{DEEclass}
\newcommand{\DEEtemplateversion}{2.0}
\newcommand{\DEEtemplatereleasedate}{2026-07-30}
\ProvidesClass{\classname}[2026/07/30 v2.0 DEE@ISEP MEEC Class]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}

\newbool{nolistspace}
\booltrue{nolistspace}	%keeps tables single spaced
\newbool{listtoc}
\booltrue{listtoc}		%add lists to the toc
\newbool{headsepline}
\booltrue{headsepline}	%add header underline
\newbool{portuguese}	%to set the babel language 
\newbool{finalversion}	%to set doc version 
\newbool{MEECAS}		%to set the DEE course for front pages
\newbool{MEECSA}
\newbool{MEECPI}
\newbool{MEECTE}
\newbool{fixedsubmissiondate}
\boolfalse{fixedsubmissiondate}
\newbool{appendicesused}
\boolfalse{appendicesused}
\newbool{AIdeclarationprinted}
\boolfalse{AIdeclarationprinted}

\DeclareOption{portuguese}{\booltrue{portuguese}}
\DeclareOption{finalversion}{\booltrue{finalversion}}
\DeclareOption{MEECAS}{\booltrue{MEECAS}}
\DeclareOption{MEECSA}{\booltrue{MEECSA}}
\DeclareOption{MEECPI}{\booltrue{MEECPI}}
\DeclareOption{MEECTE}{\booltrue{MEECTE}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{\baseclass}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{40pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Huge\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}

\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter{
				\vspace*{100pt}
				\chapterprefixfont \@chapapp\space \thechapter
				\par\nobreak
				\chapterinbetweenskip } 			
		\else {
				\chapterprefixfont \@chapapp\space \thechapter
				\par\nobreak
				\chapterinbetweenskip  	}		
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
		\if@mainmatter{		
			\vspace*{40pt}}		
		\fi
	}
	\thispagestyle{\chapter@p@gestyle}
}

\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}

% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{listtoc}{	% With the liststotoc option the lists are added to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
 				
\RequirePackage[utf8]{inputenc} 	% Required for inputting international characters
\RequirePackage[T1]{fontenc} 		% Output font encoding for international characters
\RequirePackage{lmodern} 			% THE font

\ifbool{portuguese}{% Required for automatically changing names of document elements to languages besides english
  \RequirePackage[portuguese]{babel}
	}{
  \RequirePackage[english]{babel}
}

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{longtable} % Required for tables that span multiple pages 

\RequirePackage{xcolor} % Required for specifying custom colours
\definecolor{lightgray}{rgb}{.9,.9,.9}

\RequirePackage{graphicx} % Required to include images

\graphicspath{{figures/}{front/}} 	% Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules

\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=centerlast,font=small,margin=50pt}

%\RequirePackage[autostyle=true]{csquotes} 	% For language-dependent quotes
\RequirePackage[style=english]{csquotes}

\RequirePackage[style=numeric,backend=biber,backref=true,maxbibnames=99,sorting=none]{biblatex} % citation style = numeric, order of citation
%\RequirePackage[style=authoryear-comp,backend=biber,backref=true,maxbibnames=99]{biblatex} % authoryear-comp citation style (authoryear citations, ordered alphabetically)
%\setlength{\bibitemsep}{0.4\baselineskip} % references entries vertical gap

\RequirePackage[hidelinks]{hyperref}		%To pro­duce hy­per­text links in the doc­u­ment
\hypersetup{hidelinks,
bookmarksopen=true,
bookmarksopenlevel=0,
breaklinks=true,
}
\PassOptionsToPackage{hyphens}{url}\usepackage{hyperref} % To break long urls

\RequirePackage{calc}			% to perform arithmetic on the arguments of the LATEX commands

\RequirePackage{listings} % Required for code listings
\lstset{ %
 %language=C,                        % choose the language of the code
 basicstyle=\footnotesize\ttfamily,
 keywordstyle=\bfseries,
 numbers=left,                      % where to put the line-numbers   
 numberstyle=\tiny\color{gray},		% the size of the fonts that are used for the line-numbers
 stepnumber=1,                      % the step between two line-numbers. If it's 1 each line will be numbered
 numbersep=8pt,                     % how far the line-numbers are from the code
 xleftmargin=2em,					% keep line numbers inside the margins		
 frame=tb,							% frame: top and bottom lines
 framexleftmargin=1.5em,			% frame: adjusts left margin because the xleftmargin numbers setting
 float=!htb,						% if float defined, let Latex manage it
 aboveskip=8mm,
 belowskip=4mm,
 backgroundcolor=\color{white},
 commentstyle=\color{darkgray},    	% comment style
 %keywordstyle=\color{blue},       	% keyword style
 showspaces=false,                  % show spaces adding particular underscores
 showstringspaces=false,            % underline spaces within strings
 showtabs=false,                    % show tabs within strings adding particular underscores
 tabsize=2,	                    	% sets default tabsize to 2 spaces
 captionpos=b,                      % sets the caption-position to bottom
 breaklines=true,                   % sets automatic line breaking
 breakatwhitespace=false,           % sets if automatic breaks should only happen at whitespace
 escapeinside={\%*}{*)},            % if you want to add a comment within your code
 morekeywords={*,var,template,new}  % if you want to add more keywords to the set
}

% For date format
\ifbool{portuguese}{
  \RequirePackage[calc,portuguese]{datetime2}
}{
  \RequirePackage[calc,english]{datetime2}
}
	
\DTMnewdatestyle{shortdate}{%
  \renewcommand{\DTMdisplaydate}[4]{%
    \DTMmonthname{##2},\nobreakspace%
    \number##1%
  }%
  \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}%
}

\DTMnewdatestyle{fulldate}{%
  \renewcommand{\DTMdisplaydate}[4]{%
    \ifbool{portuguese}{%
      \number##3\ de\ \DTMmonthname{##2}\ de\ \number##1%
    }{%
      \number##3\ \DTMmonthname{##2}\ \number##1%
    }%
  }%
  \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}%
}	
	
\RequirePackage{siunitx} 		% required for \SI commands
\RequirePackage[acronym,toc,shortcuts,nopostdot,nogroupskip,automake]{glossaries} %for lists of terms, acronyms and symbols
\RequirePackage{enumitem} 		% for acronyms list spacing

\RequirePackage{notoccite}		% prevents cite command count in frontmatter

\RequirePackage[titletoc,title]{appendix} %for easy appendix management

\RequirePackage{algpseudocode}	
\RequirePackage[plain,chapter]{algorithm}	% way for inserting good looking pseudocode in a float
\algrenewcommand{\alglinenumber}[1]{\tiny\color{gray}#1~}

%\RequirePackage{pdfpages}		% to add external pdf pages

\RequirePackage{amssymb}		% for checkbox symbols

%----------------------------------------------------------------------------------------
%	METADATA
%----------------------------------------------------------------------------------------

\AtBeginDocument{					% Rendered PDF metadata:
\hypersetup{pdftitle=\ttitle} 		
\hypersetup{pdfauthor=\authorname} 	
\hypersetup{pdfcreator={DEEclass v\DEEtemplateversion}}
\hypersetup{pdfproducer={ISEP--DEE MEEC Template}}
}

%----------------------------------------------------------------------------------------
%	THESIS COMMANDS AND VALIDATION FLAGS
%----------------------------------------------------------------------------------------

\newbool{DEEtitledefined}
\newbool{DEEauthordefined}
\newbool{DEEstudentnumberdefined}
\newbool{DEEsupervisordefined}

\newbool{DEEcosupervisordefined}
\newbool{DEEcompanydefined}
\newbool{DEEcompanysupervisordefined}

\newbool{DEEcommitteepresidentdefined}
\newbool{DEEcommitteememberonedefined}
\newbool{DEEcommitteemembertwodefined}

\boolfalse{DEEtitledefined}
\boolfalse{DEEauthordefined}
\boolfalse{DEEstudentnumberdefined}
\boolfalse{DEEsupervisordefined}

\boolfalse{DEEcosupervisordefined}
\boolfalse{DEEcompanydefined}
\boolfalse{DEEcompanysupervisordefined}

\boolfalse{DEEcommitteepresidentdefined}
\boolfalse{DEEcommitteememberonedefined}
\boolfalse{DEEcommitteemembertwodefined}

% Safe empty defaults
\def\ttitle{}
\def\shorttitle{}
\def\authorname{}
\def\stdnumber{}
\def\supervisor@name{}
\def\supervisor@email{}

\newcommand{\DEEchecknonblank}[3]{%
  \ifblank{#1}{%
    \ClassError{DEEclass}
      {Empty value supplied to \string#2}
      {Provide a non-empty value using \string#2\{#3\}.}%
  }{}%
}

\NewDocumentCommand{\thesistitle}{o m}{%
  \DEEchecknonblank{#2}{\thesistitle}{Dissertation title}%
  \IfValueTF{#1}
    {\gdef\shorttitle{#1}}
    {\gdef\shorttitle{#2}}%
  \gdef\@title{#2}%
  \gdef\ttitle{#2}%
  \global\booltrue{DEEtitledefined}%
}

\RenewDocumentCommand{\author}{m}{%
  \DEEchecknonblank{#1}{\author}{Candidate's full name}%
  \gdef\authorname{#1}%
  \gdef\@author{#1}%
  \global\booltrue{DEEauthordefined}%
}

\NewDocumentCommand{\studentnumber}{m}{%
  \DEEchecknonblank{#1}{\studentnumber}{Student number}%
  \gdef\stdnumber{#1}%
  \global\booltrue{DEEstudentnumberdefined}%
}

\NewDocumentCommand{\supervisor}{m m}{%
  \DEEchecknonblank{#1}{\supervisor}{Supervisor name}%
  \DEEchecknonblank{#2}{\supervisor}{Supervisor email}%
  \gdef\supervisor@name{#1}%
  \gdef\supervisor@email{\url{#2}}%
  \global\booltrue{DEEsupervisordefined}%
}

\NewDocumentCommand{\cosupervisor}{m m}{%
  \DEEchecknonblank{#1}{\cosupervisor}{Co-supervisor name}%
  \DEEchecknonblank{#2}{\cosupervisor}{Co-supervisor email}%
  \gdef\coadvname{#1, \url{#2}}%
  \global\booltrue{DEEcosupervisordefined}%
}

\NewDocumentCommand{\company}{m}{%
  \DEEchecknonblank{#1}{\company}{Company name}%
  \gdef\companyname{#1}%
  \global\booltrue{DEEcompanydefined}%
}

\NewDocumentCommand{\cpsupervisor}{m m}{%
  \DEEchecknonblank{#1}{\cpsupervisor}{Company supervisor name}%
  \DEEchecknonblank{#2}{\cpsupervisor}{Company supervisor email}%
  \gdef\supname{#1, \url{#2}}%
  \global\booltrue{DEEcompanysupervisordefined}%
}

\NewDocumentCommand{\subdate}{m}{%
  \DTMsavedate{submissiondate}{#1}%
  \booltrue{fixedsubmissiondate}%
}
%month, year
\newcommand{\submissiondateshort}{%
  \begingroup
  \DTMsetdatestyle{shortdate}%
  \ifbool{fixedsubmissiondate}{%
    \DTMusedate{submissiondate}%
  }{%
    \today%
  }%
  \endgroup
}
% day, month, year
\newcommand{\submissiondatefull}{%
  \begingroup
  \DTMsetdatestyle{fulldate}%
  \ifbool{fixedsubmissiondate}{%
    \DTMusedate{submissiondate}%
  }{%
    \today%
  }%
  \endgroup
}

\NewDocumentCommand{\researchgroup}{m}{\newcommand{\groupname}{#1}}

\NewDocumentCommand{\committepresident}{m}{%
  \DEEchecknonblank{#1}{\committepresident}{Name and affiliation}%
  \gdef\commp{#1}%
  \global\booltrue{DEEcommitteepresidentdefined}%
}

\NewDocumentCommand{\committeememberone}{m}{%
  \DEEchecknonblank{#1}{\committeememberone}{Name and affiliation}%
  \gdef\commbone{#1}%
  \global\booltrue{DEEcommitteememberonedefined}%
}

\NewDocumentCommand{\committeemembertwo}{m}{%
  \DEEchecknonblank{#1}{\committeemembertwo}{Name and affiliation}%
  \gdef\commbtwo{#1}%
  \global\booltrue{DEEcommitteemembertwodefined}%
}

% New command to move content to the next page which prints to the next odd page if twosided mode is active
\newcommand{\checktoopen}{  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents

\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%define checked and unchecked checkbox symbols
\newcommand{\uncheckedbox}{%
  \makebox[1.1em][c]{\(\square\)}%
}
\newcommand{\checkedbox}{%
  \makebox[1.1em][c]{\(\boxtimes\)}%
}

\newcommand{\AIusagevalue}{undefined}
\newcommand{\AIaidslist}{}
\newcommand{\AItoolslist}{}

\newbool{AIusagedefined}
\newbool{AItoolsdefined}
\newbool{AIaidsdefined}
\newbool{AIdescriptiondefined}

\boolfalse{AIusagedefined}
\boolfalse{AItoolsdefined}
\boolfalse{AIaidsdefined}
\boolfalse{AIdescriptiondefined}

% Accepted AI-assistance identifiers
\newcommand{\DEEallowedAIaids}{%
  brainstorming,%
  literature-search,%
  translation,%
  summarization,%
  text-generation,%
  text-review,%
  code-generation,%
  visualization,%
  data-analysis,%
  other%
}

\NewDocumentCommand{\AIusage}{m}{%
  \ifstrequal{#1}{yes}{%
    \gdef\AIusagevalue{yes}%
    \global\booltrue{AIusagedefined}%
  }{%
    \ifstrequal{#1}{no}{%
      \gdef\AIusagevalue{no}%
      \global\booltrue{AIusagedefined}%
    }{%
      \ClassError{DEEclass}
        {Invalid value `#1' supplied to \string\AIusage}
        {Use exactly \string\AIusage\{yes\} or
         \string\AIusage\{no\}.}%
    }%
  }%
}

\newcommand{\AIcheckbox}[1]{%
  \ifdefstring{\AIusagevalue}{#1}
    {\checkedbox}
    {\uncheckedbox}%
}

\newcommand{\addAIaid}[1]{%
  \ifinlist{#1}{\DEEallowedAIaidslist}{%
    \listgadd{\AIaidslist}{#1}%
  }{%
    \ClassError{DEEclass}
      {Unknown AI assistance category `#1'}
      {Use one of the documented values:
       brainstorming, literature-search, translation,
       summarization, text-generation, text-review,
       code-generation, visualization, data-analysis, other.}%
  }%
}

\NewDocumentCommand{\AIaids}{m}{%
  \global\let\AIaidslist\@empty
  \forcsvlist{\addAIaid}{#1}%
  \global\booltrue{AIaidsdefined}%
}

\newcommand{\addAItool}[1]{%
  \ifblank{#1}{}{%
    \listgadd{\AItoolslist}{#1}%
  }%
}

\NewDocumentCommand{\AItools}{m}{%
  \global\let\AItoolslist\@empty
  \forcsvlist{\addAItool}{#1}%
  \ifblank{#1}{%
    \global\boolfalse{AItoolsdefined}%
  }{%
    \global\booltrue{AItoolsdefined}%
  }%
}

\newcommand{\printAItoolitem}[1]{%
  \item #1%
}

\newcommand{\AIaidcheckbox}[1]{%
  \ifinlist{#1}{\AIaidslist}
    {\checkedbox}
    {\uncheckedbox}%
}

\NewDocumentEnvironment{AItoolsdescription}{+b}{%
  \ifblank{#1}{%
    \global\boolfalse{AIdescriptiondefined}%
    \long\gdef\AItoolsdescriptioncontent{}%
  }{%
    \global\booltrue{AIdescriptiondefined}%
    \long\gdef\AItoolsdescriptioncontent{#1}%
  }%
}{}

\newcommand{\AItoolsdescriptioncontent}{%
  \ClassWarning{DEEclass}{%
    AI use was declared, but no AI tools description was provided.%
  }%
}

% Build the internal list of valid AI-assistance identifiers
\newcommand{\DEEallowedAIaidslist}{}
\forcsvlist{\listadd{\DEEallowedAIaidslist}}{%
  brainstorming,%
  literature-search,%
  translation,%
  summarization,%
  text-generation,%
  text-review,%
  code-generation,%
  visualization,%
  data-analysis,%
  other%
}

\AtBeginEnvironment{appendices}{%
  \global\booltrue{appendicesused}%
}

\newcommand{\printAIDeclarationIfNeeded}{%
  \ifbool{AIdeclarationprinted}{}{%
    \ifdefstring{\AIusagevalue}{yes}{%
      \global\booltrue{AIdeclarationprinted}%
      \printAIDeclaration
    }{}%
  }%
}

\AtEndEnvironment{appendices}{%
  \printAIDeclarationIfNeeded
}

\AtEndDocument{%
  \ifdefstring{\AIusagevalue}{yes}{%
    \ifbool{appendicesused}{}{%
      \begin{appendices}
        \printAIDeclarationIfNeeded
      \end{appendices}
    }%
  }{}%
}

%----------------------------------------------------------------------------------------
% TEMPLATE DATA VALIDATION
%----------------------------------------------------------------------------------------

\newcommand{\DEEvalidationerror}[2]{%
  \ClassError{DEEclass}{#1}{#2}%
}

\newcommand{\DEEValidateMetadata}{%

  \ifbool{DEEtitledefined}{}{%
    \DEEvalidationerror
      {Dissertation title not specified}
      {Add \string\thesistitle\{Dissertation title\} before
       \string\begin\{document\}.}%
  }%

  \ifbool{DEEauthordefined}{}{%
    \DEEvalidationerror
      {Candidate name not specified}
      {Add \string\author\{Candidate's full name\}.}%
  }%

  \ifbool{DEEstudentnumberdefined}{}{%
    \DEEvalidationerror
      {Student number not specified}
      {Add \string\studentnumber\{1234567\}.}%
  }%

  \ifbool{DEEsupervisordefined}{}{%
    \DEEvalidationerror
      {ISEP supervisor not specified}
      {Add
       \string\supervisor\{Supervisor name\}\{email@isep.ipp.pt\}.}%
  }%

  % Company data must be supplied as a consistent pair
  \ifbool{DEEcompanydefined}{%
    \ifbool{DEEcompanysupervisordefined}{}{%
      \DEEvalidationerror
        {Company specified without a company supervisor}
        {Add \string\cpsupervisor\{Name\}\{email\}, or remove
         the \string\company command.}%
    }%
  }{%
    \ifbool{DEEcompanysupervisordefined}{%
      \DEEvalidationerror
        {Company supervisor specified without a company}
        {Add \string\company\{Company name\}, or remove
         the \string\cpsupervisor command.}%
    }{}%
  }%

  % Committee is mandatory only in finalversion
  \ifbool{finalversion}{%
    \ifbool{DEEcommitteepresidentdefined}{}{%
      \DEEvalidationerror
        {Examination committee chair not specified}
        {The finalversion option requires
         \string\committepresident\{Name, affiliation\}.}%
    }%

    \ifbool{DEEcommitteememberonedefined}{}{%
      \DEEvalidationerror
        {First examination committee member not specified}
        {The finalversion option requires
         \string\committeememberone\{Name, affiliation\}.}%
    }%

    \ifbool{DEEcommitteemembertwodefined}{}{%
      \DEEvalidationerror
        {Second examination committee member not specified}
        {The finalversion option requires
         \string\committeemembertwo\{Name, affiliation\}.}%
    }%
  }{}%

  % AI declaration is always mandatory
  \ifbool{AIusagedefined}{}{%
    \DEEvalidationerror
      {Generative AI usage was not declared}
      {Add exactly \string\AIusage\{yes\} or
       \string\AIusage\{no\}.}%
  }%

  % Additional AI fields are mandatory only when AIusage=yes
  \ifdefstring{\AIusagevalue}{yes}{%

    \ifbool{AItoolsdefined}{}{%
      \DEEvalidationerror
        {AI use was declared, but no tools were listed}
        {Add, for example,
         \string\AItools\{OpenAI ChatGPT, Microsoft Copilot\}.}%
    }%

    \ifbool{AIaidsdefined}{}{%
      \DEEvalidationerror
        {AI use was declared, but no assistance categories were selected}
        {Add the applicable categories using
         \string\AIaids\{...\}.}%
    }%

    \ifbool{AIdescriptiondefined}{}{%
      \DEEvalidationerror
        {AI use was declared, but no usage description was provided}
        {Provide a brief description inside the
         AItoolsdescription environment.}%
    }%

  }{}%
}

%----------------------------------------------------------------------------------------
%	CUSTOM LANGUAGE SETTINGS
%----------------------------------------------------------------------------------------
\addto{\captionsportuguese}{\renewcommand*\contentsname{\'{I}ndice}}

\addto{\captionsportuguese}{\renewcommand{\appendixname}{Anexo}}

\addto{\captionsenglish}{\renewcommand{\bibname}{References}}
\addto{\captionsportuguese}{\renewcommand{\bibname}{Refer\^{e}ncias}}

\newcommand{\reftocname}{References}
\providecaptionname{english}{\reftocname}{References}
\providecaptionname{portuguese}{\reftocname}{Refer\^{e}ncias}

\addto{\captionsenglish}{\renewcommand{\lstlistlistingname}{Listings}}
\addto{\captionsportuguese}{\renewcommand{\lstlistlistingname}{Listagens}}

\newcommand{\secondLang}{portuguese}
\iflanguage{portuguese}{
	\renewcommand{\lstlistingname}{Listagem}
 	\renewcommand{\ALG@name}{Algoritmo}
	\renewcommand{\secondLang}{english}
	\newtheorem{theorem}{Teorema}
	\newtheorem{corollary}{Corolário}
	\newtheorem{lemma}{Lema}	
}{
	\newtheorem{theorem}{Theorem}
	\newtheorem{corollary}{Corollary}
	\newtheorem{lemma}{Lemma}
}

\DefineBibliographyStrings{english}{%
  backrefpage = {Cited on page},% 
  backrefpages = {Cited on pages},% 
}

\DefineBibliographyStrings{portuguese}{%
  backrefpage = {Citado na p\'{a}gina},% 
  backrefpages = {Citado nas p\'{a}ginas},% 
}

%----------------------------------------------------------------------------------------
%	MARGINS and SPACING
%----------------------------------------------------------------------------------------

\RequirePackage{setspace} % Required for changing line spacing
\onehalfspacing	%from the setspace package

\RequirePackage{geometry}
\geometry{
	headheight=4ex,
%	includehead,
%	includefoot,
	paper=a4paper, 
	inner=3cm, % Inner margin
	outer=3.5cm, % Outer margin
	bindingoffset=.5cm, % Binding offset
	top=3.5cm, % Top margin
	bottom=3cm, % Bottom margin
	%showframe, % Uncomment to show how the type block is set on the page	
}

\raggedbottom

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}
%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS STYLE
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{\headmark}% Inner header
	\ohead{\pagemark}% Outer header
	\cfoot[\pagemark]{} %new
}
\ifoot{}% Inner footer
\ofoot{}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
KOMA-script documentation for details.}]{fancyhdr}

\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
% RESTORE OFFICIAL DOCUMENT LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\DEEApplyOfficialLayout}{%

  % Official line spacing
  \onehalfspacing

  % Official page geometry
  \geometry{
    headheight=4ex,
    paper=a4paper,
    inner=3cm,
    outer=3.5cm,
    bindingoffset=.5cm,
    top=3.5cm,
    bottom=3cm
  }

  % Official caption formatting
  \captionsetup{
    justification=centerlast,
    font=small,
    margin=50pt
  }

  \raggedbottom

  % Official paragraph and page-break behaviour
  \doublehyphendemerits=10000
  \brokenpenalty=10000
  \widowpenalty=9999
  \clubpenalty=9999
  \interfootnotelinepenalty=9999
}

%----------------------------------------------------------------------------------------
% INCOMPATIBLE OR FORMAT-ALTERING PACKAGES
%----------------------------------------------------------------------------------------

\newcommand{\DEEForbiddenPackageMessage}[1]{%
  \ClassError{DEEclass}
    {Package `#1' is not permitted with DEEclass}
    {DEEclass already defines the official institutional format.
     Remove \string\usepackage\{#1\} from preamble.tex.}%
}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{titlesec}]
  {titlesec}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{tocloft}]
  {tocloft}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{fullpage}]
  {fullpage}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{anysize}]
  {anysize}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{sectsty}]
  {sectsty}

\PreventPackageFromLoading
  [\DEEForbiddenPackageMessage{fancyhdr}]
  {fancyhdr}

\newcommand{\DEECheckForbiddenPackages}{%
  \@ifpackageloaded{titlesec}
    {\DEEForbiddenPackageMessage{titlesec}}{}%
  \@ifpackageloaded{tocloft}
    {\DEEForbiddenPackageMessage{tocloft}}{}%
  \@ifpackageloaded{fullpage}
    {\DEEForbiddenPackageMessage{fullpage}}{}%
  \@ifpackageloaded{anysize}
    {\DEEForbiddenPackageMessage{anysize}}{}%
  \@ifpackageloaded{sectsty}
    {\DEEForbiddenPackageMessage{sectsty}}{}%
  \@ifpackageloaded{fancyhdr}
    {\DEEForbiddenPackageMessage{fancyhdr}}{}%
}
  
%----------------------------------------------------------------------------------------
%	TITLE PAGES DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\university}{Polit\'{e}cnico do Porto}
\newcommand{\school}{Instituto Superior de Engenharia do Porto}
\newcommand{\department}{Departamento de Engenharia Eletrot\'{e}cnica}
\newcommand{\degree}{}
\newcommand{\degreeshort}{}
\newcommand{\darea}{}

\renewcommand{\degree}{Mestrado em Engenharia Electrot\'{e}cnica e de Computadores}
\providecaptionname{english}{\degree}{Master in Electrical and Computer Engineering}
\providecaptionname{portuguese}{\degree}{Mestrado em Engenharia Electrot\'{e}cnica e de Computadores}

\renewcommand{\degreeshort}{Engenharia Electrot\'{e}cnica e de Computadores}
\providecaptionname{english}{\degreeshort}{Electrical and Computer Engineering}
\providecaptionname{portuguese}{\degreeshort}{Engenharia Electrot\'{e}cnica e de Computadores}
	
\ifbool{MEECAS}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Automa\c{c}\~{a}o e Sistemas}
	\providecaptionname{english}{\darea}{Specialization Area of Automation and Systems}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Automa\c{c}\~{a}o e Sistemas}	
}{}

\ifbool{MEECSA}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas Aut\'{o}nomos}
	\providecaptionname{english}{\darea}{Specialization Area of Autonomous Systems}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas Aut\'{o}nomos}		
}{}

\ifbool{MEECPI}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas e Planeamento Industrial}
	\providecaptionname{english}{\darea}{Specialization Area of Systems And Industrial Planning}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas e Planeamento Industrial}		
}{}

\ifbool{MEECTE}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Telecomunica\c{c}\~{o}es}
	\providecaptionname{english}{\darea}{Specialization Area of Telecommunications}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Telecomunica\c{c}\~{o}es}		
}{}

\newcommand{\frontcourselabel}{{\large \degree}\\{\large \darea}\\}

\newcommand{\disclamer}{This dissertation partially satisfies the requirements defined for the Thesis/Dissertation course of the program }
\providecaptionname{english}{\disclamer}{This dissertation partially satisfies the requirements of the Thesis/Dissertation course of the program }
\providecaptionname{portuguese}{\disclamer}{Esta disserta\c{c}\~ao satisfaz, parcialmente, os requisitos que constam da Ficha de Unidade Curricular de Tese/Disserta\c{c}\~{a}o, do 2º ano, do }

\newcommand{\disclamersecond}{Disserta\c{c}\~ao submetida por}
\providecaptionname{english}{\disclamersecond}{Dissertation submitted by }
\providecaptionname{portuguese}{\disclamersecond}{Disserta\c{c}\~ao submetida por }

\newcommand{\disclamermiddle}{(estudante nº }
\providecaptionname{english}{\disclamermiddle}{(student no. }
\providecaptionname{portuguese}{\disclamermiddle}{(estudante nº }

\newcommand{\disclamerthird}{para obten\c{c}\~ao do Grau de Mestre em }
\providecaptionname{english}{\disclamerthird}{in partial fulfillment of the requirements for the Degree of Master in }
\providecaptionname{portuguese}{\disclamerthird}{para obten\c{c}\~ao do Grau de Mestre em }

\newcommand{\aftercourselabel}{\large \disclamersecond \textbf{\authorname} \disclamermiddle \stdnumber) \disclamerthird \degreeshort, \darea.\\}

%%

\newcommand{\studentlabel}{Candidate}
\providecaptionname{english}{\studentlabel}{Candidate}
\providecaptionname{portuguese}{\studentlabel}{Candidato}

\newcommand{\nblabel}{nb.}
\providecaptionname{english}{\nblabel}{{No. }}
\providecaptionname{portuguese}{\nblabel}{{Nº }}

\newcommand{\supervisorlabel}{Supervisor}
\providecaptionname{english}{\supervisorlabel}{Supervisor}
\providecaptionname{portuguese}{\supervisorlabel}{Orientador}

\newcommand{\cosupervisorlabel}{Co-Supervisor}
\providecaptionname{english}{\cosupervisorlabel}{Co-Supervisor}
\providecaptionname{portuguese}{\cosupervisorlabel}{Co-Orientador}

\newcommand{\cpsupervisorlabel}{Company Supervisor}
\providecaptionname{english}{\cpsupervisorlabel}{Company Supervisor}
\providecaptionname{portuguese}{\cpsupervisorlabel}{Orientador da Empresa}

\newcommand{\companylabel}{Company}
\providecaptionname{english}{\companylabel}{Company}
\providecaptionname{portuguese}{\companylabel}{Empresa}

\newcommand{\committeelabel}{Examination Committee:}
\providecaptionname{english}{\committeelabel}{Examination Committee:}
\providecaptionname{portuguese}{\committeelabel}{J\'{u}ri:}

\newcommand{\committeechairlabel}{Chair:}
\providecaptionname{english}{\committeechairlabel}{Chair:}
\providecaptionname{portuguese}{\committeechairlabel}{Presidente:}

\newcommand{\committeememberslabel}{Members:}
\providecaptionname{english}{\committeememberslabel}{Members:}
\providecaptionname{portuguese}{\committeememberslabel}{Vogais:}

\newcommand{\declaname}{Declaration of Integrity}
\providecaptionname{english,british,american}{\declaname}{Declaration of Integrity}
\providecaptionname{portuguese}{\declaname}{Declara\c{c}\~{a}o de Integridade}

%%%

\newcommand{\printcoverpage}{
	\begin{titlepage}
	\pdfbookmark[0]{Front}{cover}
	\begin{center}
	\includegraphics[width=6cm]{isep_wordmark_expanded_vintage.pdf}\\[1cm]
	\vfill	
	\HRule \\ % Horizontal line
	\vspace{15pt}	
	{\huge \bfseries \ttitle\par}\vspace{0.4cm} % Thesis title
%	\ifdefined\tsubtitle {\huge \bfseries \tsubtitle} \\ \fi % Thesis sub title, if exists
	\vspace{10pt}
	\HRule \\[2cm] % Horizontal line
	{\Large\bf \authorname}\par	
	\vfill	
	{\frontcourselabel}\par
	\vspace{1cm}
	{\large \supervisorlabel: \supervisor@name}
	\vfill	
	{\scshape\normalsize \university}\\
	{\large \school}\\
	{\scshape\large \department}\\[1cm]
	{\normalsize \submissiondateshort}\\[5mm]
	\end{center}
	\end{titlepage}
}

\newcommand{\printaftercoverpage}{
	\checktoopen
	\thispagestyle{empty}
	\begin{center}	
	{\LARGE \bfseries \ttitle\par}\vspace{0.4cm}
	\vfill
	\aftercourselabel
	\vfill
	\raggedright
	{\small\bf\supervisorlabel:}\\
	{\large ~~~~~~\supervisor@name,~\supervisor@email}\\[2pt]
	\ifdefined\coadvname {{\small\bf\cosupervisorlabel:}\\ ~~~~~~\coadvname}\\[2pt] \fi
	\ifdefined\companyname {{\small\bf\cpsupervisorlabel:}\\ ~~~~~~(\companyname)\\~~~~~~\supname}\\ \fi
	\vfill
	\ifbool{finalversion}{
	{\small\bf \committeelabel}\\
	{\small\bf ~~~\committeechairlabel}\\
	{\large ~~~~~~\commp}\\[2pt]
	{\small\bf ~~~\committeememberslabel}\\
	{\large ~~~~~~\commbone}\\[2pt]
	{\large ~~~~~~\commbtwo}\\[2pt]
	\vfill
	}{}
	\centering
	\includegraphics[width=6cm]{isep_wordmark_expanded_vintage.pdf}\\[0.15cm]
	{\normalsize Rua Dr. Ant\'{o}nio Bernardino de Almeida 431, 4249--015 Porto}\\[0.5cm]
	{\normalsize \submissiondateshort}\\[5mm]
	\end{center}
	
	\newpage
	\thispagestyle{empty}
	
	\null
	\vfill

	\noindent
	{\tiny\color{gray}%
  	DEEclass v\DEEtemplateversion\space
  	(\DEEtemplatereleasedate)%
	}
	
	\vspace*{3mm}
	\par
	\newpage	
}

%%3rd page
%----------------------------------------------------------------------------------------
% INTEGRITY DECLARATION
%----------------------------------------------------------------------------------------

\newcommand{\printdeclaration}{%
  \checktoopen
  \thispagestyle{empty}

  \begin{center}
    \includegraphics[width=6cm]{isep_wordmark_expanded_vintage.pdf}\\[3cm]
    {\LARGE\bfseries \declaname\par}
    \vspace{1.5cm}
  \end{center}

  \ifbool{portuguese}{%

    Eu, \authorname, estudante n.º \stdnumber, declaro ter conduzido este trabalho académico com integridade. Não plagiei ou apliquei qualquer forma de uso indevido de informações ou falsificação de resultados ao longo do processo que levou à sua elaboração.

    Declaro que o trabalho apresentado neste documento é original e de minha autoria, não tendo sido utilizado anteriormente para nenhum outro fim. Adicionalmente declaro que:

    \begin{description}[
      leftmargin=2.2em,
      labelwidth=1.2em,
      labelsep=0.6em,
      itemsep=0.5em,
      align=left
    ]

      \item[\AIcheckbox{no}]
      não utilizei quaisquer ferramentas de inteligência artificial generativa na elaboração desta dissertação;

      \item[\AIcheckbox{yes}]
      utilizei ferramentas de inteligência artificial generativa na elaboração desta dissertação, conforme descrito no Anexo
      ``Declaração de Uso de Inteligência Artificial Generativa'', do qual assumo plena responsabilidade.

    \end{description}

    Declaro ainda que tenho pleno conhecimento do Código de Conduta Ética do P.PORTO.

    \vspace{1.5cm}

    \noindent
    ISEP, Porto, \submissiondatefull

  }{%

    I, \authorname, student number \stdnumber, declare that I have conducted this academic work with integrity. I have not plagiarized, misused information or falsified results during the process that led to its preparation.

    I declare that the work presented in this document is original and my own, and that it has not previously been used for any other purpose. I additionally declare that:

    \begin{description}[
      leftmargin=2.2em,
      labelwidth=1.2em,
      labelsep=0.6em,
      itemsep=0.5em,
      align=left
    ]

      \item[\AIcheckbox{no}]
      I did not use any generative artificial intelligence tools in the preparation of this dissertation;

      \item[\AIcheckbox{yes}]
      I used generative artificial intelligence tools in the preparation of this dissertation, as described in the Appendix
      ``Declaration of Generative Artificial Intelligence Use'', for which I accept full responsibility.

    \end{description}

    I further declare that I am fully aware of the P.PORTO Code of Ethical Conduct.

    \vspace{1.5cm}

    \noindent
    ISEP, Porto, \submissiondatefull

  }%
}

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand\dedicatory[1]{
	\checktoopen
	\tttypeout{Dedicatory}
	\null\vfil
	\thispagestyle{empty}
	\begin{flushright}{\slshape #1}\end{flushright}
	\vfil\null
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\acknowledgementname}{Acknowledgements}
\providecaptionname{english}{\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries
\providecaptionname{portuguese}{\acknowledgementname}{Agradecimentos} 

\DeclareDocumentEnvironment{acknowledgements}{}{%
	\checktoopen
	\tttypeout{\acknowledgementname}
	\chapter*{\acknowledgementname}
	\thispagestyle{empty}
	\pdfbookmark[0]{\acknowledgementname}{acknowl}
	}
	{
	\vfil\vfil\null
	\cleardoublepage
	}
	
%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abstraclabel}{Abstract}
\providecaptionname{english}{\abstraclabel}{Abstract}
\providecaptionname{portuguese}{\abstraclabel}{Resumo} % Portuguese 

\newcommand{\keywordslabel}{Keywords}
\providecaptionname{english}{\keywordslabel}{Keywords}
\providecaptionname{portuguese}{\keywordslabel}{Palavras-Chave} % Portuguese 

\newenvironment{abstract}{
	\setcounter{page}{1}
	\checktoopen	
	\tttypeout{\abstraclabel}
	\thispagestyle{plain}
	\chapter*{\abstraclabel}
	\pdfbookmark[0]{\abstraclabel}{abstract1}	
	}
	{
  	\vfill\null
	}

\newenvironment{secondlangabstract}{
	\checktoopen
	\begin{otherlanguage}{\secondLang}
	\tttypeout{\abstraclabel}
	\thispagestyle{plain}
	\chapter*{\abstraclabel}
	\pdfbookmark[0]{\abstraclabel}{abstract2}
	}
	{
	\end{otherlanguage}
  	\vfill\null
	}

%----------------------------------------------------------------------------------------
% AUTOMATIC FRONT MATTER
%----------------------------------------------------------------------------------------

\newbool{DEEincludededication}
\newbool{DEEincludeacknowledgements}
\newbool{DEEfrontmatterprinted}

\boolfalse{DEEincludededication}
\boolfalse{DEEincludeacknowledgements}
\boolfalse{DEEfrontmatterprinted}

\newcommand{\IncludeDedication}{%
  \global\booltrue{DEEincludededication}%
}

\newcommand{\IncludeAcknowledgements}{%
  \global\booltrue{DEEincludeacknowledgements}%
}

\newcommand{\DEEInputRequiredFile}[1]{%
  \IfFileExists{#1.tex}{%
    \input{#1}%
  }{%
    \ClassError{DEEclass}
      {Required template file `#1.tex' was not found}
      {Restore the missing file from the official template.}%
  }%
}

\newcommand{\DEEInputOptionalFile}[1]{%
  \IfFileExists{#1.tex}{%
    \input{#1}%
  }{%
    \ClassWarning{DEEclass}
      {Optional file `#1.tex' was requested but not found}%
  }%
}

\newcommand{\DEEPrintFrontMatter}{%
  \ifbool{DEEfrontmatterprinted}{}{%
    \global\booltrue{DEEfrontmatterprinted}%

    \frontmatter
    \pagestyle{plain}
    % Mandatory institutional pages
    \printcoverpage
    \printaftercoverpage
    \printdeclaration
	%\cleardoublepage
    % Optional
    \ifbool{DEEincludededication}{%
      \DEEInputOptionalFile{front/1_dedicatory}%
    }{}%

    \ifbool{DEEincludeacknowledgements}{%
      \DEEInputOptionalFile{front/2_acknowledgements}%
    }{}%

    % Mandatory abstract and standard lists
    \DEEInputRequiredFile{front/3_abstract}%
    \DEEInputRequiredFile{front/4_frontmatterlists}%

    % Start the dissertation body automatically
    \mainmatter
    \pagestyle{thesis}%
  }%
}
	
%----------------------------------------------------------------------------------------
%	LISTINGS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\printlistoflistings}{
	\lstlistoflistings  % Prints the list of listings (programming language source code segments)
	\addchaptertocentry{\lstlistlistingname} %Adds the list of listings to the table of contents
}

%----------------------------------------------------------------------------------------
%	ALGORITHMS PAGE DESIGN
%----------------------------------------------------------------------------------------
\providecaptionname{english,british,american}{\listalgorithmname}{List of Algorithms}
\providecaptionname{portuguese}{\listalgorithmname}{Lista de Algoritmos}
	
\newcommand{\printlistofalgorithms}{
	\listofalgorithms
	\addchaptertocentry{\listalgorithmname}
}

%----------------------------------------------------------------------------------------
%	GLOSSARY PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\glossname}{Glossary}
\providecaptionname{english,british,american}{\glossname}{Glossary}
\providecaptionname{portuguese}{\glossname}{Gloss\'{a}rio}

\newcommand{\printlistofterms}{
	\printglossary[nonumberlist,style=altlist,title=\glossname]
}

%----------------------------------------------------------------------------------------
%	ACRONYMS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\acronymsname}{List of Acronyms}
\providecaptionname{english,british,american}{\acronymsname}{List of Acronyms}
\providecaptionname{portuguese}{\acronymsname}{Lista de Acr\'{o}nimos}

\newglossarystyle{leftlong}{%
  \setglossarystyle{long}%
  \renewcommand{\glossentry}[2]{%
    \glsentryitem{##1}\glstarget{##1}{\bfseries \glossentryname{##1}} &
    \glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline
  }%
}

\newcommand{\printlistofacronyms}[1]{
	\setlist[description]{leftmargin=!, labelwidth=\widthof{#1}} % Change for glossaries
	\printglossary[title=\acronymsname,type=\acronymtype,nonumberlist]	% Prints the list  
	\setlist[description]{style=standard} % reset settings back to default
}

%\setlength\LTleft{0pt}
%\setlength\glsdescwidth{0.75\hsize}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{portuguese}{\symbolsname}{Lista de S\'{i}mbolos}

\newcommand{\symbolsSymbol}{Symbol}
\providecaptionname{english,british,american}{\symbolsSymbol}{Symbol}
\providecaptionname{portuguese}{\symbolsSymbol}{S\'{i}mbolo}
\newcommand{\symbolsDescription}{Description}
\providecaptionname{english,british,american}{\symbolsDescription}{Description}
\providecaptionname{portuguese}{\symbolsDescription}{Descri\c{c}\~{a}o}
\newcommand{\symbolsUnits}{Units}
\providecaptionname{english,british,american}{\symbolsUnits}{Units}
\providecaptionname{portuguese}{\symbolsUnits}{Unidades}

\newglossary[slg]{symbolslist}{syi}{syg}{List of Symbols} % create add. symbolslist
\glsaddkey{unit}{\glsentrytext{\glslabel}}{\glsentryunit}{\GLsentryunit}{\glsunit}{\Glsunit}{\GLSunit}
\glssetnoexpandfield{unit}

\newglossarystyle{symbunitlong}{%
\setglossarystyle{long3col}% base this style on the list style
\renewenvironment{theglossary}{% Change the table type --> 3 columns
  \begin{longtable}{cp{0.6\glsdescwidth}>{\centering\arraybackslash}p{2cm}}}%
  {\end{longtable}}%
%
\renewcommand*{\glossaryheader}{%  Change the table header
  \tabhead{\symbolsSymbol} & \tabhead{\symbolsDescription} & \tabhead{\symbolsUnits}\\
  %\bfseries \symbolsSymbol & \bfseries \symbolsDescription & \bfseries \symbolsUnits\\
  \midrule%\hline
  \endhead}
\renewcommand*{\glossentry}[2]{%  Change the displayed items
\glstarget{##1}{\glossentryname{##1}} %
& \glossentrydesc{##1}% Description
& \glsunit{##1}  \tabularnewline
}
}

\newcommand{\printlistofsymbols}{
	\glsaddall[types={symbolslist}]
	\printglossary[title=\symbolsname,type=symbolslist,style=symbunitlong,nonumberlist]
	}

%----------------------------------------------------------------------------------------
% GENERATIVE AI USE DECLARATION APPENDIX
%----------------------------------------------------------------------------------------

\newcommand{\printAIDeclaration}{%
  \ifdefstring{\AIusagevalue}{yes}{%

    \ifbool{portuguese}{%

      \chapter{Declaração de Uso de Inteligência Artificial Generativa}
      \label{AppendixAI}

      Esta declaração documenta de forma clara e transparente em que medida foram utilizadas ferramentas de Inteligência Artificial (IA) generativa no processo de elaboração da dissertação. Considera-se também que esta declaração não abrange o uso de técnicas ou modelos de IA enquanto objeto do estudo científico no âmbito do trabalho desenvolvido.

      \subsection*{Lista de ferramentas utilizadas:}

      \ifstrempty{\AItoolslist}{%
        \ClassWarning{DEEclass}{%
          Foi declarado o uso de IA, mas não foram indicadas ferramentas%
        }%
        \textit{Nenhuma ferramenta foi identificada.}
      }{%
        \begin{enumerate}[
          label=(\arabic*),
          leftmargin=2.8em,
          labelsep=0.6em,
          itemsep=0.2em,
          topsep=0.3em
        ]
          \forlistloop{\printAItoolitem}{\AItoolslist}
        \end{enumerate}
      }

      \subsection*{%
        Declaro que utilizei as ferramentas de IA generativa para:%
      }

		\begin{enumerate}[
  		leftmargin=3.8em,
  		labelwidth=2.6em,
  		labelsep=0.5em,
  		align=left,
  		itemsep=0.5em,
  		topsep=0.3em
		]

        \item[\AIaidcheckbox{brainstorming}\ (a)]
        apoiar a geração de ideias, definição de objetivos ou estrutura da dissertação;

        \item[\AIaidcheckbox{literature-search}\ (b)]
        sugerir referências bibliográficas, localizar ou organizar literatura científica;

        \item[\AIaidcheckbox{translation}\ (c)]
        traduzir texto entre idiomas;

        \item[\AIaidcheckbox{summarization}\ (d)]
        resumir, sintetizar ou comparar textos de fontes bibliográficas;

        \item[\AIaidcheckbox{text-generation}\ (e)]
        sugerir ou gerar texto de partes da dissertação;

        \item[\AIaidcheckbox{text-review}\ (f)]
        efetuar a revisão linguística ou correção ortográfica de partes da dissertação;

        \item[\AIaidcheckbox{code-generation}\ (g)]
        gerar ou completar código, por exemplo, em MATLAB, Python ou outras linguagens;

        \item[\AIaidcheckbox{visualization}\ (h)]
        apoiar a visualização de dados ou gerar figuras, diagramas ou imagens;

        \item[\AIaidcheckbox{data-analysis}\ (i)]
        realizar a análise ou interpretação automática de dados, por exemplo, classificação, \textit{clustering} ou outros métodos;

        \item[\AIaidcheckbox{other}\ (j)]
        outros fins não enquadrados nas categorias anteriores.

      \end{enumerate}

      \subsection*{Descrição da utilização:}

      \begin{enumerate}[leftmargin=2.8em,itemsep=0.5em,topsep=0.4em]
        \AItoolsdescriptioncontent
      \end{enumerate}

    }{%
      \chapter{Declaration of Generative Artificial Intelligence Use}
      \label{AppendixAI}

      This declaration clearly and transparently documents the extent to which generative Artificial Intelligence (AI) tools were used in the preparation of this dissertation. This declaration does not cover the use of AI techniques or models when they constitute the subject of the scientific study conducted as part of this work.

      \subsection*{List of tools used:}

      \ifstrempty{\AItoolslist}{%
        \ClassWarning{DEEclass}{%
          AI use was declared, but no AI tools were listed%
        }%
        \textit{No tools were identified.}
      }{%
        \begin{enumerate}[
          label=(\arabic*),
          leftmargin=2.8em,
          labelsep=0.6em,
          itemsep=0.2em,
          topsep=0.3em
        ]
          \forlistloop{\printAItoolitem}{\AItoolslist}
        \end{enumerate}
      }

      \subsection*{%
        I declare that I used generative AI tools to:%
      }

		\begin{enumerate}[
  		leftmargin=3.8em,
  		labelwidth=2.6em,
  		labelsep=0.5em,
  		align=left,
  		itemsep=0.5em,
  		topsep=0.3em
		]

        \item[\AIaidcheckbox{brainstorming}\ (a)]
        support the generation of ideas, the definition of objectives or the organization of the dissertation;

        \item[\AIaidcheckbox{literature-search}\ (b)]
        suggest bibliographic references or locate and organize scientific literature;

        \item[\AIaidcheckbox{translation}\ (c)]
        translate text between languages;

        \item[\AIaidcheckbox{summarization}\ (d)]
        summarize, synthesize or compare texts from bibliographic sources;

        \item[\AIaidcheckbox{text-generation}\ (e)]
        suggest or generate text for parts of the dissertation;

        \item[\AIaidcheckbox{text-review}\ (f)]
        perform language revision or spelling correction on parts of the dissertation;

        \item[\AIaidcheckbox{code-generation}\ (g)]
        generate or complete code, for example, in MATLAB, Python or other programming languages;

        \item[\AIaidcheckbox{visualization}\ (h)]
        support data visualization or generate figures, diagrams or images;

        \item[\AIaidcheckbox{data-analysis}\ (i)]
        perform automated data analysis or interpretation, for example, classification, clustering or other methods;

        \item[\AIaidcheckbox{other}\ (j)]
        serve other purposes not covered by the preceding categories.

      \end{enumerate}

      \subsection*{Description of use:}

      \begin{enumerate}[leftmargin=2.8em,itemsep=0.5em,topsep=0.4em]
        \AItoolsdescriptioncontent
      \end{enumerate}

    }%

  }{}%
}

%----------------------------------------------------------------------------------------
% AUTOMATIC DOCUMENT INITIALIZATION
%----------------------------------------------------------------------------------------

\AtBeginDocument{%
  \DEECheckForbiddenPackages
  \DEEValidateMetadata
  \DEEApplyOfficialLayout
  \DEEPrintFrontMatter
}

%----------------------------------------------------------------------------------------
%	CUSTOM DISSERTATION COMMANDS
%----------------------------------------------------------------------------------------
% new command for inline graphics (set to line height)
\newlength\myheight				
\newlength\mydepth
\settototalheight\myheight{Xygp}
\settodepth\mydepth{Xygp}
\setlength\fboxsep{0pt}
\newcommand*\inlinegraphics[1]{%
  \settototalheight\myheight{Xygp}%
  \settodepth\mydepth{Xygp}%
  \raisebox{-\mydepth}{\includegraphics[height=\myheight]{#1}}%
}

% Print the bibliographic references using the Harvard format
\newcommand{\printbibreferences}{
\phantomsection
\printbibliography[heading=bibintoc, title=\reftocname]
\cleardoublepage
}

% Define some commands to keep the formatting separated from the content 
\newcommand{\tabhead}[1]{\textbf{#1}}
\newcommand{\code}[1]{\texttt{#1}}
%\newcommand{\file}[1]{\texttt{\bfseries#1}}
\newcommand{\file}[1]{\texttt{#1}}
\newcommand{\option}[1]{\texttt{\itshape#1}}

%----------------------------------------------------------------------------------------
\endinput

