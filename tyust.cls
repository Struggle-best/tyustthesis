\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tyust}[v1.0 FanChao made LaTeX Template for Graduate Thesis at Taiyuan University of Science and Technology]
\def\version{1.0}

% ----- Ctexbook ----- %
\LoadClass[zihao=-4,a4paper,UTF8,scheme=chinese,heading = true]{ctexbook}
% 
\RequirePackage[left=3cm,right=2cm,top=2.54cm,bottom=2.54cm]{geometry}
\RequirePackage{float,setspace,lipsum,zhlipsum}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 全文字体设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmainfont{Times New Roman}
\songti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 可选参数定义
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifTYUST@master\TYUST@masterfalse
\newif\ifTYUST@doctor\TYUST@doctorfalse
\newif\ifTYUST@encover\TYUST@encoverfalse
\newif\ifTYUST@declare\TYUST@declarefalse
\DeclareOption{master}{\TYUST@mastertrue}
\DeclareOption{doctor}{\TYUST@doctortrue}
\DeclareOption{encover}{\TYUST@encovertrue}
\DeclareOption{declare}{\TYUST@declaretrue}
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% XeLaTeX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifxetex}
\ifxetex\else
  \ClassError{tyust}{You should use XeLaTeX}{}
  \end{document}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页眉页脚
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\fc}{\songti\zihao{5}}
\RequirePackage{fancyhdr}
\fancypagestyle{cabstyle}{%中文摘要页眉页脚
    \fancyhf{}
    \fancyhead[CO]{\fc 摘\hspace{\ccwd}要} % 奇数页 页眉 中
    \fancyhead[CE]{\fc\TYUST@ctitle} % 偶数页 页眉 中
    \fancyfoot[C]{\fc\thepage} % 页脚 中
    % \renewcommand{\headrulewidth}{0.5pt} % 设置页眉下方横线的粗细为0.5pt
    % \renewcommand{\footrulewidth}{0pt} % 页脚上方无横线
}
\fancypagestyle{eabstyle}{%英文摘要页眉页脚
    \fancyhf{}
    \fancyhead[CO]{\fc ABSTRACT} % 奇数页 页眉 中
    \fancyhead[CE]{\fc\TYUST@ctitle} % 偶数页 页眉 中
    \fancyfoot[C]{\fc\thepage} % 页脚 中
    % \renewcommand{\headrulewidth}{0.5pt} % 设置页眉下方横线的粗细为0.5pt
    % \renewcommand{\footrulewidth}{0pt} % 页脚上方无横线
}
\fancypagestyle{mystyle}{%正文页眉页脚
    \fancyhf{}
    \fancyhead[CO]{\fc\leftmark} % 奇数页 页眉 中
    \fancyhead[CE]{\fc\TYUST@ctitle} % 偶数页 页眉 中
    \fancyfoot[C]{\fc\thepage} % 页脚 中
    % \renewcommand{\headrulewidth}{0.5pt} % 设置页眉下方横线的粗细为0.5pt
    % \renewcommand{\footrulewidth}{0pt} % 页脚上方无横线
}
\pagestyle{mystyle}
\renewcommand{\chaptermark}[1]{\@mkboth{第\chinese{chapter}\ 章  ~~#1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----- 封面固定信息 ----- %
\def\TYUST@cover@sep{：}
\def\TYUST@cover@classn{分类号}
\def\TYUST@cover@schoolc{学校代码}
\def\TYUST@cover@sclass{密级}

\def\TYUST@cover@ctitle{学位论文题目}
\def\TYUST@cover@etitle{英文题目}

\def\TYUST@cover@authors{研究生姓名}
\def\TYUST@cover@supervisor{导师姓名及职称}
\def\TYUST@cover@department{培养单位}
\def\TYUST@cover@major{学科专业}
\def\TYUST@cover@subdate{论文提交日期}
\def\TYUST@cover@reportdate{论文答辩日期}
\def\TYUST@cover@chairman{答辩委员会主席}

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
% ----- 封面固定信息 ----- %
\def\TYUST@def@term#1{%\TYUST@classn \classn{}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname TYUST@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\TYUST@def@term{classn}
\TYUST@def@term{schoolc}
\TYUST@def@term{sclass}

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
% ----- 博士英文封面固定信息 ----- %
\TYUST@def@term{etitle}
\TYUST@def@term{eauthors}
\TYUST@def@term{emajor}
\TYUST@def@term{edepartment}
\TYUST@def@term{eschool}
\TYUST@def@term{esupervisor}
\TYUST@def@term{edate}

% ----- 硕士封面中间 ----- %
% \newCJKfontfamily\bkaishu{方正楷体简体}[BoldFont=方正粗楷简体]
% \setCJKfamilyfont{zhsong}[AutoFakeBold = {5}]{SimSun}
% \newcommand{\jc}{\CJKfamily{zhsong}}
% latex 伪粗实现,只是为了和word效果相同 =,=!
\newCJKfontfamily\jc{宋体}[AutoFakeBold=4]
\newCJKfontfamily\jcc{楷体}[AutoFakeBold=.5]
\newCJKfontfamily\jccc{楷体}[AutoFakeBold=2.5]
\newcommand{\covermaster}{%
    \begin{center}
        \setstretch{3}
        \ziju{0.08}
        \vspace{.4cm}
        {\jccc\bfseries\fontsize{33}{15} \selectfont 太原科技大学硕士学位论文}
        \par
        {\jccc\bfseries\zihao{-1} （\TYUST@type）}
        \vspace{2cm}
    \end{center}%
}
% ----- 博士中文封面中间 ----- %
\newcommand{\coverdoctor}{%
    \begin{center}
        \setstretch{3}
        \ziju{0.1}
        \vspace{1.8cm}
        {\jccc\bfseries\fontsize{33}{15} \selectfont 太原科技大学博士学位论文}
        \vspace{3.4cm}
    \end{center}%
}

% ----- 博士英文封面 ----- %
\newcommand{\doctorengcover}{
\clearpage
\thispagestyle{empty}
    \vspace*{.5cm}
    \begin{center}
    {\bf \zihao{-2}Ph.D.Dissertation}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\selectfont\TYUST@etitle}\par\vspace*{.5cm}
    {\bf\zihao{-3}by}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\TYUST@eauthors}\par\vspace*{.5cm}
    {\bf\zihao{-3}in}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\TYUST@emajor}\par\vspace*{.5cm}
    {\bf\zihao{-3}in the}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\TYUST@edepartment}\par\vspace*{.5cm}
    {\bf\zihao{-3}of}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\TYUST@eschool}\par\vspace*{1cm}
    \begin{figure}[H]
        \centering
        \includegraphics[scale=.5]{cover/logo1.jpg}
    \end{figure}\vspace*{1cm}
    {\bf\zihao{-3}Supervisor}\par\vspace*{.5cm}
    {\bf\zihao{-3}Professor:} {\fontsize{13.5}{10}\TYUST@esupervisor}\par\vspace*{.5cm}
    {\fontsize{13.5}{10}\TYUST@edate}
    % \vfill
    \end{center}
\clearpage
\thispagestyle{empty}
}
% ----- 声明页 ----- %
\newcommand{\authorizationcover}{
\thispagestyle{empty}
\setstretch{1.8}
\begin{center}
    \vspace*{.5cm}
    \heiti\zihao{3}学位论文原创性声明
\end{center}
\vspace*{.8cm}
\songti\zihao{4}\hspace{2\ccwd}本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，
本论文不包含任何其他个人或集体已经发表或撰写的成果作品。对本文的研究做出重要贡献的个人和集体，均已在文中以
明确方式标明。本人完全意识到本声明的法律后果由本人承担。\par
\vspace*{1cm}
\noindent 作者签名：\hspace{11\ccwd}日\hspace{2\ccwd} 期：\hspace{3\ccwd} 年\hspace{2\ccwd} 月\hspace{2\ccwd} 日
\begin{center}
    \vspace*{.9cm}
    \heiti\zihao{3}学位论文授权使用声明
\end{center}
\vspace*{.8cm}
\hspace{2\ccwd}本人完全了解并同意遵守太原科技大学有关保存和使用学位论文的规定，即太原科技大学有权保留送交学位论文的副本，允许该论文被查阅，
可以按照学术研究公开原则和保护知识产权的原则公布该论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存、汇编本学位论文。\par
\hspace{2\ccwd}涉密及延迟公开的学位论文在解密或延迟期后适用本声明。\par
\vspace*{1cm}
\noindent 作者签名：\hspace{11\ccwd}导师签名：\hspace{11\ccwd}\par
\noindent 日\hspace{2\ccwd} 期：\hspace{2.5\ccwd} 年\hspace{1.5\ccwd} 月\hspace{1.5\ccwd} 日\hspace{1.25\ccwd}
日\hspace{2\ccwd} 期：\hspace{2.5\ccwd} 年\hspace{1.5\ccwd} 月\hspace{1.5\ccwd} 日
\clearpage
\thispagestyle{empty}
}
% \ifTYUST@doctor
% ...
% \else
% ..
% \fi
\newcommand{\as}{\songti\zihao{4}\bf}
\newcommand{\bs}{\songti\zihao{4}\bf}
\newlength{\TYUST@title@width}
\def\TYUST@put@title#1{\makebox{\hb@xt@\TYUST@title@width{#1}}}
% ----- maketitle ----- %
\renewcommand{\maketitle}{
\clearpage
\thispagestyle{empty}
\noindent
\begin{minipage}{.3\textwidth}
\vspace{-10pt}
\noindent\begin{flushleft}
\renewcommand\arraystretch{1.7}
    \bfseries\jc\zihao{5}
    \setlength{\TYUST@title@width}{5em}
    \begin{tabular}{p{\TYUST@title@width}@{~~~~}l}
        \setlength{\TYUST@title@width}{5em}\TYUST@put@title{\TYUST@cover@classn  \TYUST@cover@sep} &\setlength{\TYUST@title@width}{3em}\TYUST@put@title{\TYUST@classn}    \\
        \setlength{\TYUST@title@width}{5em}\TYUST@put@title{\TYUST@cover@schoolc \TYUST@cover@sep} &\setlength{\TYUST@title@width}{3em}\TYUST@put@title{\TYUST@schoolc}   \\
        \setlength{\TYUST@title@width}{5em}\TYUST@put@title{\TYUST@cover@sclass  \TYUST@cover@sep} &\setlength{\TYUST@title@width}{3em}\TYUST@put@title{\TYUST@sclass}   \\
    \end{tabular}
\end{flushleft}
\end{minipage}

\ifTYUST@doctor
\coverdoctor
\else
\covermaster
\fi
\setlength{\TYUST@title@width}{10em}
\begin{center}
\renewcommand\arraystretch{1.7}
    \begin{tabular}{p{\TYUST@title@width}@{~}l}
    \ifTYUST@doctor
    \TYUST@put@title{\as\TYUST@cover@ctitle        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@ctitle}        \\[4cm]
    \else
    \TYUST@put@title{\as\TYUST@cover@ctitle        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@ctitle}        \\[1cm]
    \TYUST@put@title{\as\TYUST@cover@etitle        \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@etitle}        \\[2cm]
    \fi
    \TYUST@put@title{\as\TYUST@cover@authors       \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@authors}       \\
    \TYUST@put@title{\as\TYUST@cover@supervisor    \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@supervisor}    \\
    \TYUST@put@title{\as\TYUST@cover@department    \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@department}  \\
    \TYUST@put@title{\as\TYUST@cover@major         \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@major}         \\
    \TYUST@put@title{\as\TYUST@cover@subdate       \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@subdate}       \\
    \TYUST@put@title{\as\TYUST@cover@reportdate    \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@reportdate}    \\
    \TYUST@put@title{\as\TYUST@cover@chairman      \TYUST@cover@sep} &\UnderlineRight{8cm}{1.5mm}{\bs\TYUST@chairman}      \\
    \bs
    \end{tabular}
\end{center}
\clearpage\thispagestyle{empty}\cleardoublepage

\ifTYUST@encover
\doctorengcover
\thispagestyle{empty}\cleardoublepage
\else\fi
\ifTYUST@declare
\authorizationcover
\else\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 章节设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{needspace}

\ctexset{
    punct=quanjiao,%全角式：所有标点占一个汉字宽度，相邻两个标点占1.5 汉字宽度
    % tocdepth ={subsection},
    % secnumdepth ={subsubsection},
    % contentsname={目\hspace{0.25cm} 录},
    % listfigurename={\centerline {插\hspace{0.25cm} 图}},
    % listtablename={\centerline{ 表\hspace{0.25cm} 格}},
    % bibname = {参考文献},
    chapter={%一级标题：黑体3号，段前24磅，段后18磅
        afterindent=true,
        aftername=\hskip\ccwd,
        pagestyle={mystyle},
        name = {第,章},
        number = \chinese{chapter},% \Roman  \arabic
        format = \heiti\zihao{3}\centering,
        beforeskip=-26pt,%为啥是-26,ctexbook默认50,24 = 50 - 26
        afterskip=18pt,
    },
    section={%二级标题：四号黑体,段前24 磅,段后6 磅
        break = \Needspace{.5\textheight},
        fixskip=true,
        afterindent=true,
        number =\arabic{chapter}.\arabic{section},
        numberformat=\bfseries,
        format = \heiti\zihao{-3},
        beforeskip=24pt,
        afterskip=6pt,
    },
    subsection={%三级标题 小四号黑体，段前12 磅，段后6 磅。
        afterindent=true,
        fixskip=true ,
        number =\arabic{chapter}.\arabic{section}.\arabic{subsection},
        numberformat=\bfseries,
        format = \heiti\zihao{-4},
        beforeskip   = 12pt,
        afterskip    = 6pt,
    },
    % subsubsection={
        % afterindent=true,
    %     fixskip=true ,
    %     number =\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
    %     numberformat=\bfseries,
    %     format = \heiti\zihao{-4},%\bfseries %\raggedleft
    %     beforeskip   = 0em ,
    %     afterskip    = 0em 
    % },
    % paragraph={
    %     runin=false,
    %     format = \bfseries \heiti\zihao{-4}%\bfseries %\raggedleft
    % },
    % subparagraph={
    %     fixskip=true ,
    %     indent=2\ccwd,
    %     format = \bfseries \heiti\zihao{-4}%\bfseries %\raggedleft
    % }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 中英文摘要
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\cabstractname}{摘\hspace{\ccwd}要}
\newcommand{\eabstractname}{ABSTRACT}
\newenvironment{cabstract}{
    \chapter*{\cabstractname}
    \thispagestyle{cabstyle} 
    \zihao{-4}\songti\linespread{1.55}\selectfont
}{}
\newenvironment{eabstract}{
    \chapter*{\eabstractname}
    \thispagestyle{eabstyle}
    \zihao{-4}\normalsize\linespread{1.55}\selectfont
}{\clearpage}
% \pagenumbering{arabic}
% \setcounter{page}{1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 文前，正文，文后格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \renewcommand\frontmatter{\setcounter{page}{1}}
% \renewcommand\mainmatter{\pagenumbering{arabic}\setcounter{page}{1}\@mainmatterfalse}
% \renewcommand\backmatter{\setcounter{page}{1}}

  
\endinput