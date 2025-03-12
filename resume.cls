%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{fancyhdr}
\pagestyle{fancy}
\usepackage{graphicx}
\pagestyle{empty} % Suppress page numbers
%\usepackage[T1]{fontenc}
% \usepackage[scaled]{helvet}
% \renewcommand\familydefault{\sfdefault} 
\usepackage[T1]{fontenc}
\usepackage{amsmath}
\usepackage{fontspec}
\usepackage{color,soul}
\usepackage{enumitem}
\usepackage[maxbibnames=99,giveninits=true]{biblatex}

%--------------------------------------------------------------
\usepackage{color}

%accent color
\definecolor{sectcol}{RGB}{255, 100,0}
%\definecolor{sectcol}{RGB}{100,100,100}

%dark background color
\definecolor{bgcol}{RGB}{110,110,110}

%light background / accent color
\definecolor{softcol}{RGB}{100,100,100}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
	\@ifundefined{@addresstwo}{
		\def \@addresstwo {#1}
	}{
		\@ifundefined{@addressthree}{
			\def \@addressthree {#1}
		}{
			\def \@addressone {#1}
		}}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
\begingroup
\def \\ {\addressSep\ }
\centerline{#1}
\endgroup
\par
\addressskip
}

% \printname is used to print the name as a page header
\def \printname {
	\begingroup
	\hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
	\nameskip\break
	\endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
	\ori@document  % Begin document
	\printname % Print the name specified with \name
	\@ifundefined{@addressone}{}{ % Print the first address if specified
		\printaddress{\@addressone}}
	\@ifundefined{@addresstwo}{}{ % Print the second address if specified
		\printaddress{\@addresstwo}}
	\@ifundefined{@addressthree}{}{ % Print the third address if specified
		\printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
	% \sectionskip
	\colorbox{white}{\makebox[1\linewidth][l]{
			\textcolor{black}{\textbf{#1}}\hspace{4pt}
		}}
	%\MakeUppercase{\bf #1} % Section title
	%\sectionlineskip
	\hrule % Horizontal line
	\begin{list}{}{ % List for each individual item in the section
			\setlength{\leftmargin}{1.5em} % Margin within the section
		}
		\item[]
		      }{
	\end{list}
}

%----------------------------------------------------------------------------------------
\makeatletter
\newcommand*\bigcdot{\mathpalette\bigcdot@{1.0}}
\newcommand*\bigcdot@[2]{\mathbin{\vcenter{\hbox{\scalebox{#2}{$\m@th#1\bullet$}}}}}
\makeatother
%----------------------------------------------------------------------------------------
%\newenvironment{cvevent}[3]
%{
%\vspace{8pt}
%	\begin{tabular*}{1\textwidth}{p{2.3cm}  p{10.8cm} x{3.9cm}}
% \textcolor{bgcol}{#1}& \textbf{#2} & \vspace{2.5pt}\textcolor{sectcol}{#3}
%
%	\end{tabular*}
%\vspace{-12pt}
%\textcolor{softcol}{\hrule}
%}
%----------------------------------------------------------------------------------------
%	Position of Responsibility Formatting
%----------------------------------------------------------------------------------------
\newenvironment{rSubsectiona}[4]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
{\bf #1} \hfill {#2} % Bold university and date on the right
\ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\\
{#3} \hfill {#4} % Italic Lab and location
}\smallskip
\begin{list}{$\bigcdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
	\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
\end{list}
\vspace{0.5em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
\newenvironment{rSubsectione}[0]{
	\smallskip
	\begin{list}{$\bigcdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
		}{
	\end{list}
	\vspace{0.5em} % Some space after the list of bullet points
}
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
{\bf #1} \hfill {\em #2} % Bold university and date on the right
\ifthenelse{\equal{#4}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\\
{\em #3} \hfill {\bf #4} % Italic Lab and location

}\smallskip
\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
	\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
\end{list}
\vspace{0.5em} % Some space after the list of bullet points
}
%-------------------------------------------------------------------
\newenvironment{rSubsectionb}[4]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
{\bf #1} \hfill {#2} % Bold university and date on the right
\ifthenelse{\equal{#4}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\\
{\bf #3} \hfill {\em #4} % Italic Lab and location 
}\smallskip
\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
	\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
\end{list}
\vspace{0.5em} % Some space after the list of bullet points
}
%-------------------------------------------------------------------
\newenvironment{rSubsectionc}[4]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
{\bf #1} \hfill {#2} % Bold university and date on the right
\ifthenelse{\equal{#4}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\\
{\em #3} \hfill {\em #4}
}\smallskip
\begin{list}{$\bigcdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
	\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
\end{list}
\vspace{0.5em} % Some space after the list of bullet points
}
%-------------------------------------------------------------------

%-------------------------------------------------------------------
\newenvironment{rSubsectiond}[2]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
	{#1} \hfill {#2} % Bold university and date on the right
	\ifthenelse{\equal{#1}{}}{}{ % If the third argument is not specified, don't print the job title and location line 
	}\smallskip
	\begin{list}{$\bigcdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
		}{
	\end{list}
	\vspace{0.25em} % Some space after the list of bullet points
}
%-------------
\newenvironment{rSubsectionf}[2]{ % 5 input arguments - University, Time period, Lab, Prof, Title and Location
	{#1}  % Bold university and date on the right
	\begin{list}{$\bigcdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
		}{
	\end{list}
	\vspace{0.25em} % Some space after the list of bullet points
}

%-------------------------------------------------------------------
% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section

% Sahas' custom environment
%-------------------------------------------------------------------
% 6 Input Arguments:
% 1. University Name
% 2. Location of University
% 3. Start and End Date
% 4. Degree Name
% 5. GPA
% 6. Name of the courses (optional)
\newcommand{\rEducation}[6]{
	\textbf{#1}, {#2} \hfill \textbf{#3}\\
	\textit{#4}
	\ifthenelse{\equal{#5}{}}{}{
		\hfill \textbf{GPA: #5}\hspace{-2mm}
	}
	% If the sixth argument is not specified, don't print the courses
	\ifthenelse{\equal{#6}{}}{}{
		\\\textbf{Courses:} {#6}
	}
}
%-------------------------------------------------------------------
% Takes 6 arguments:
% 1. Company Name
% 2. Location of Company (optional) - If the second argument is not specified, the location will not be printed
% 3. Start and End Date
% 4. Job Title
% 5. Project/Company Link (optional)
% 6. Link Text (optional) - If the fifth argument is specified, and the sixth argument is not specified, the link text will be "Project Link" else it will be the sixth argument
\newenvironment{rProjExpDetails}[6]{
	\ifthenelse{\equal{#2}{}}{
		\textbf{#1} \hfill \textbf{#3}\\
	}{
		\textbf{#1}, {#2} \hfill \textbf{#3}\\
	}
	\ifthenelse{\equal{#5}{}}{
		\textit{#4}\nolinebreak
	}{
		\ifthenelse{\equal{#6}{}}{
			\textit{#4} \hfill \href{#5}{Project Link}\nolinebreak
		}{
			\textit{#4} \hfill \href{#5}{#6}\nolinebreak
		}
	}
	\vspace{-1.5mm}
	\begin{itemize}[nosep, leftmargin=0em]
		}{
	\end{itemize}
}

\addbibresource{publications.bib}
\renewcommand*{\mkbibnamegiven}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}

\renewcommand*{\mkbibnamefamily}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}

\DeclareFieldFormat*{title}{ \textit{"#1"} }
