% class for typesetting an academic CV
% based on the article class and tabular environments
%
% Some class formatting from Cameron Fackler's Internoise Class: 
% https://github.com/cfackler/
%
% table-based cv taken partially from https://github.com/roycoding/fancyresume


\ProvidesClass{tabcv}[2013/06/01 Version 0.1]
\NeedsTeXFormat{LaTeX2e}

% pass through options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% we're based on the regular LaTeX article class
\LoadClass{article}

% set up page layout
\RequirePackage[top=0.5in,bmargin=0.5in,lmargin=0.75in,rmargin=1in]{geometry}

% define colors
\RequirePackage[dvipsnames,usenames]{color} % I use 'Gray' for secondary text
\definecolor{lg}{gray}{0.85} % used for hrules
\definecolor{darkBlue}{RGB}{39, 64, 139} % used in headings

% for sectioned publications
\RequirePackage{bibentry}

% to let tables break at pagebreaks
\RequirePackage{supertabular}

% Section titles with thin gray \hrule
\newcommand{\blocktitle}[1]{
\parbox{\textwidth}{
	\vspace{3mm}
	\noindent
	\parbox{0.6\linewidth}{ \begin{flushleft}
	\textcolor{darkBlue}{
	\large\bf  #1}
	\end{flushleft}
	}  \hfill
	\vspace*{-2.5mm}
	\textcolor{lg}{\hrule}
	\vspace*{1mm}
	\noindent
} }

% environment based on supertabular with \blocktitle heading
% these are the sections or divisions in the cv
% p{0.14\linewidth sets indent for cvitems. increase # to increase indent
\newenvironment{cvblock}[1]{\blocktitle{#1}\begin{supertabular}{p{0.14\linewidth}p{0.76\linewidth}}}{\end{supertabular} \\[-8pt]} 

% this is the command for 
\newcommand{\cvitem}[2]{\noindent\raggedleft{\textcolor{Gray}{#1}} & #2 \\}

%%%%%%%%% for listing references %%%%%%%%%%%%%%%
\newcommand{\pub}[1]{\bibentry{#1} \\[6pt] & }

% to separate publications by hand
\makeatletter
\newcommand{\pubsin}[2]{
	\raggedleft{\textcolor{Gray}{#1}} & \listPubs{#2} \\[-12pt]}
	
% used by \pubsin
\newcommand{\listPubs}[1]{
	\@for\tempVar:=#1\do{
	\pub{\tempVar} \vspace{-10pt}} }
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for aligning section headings
\setlength{\parindent}{0mm}
\pagestyle{empty}

