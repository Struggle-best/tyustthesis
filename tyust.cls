\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tyust}[v1.0 FanChao made LaTeX Template for Graduate Thesis at Taiyuan University of Science and Technology]
\def\version{1.0}

% ----- Ctexbook ----- %
\LoadClass[zihao=-4,a4paper,UTF8,scheme=plain]{ctexbook}

\RequirePackage[left=3cm,right=2cm,top=2.54cm,bottom=2.54cm]{geometry}

\RequirePackage{float,setspace}
\setmainfont{Times New Roman}
% ----- 学位选项 ----- %
\newif\ifTYUST@master\TYUST@masterfalse
\newif\ifTYUST@doctor\TYUST@doctorfalse
\DeclareOption{master}{\TYUST@mastertrue}
\DeclareOption{doctor}{\TYUST@doctortrue}
\ProcessOptions\relax
% ----- 封面固定信息 ----- %
\def\TYUST@cover@sep{：}
\def\TYUST@cover@classn{分类号}
\def\TYUST@cover@schoolc{学校代码}
\def\TYUST@cover@sclass{密级}
\def\TYUST@cover@etitle{英文题目}
\def\TYUST@cover@authors{研究生姓名}
\def\TYUST@cover@major{学科专业}

\ifTYUST@doctor%博士
\def\TYUST@cover@ctitle{论文题目}
\def\TYUST@cover@id{学号}
\def\TYUST@cover@supervisor{指导教师}
\def\TYUST@cover@research{研究方向}
\def\TYUST@cover@period{学习年限}
\else%硕士
\def\TYUST@cover@ctitle{学位论文题目}
\def\TYUST@cover@supervisor{导师姓名及职称}
\def\TYUST@cover@department{培养单位}

\def\TYUST@cover@subdate{论文提交日期}
\def\TYUST@cover@reportdate{论文答辩日期}
\def\TYUST@cover@chairman{答辩委员会主席}
\fi
% ----- 固定长度带下划线 ----- %
\RequirePackage{adjustbox}
\newlength\myheight
\newcommand\Mysavedprevdepth{}%
\newcommand\UnderlineRight[3]{%
	\begin{adjustbox}{minipage=[t]{\dimexpr#1\relax},gstore totalheight=\myheight,margin=0pt}%
		\raggedright\setstretch{1.5}\leavevmode#3\par\xdef\Mysavedprevdepth{\the\prevdepth}%
	\end{adjustbox}%
	\hspace*{-\dimexpr#1\relax}%
	\begin{adjustbox}{minipage=[t][\myheight]{\dimexpr#1\relax},margin=0pt}%
		\vphantom{Eg}\lower\dimexpr#2\relax\hbox to \hsize{\leaders\hrule\hfill\kern0pt}\setstretch{1.55}\par
		\kern-\dimexpr#2\relax
		\xleaders\vbox to\baselineskip {\vfill\hbox{\lower\dimexpr#2\relax\hbox to 1.05\hsize{\leaders\hrule\hfill\kern10pt}}\kern-\dimexpr#2\relax}\vfill
		\kern\Mysavedprevdepth
	\end{adjustbox}%
}
% ----- 封面可替换信息 ----- %
\def\TYUST@def@term#1{%\TYUST@classn \classn{}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname TYUST@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\TYUST@def@term{classn}
\TYUST@def@term{schoolc}
\TYUST@def@term{sclass}
\TYUST@def@term{etitle}
\TYUST@def@term{authors}
\TYUST@def@term{major}
\TYUST@def@term{ctitle}
\TYUST@def@term{id}
\TYUST@def@term{supervisor}
\TYUST@def@term{research}
\TYUST@def@term{period}
\TYUST@def@term{department}
\TYUST@def@term{subdate}
\TYUST@def@term{reportdate}
\TYUST@def@term{chairman}
\TYUST@def@term{type}
% ----- 硕士封面中间 ----- %
\newCJKfontfamily\bkaishu{方正楷体简体}[BoldFont=方正粗楷简体]
\newCJKfontfamily\jc{楷体}[AutoFakeBold=.5]
\newCJKfontfamily\jcc{楷体}[AutoFakeBold=2.5]
\newcommand{\covermaster}{%
    \begin{center}
        \setstretch{3}
        \ziju{0.1}
        {\jcc\bfseries\fontsize{33}{15} \selectfont 太原科技大学硕士学位论文}
        \par
        {\jc\bfseries\zihao{-1} （\TYUST@type）}
    \end{center}%
}
% ----- 博士封面中间 ----- %
% \TYUST@def@term{author}

% \ifTYUST@doctor
% ...
% \else
% ..
% \fi
\newcommand{\as}{\songti\zihao{3}\bf}
\newcommand{\bs}{\songti\zihao{4}\bf}
\newlength{\TYUST@title@width}
\def\TYUST@put@title#1{\makebox{\hb@xt@\TYUST@title@width{#1}}}

\ifTYUST@doctor%博士
\renewcommand{\maketitle}{
\thispagestyle{empty}
\noindent
\begin{minipage}{.3\textwidth}
\vspace{-10pt}
\noindent\begin{flushleft}
\renewcommand\arraystretch{2}
    \songti\zihao{5}\bf
    \setlength{\TYUST@title@width}{5em}
    \begin{tabular}{p{\TYUST@title@width}@{~}l}
        \TYUST@put@title{\TYUST@cover@classn  \TYUST@cover@sep} &\TYUST@classn    \\
        \TYUST@put@title{\TYUST@cover@schoolc \TYUST@cover@sep} &\TYUST@schoolc   \\
        \TYUST@put@title{\TYUST@cover@sclass  \TYUST@cover@sep} &\TYUST@sclass    \\
    \end{tabular}
\end{flushleft}
\end{minipage}

\setlength{\TYUST@title@width}{9em}
\begin{center}
\renewcommand\arraystretch{2}
\begin{tabular}{p{\TYUST@title@width}@{~}l}
    \TYUST@put@title{\as\TYUST@cover@ctitle        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@ctitle}        \\
    \TYUST@put@title{\as\TYUST@cover@etitle        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@etitle}        \\
    \TYUST@put@title{\as\TYUST@cover@authors       \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@authors}       \\
    \TYUST@put@title{\as\TYUST@cover@id            \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@id}            \\
    \TYUST@put@title{\as\TYUST@cover@supervisor    \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@supervisor}    \\
    \TYUST@put@title{\as\TYUST@cover@major         \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@major}         \\
    \TYUST@put@title{\as\TYUST@cover@research      \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@research}      \\
    \TYUST@put@title{\as\TYUST@cover@period        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@period}        \\
    \bs
\end{tabular}
\end{center}
}
\else%硕士
\renewcommand{\maketitle}{
\thispagestyle{empty}
\noindent\begin{minipage}{.3\textwidth}
\vspace{-10pt}
\noindent\begin{flushleft}
\renewcommand\arraystretch{1.5}
    \songti\zihao{5}\bf
    \setlength{\TYUST@title@width}{5em}
    \begin{tabular}{p{\TYUST@title@width}@{~}l}
        \TYUST@put@title{\TYUST@cover@classn  \TYUST@cover@sep} &\TYUST@classn    \\[.8ex]
        \TYUST@put@title{\TYUST@cover@schoolc \TYUST@cover@sep} &\TYUST@schoolc   \\[.8ex]
        \TYUST@put@title{\TYUST@cover@sclass  \TYUST@cover@sep} &\TYUST@sclass    \\[.8ex]
    \end{tabular}
\end{flushleft}
\end{minipage}

\covermaster

\setlength{\TYUST@title@width}{12em}
\begin{center}
\renewcommand\arraystretch{2}
\begin{tabular}{p{\TYUST@title@width}@{~}l}
    \TYUST@put@title{\as\TYUST@cover@ctitle        \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@ctitle}        \\
    \TYUST@put@title{\as\TYUST@cover@etitle        \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@etitle}        \\
    \TYUST@put@title{\as\TYUST@cover@authors       \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@authors}       \\
    \TYUST@put@title{\as\TYUST@cover@supervisor    \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@supervisor}    \\
    \TYUST@put@title{\as\TYUST@cover@department    \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@department}    \\
    \TYUST@put@title{\as\TYUST@cover@major         \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@major}         \\
    \TYUST@put@title{\as\TYUST@cover@subdate       \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@subdate}       \\
    \TYUST@put@title{\as\TYUST@cover@reportdate    \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@reportdate}    \\
    \TYUST@put@title{\as\TYUST@cover@chairman      \TYUST@cover@sep} &\UnderlineRight{7cm}{1.5mm}{\bs\TYUST@chairman}      \\
    \bs
\end{tabular}
\end{center}}
\fi

% \LoadClass[heading=true,zihao=-4,sub3section,scheme = chinese,openany]{ctexbook}

\endinput