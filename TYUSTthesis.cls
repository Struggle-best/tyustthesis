\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{TYUSTthesis}[v1.0 FanChao made LaTeX Template for Graduate Thesis at Taiyuan University of Science and Technology]
\def\TYUSTthesis{TYUSTthesis}
\def\version{1.0}
% ----- Ctexbook ----- %
\LoadClass[zihao=-4,a4paper,UTF8,scheme=chinese,heading = true]{ctexbook}
% 
\RequirePackage[left=3cm,right=2cm,top=2.54cm,bottom=2.54cm]{geometry}
% \setlength{\voffset}{-0.64cm}
% \setlength{\footskip}{0.34cm}
\RequirePackage{float,setspace,lipsum,zhlipsum,mwe,graphicx,
                booktabs,longtable,makecell,calc,fontawesome,
                multirow,chemfig,threeparttable}
\RequirePackage[version=4]{mhchem}
\RequirePackage[linesnumbered, ruled]{algorithm2e}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 全文设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figure/}}
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
%% 文前，正文，文后格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \renewcommand\frontmatter{\setcounter{page}{1}}
% \renewcommand\mainmatter{\pagenumbering{arabic}\setcounter{page}{1}\@mainmatterfalse}
% \renewcommand\backmatter{\setcounter{page}{1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 数学环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsthm,amssymb,amsfonts}
\newtheoremstyle{note}%
  {3pt}
  {3pt}
  {}
  {}
  {\itshape\heiti}
  {}
  {5pt}
  {}
\theoremstyle{note}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\renewcommand{\proofname}{\indent\heiti\bf 证明}
\renewcommand{\qedsymbol}{$\blacksquare$}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页眉页脚
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\fc}{\songti\zihao{5}}
\RequirePackage{fancyhdr}
\fancypagestyle{cabstyle}{%中文摘要
    \fancyhf{}
    \fancyhead[CO]{\fc 摘\hspace{\ccwd}要} % 奇数页 页眉 中
    \fancyhead[CE]{\fc\TYUST@ctitle} % 偶数页 页眉 中
    \fancyfoot[C]{\fc\thepage} % 页脚 中
    % \renewcommand{\headrulewidth}{0.5pt} % 设置页眉下方横线的粗细为0.5pt
    % \renewcommand{\footrulewidth}{0pt} % 页脚上方无横线
}
\fancypagestyle{eabstyle}{%英文摘要
    \fancyhf{}
    \fancyhead[CO]{\fc ABSTRACT} %
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{content}{%目录
    \fancyhf{}
    \fancyhead[CO]{\fc 目\hspace{\ccwd}录}
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{figcontent}{%插图清单
    \fancyhf{}
    \fancyhead[CO]{\fc 插图清单}
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{tabcontent}{%表格清单
    \fancyhf{}
    \fancyhead[CO]{\fc 表格清单} 
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{mystyle}{%正文页眉页脚
    \fancyhf{}
    \fancyhead[CO]{\fc\leftmark}
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{refbib}{%参考文献
    \fancyhf{}
    \fancyhead[CO]{\fc 参考文献} 
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{achieve}{%成果
    \fancyhf{}
    \fancyhead[CO]{\fc 攻读学位期间取得的学术成果} 
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\fancypagestyle{ack}{%致谢
    \fancyhf{}
    \fancyhead[CO]{\fc 致\hspace{\ccwd}谢} 
    \fancyhead[CE]{\fc\TYUST@ctitle}
    \fancyfoot[C]{\fc\thepage}
}
\pagestyle{mystyle}
\renewcommand{\chaptermark}[1]{\@mkboth{第\chinese{chapter}章~~#1}{}}
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
\setstretch{1}
\setlength{\parskip}{1pt}
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
        \includegraphics[scale=.5]{logo/logo1.jpg}
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
\setlength{\parskip}{1pt}
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
涉密及延迟公开的学位论文在解密或延迟期后适用本声明。\par
\vspace*{1cm}
\noindent 作者签名：\hspace{11\ccwd}导师签名：\hspace{11\ccwd}\par
\noindent 日\hspace{2\ccwd} 期：\hspace{2.5\ccwd} 年\hspace{1.5\ccwd} 月\hspace{1.5\ccwd} 日\hspace{1.25\ccwd}
日\hspace{2\ccwd} 期：\hspace{2.5\ccwd} 年\hspace{1.5\ccwd} 月\hspace{1.5\ccwd} 日
\clearpage
\thispagestyle{empty}
}
% ----- maketitle ----- %
\newcommand{\as}{\songti\zihao{4}\bf}
\newcommand{\bs}{\songti\zihao{4}\bf}
\newlength{\TYUST@title@width}
\def\TYUST@put@title#1{\makebox{\hb@xt@\TYUST@title@width{#1}}}
% --------------------- %
\renewcommand{\maketitle}{
\clearpage
\setstretch{1.2}
\setlength{\parskip}{1pt}
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
    tocdepth ={subsection},
    contentsname={目\hspace{\ccwd}录},
    listfigurename={插图清单},
    listtablename={表格清单},
    figurename={图},
    tablename={表},
    appendixname={附录},
    bibname={参考文献},
    proofname={证明},
    today=old,
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
    }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF源数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
    pdftitle={\TYUST@ctitle},
    pdfauthor={\TYUST@authors},
    pdfsubject={\TYUST@department},
    % pdfkeywords={\TYUST@ckeywords},
    pdfcreator={\TYUSTthesis - v\version},
    urlcolor=black,
	citecolor=black,
	linkcolor=black,
	hidelinks,
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 中英文摘要, 关键词
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\cabstractname}{摘\hspace{\ccwd}要}
\newcommand{\eabstractname}{ABSTRACT}
% \def\TYUST@ckeywords@separator{；}
% \def\TYUST@ekeywords@separator{; }
\newcommand{\TYUST@ckeywords@title}{关键词：}
\newcommand{\TYUST@ekeywords@title}{Key words:\enskip}

\newenvironment{cabstract}{
    \chapter*{\cabstractname}
    \thispagestyle{cabstyle} 
    \zihao{-4}\songti\linespread{1.55}\selectfont
}{}
\newenvironment{eabstract}{
    \chapter*{\eabstractname}
    \thispagestyle{eabstyle}
    \zihao{-4}\linespread{1.55}\selectfont
}{}
\newcommand\ckeywords[1]{
    \par\vspace{2ex}\noindent 
    \parbox[t]{\linewidth}{
    \linespread{1.55}\songti\zihao{-4}{\bf\TYUST@ckeywords@title} #1}
    }
\newcommand\ekeywords[1]{
    \par\vspace{2ex}\noindent 
    \parbox[t]{\linewidth}{
    \linespread{1.5}\zihao{-4}{\bf\TYUST@ekeywords@title}  #1}
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 目录及图表清单
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\renewcommand\tableofcontents{
  \chapter*{\contentsname}
  \@starttoc{toc}\normalsize}
\renewcommand\listoffigures{
  \chapter*{\listfigurename}
  \@starttoc{lof}}
\renewcommand\listoftables{%
  \chapter*{\listtablename}
  \@starttoc{lot}}
\titlecontents{chapter}[\z@]{\vspace{-5pt}\zihao{-4}\songti\thispagestyle{content}}
  {{\thecontentslabel}\hspace{1ex}}{}
  {\hspace{.5em}\titlerule*[8pt]{.}\zihao{-4}\contentspage}
\titlecontents{section}[2\ccwd]{\vspace{-8pt} \zihao{-4}\songti\thispagestyle{content}}
  {\thecontentslabel\hspace{1ex}}{}
  {\hspace{.5em}\titlerule*[8pt]{.}\zihao{-4}\contentspage}
\titlecontents{subsection}[4\ccwd]{\vspace{-8pt}\zihao{-4}\songti\thispagestyle{content}}
  {\thecontentslabel\hspace{1ex}}{}
  {\hspace{.5em}\titlerule*[8pt]{.}\zihao{-4}\contentspage}
\titlecontents{figure}[\z@]{\vspace{-8pt}\zihao{-4}\songti\thispagestyle{figcontent}}
  {\makebox[3.5em][l]{\figurename~\thecontentslabel\quad}}{}
  {\hspace{.5em}\titlerule*[8pt]{.}\zihao{-4}\songti\contentspage}
\titlecontents{table}[\z@]{\vspace{-8pt}\zihao{-4}\songti\thispagestyle{tabcontent}}
  {\makebox[3.5em][l]{\tablename~\thecontentslabel\quad}}{}
  {\hspace{.5em}\titlerule*[8pt]{.}\zihao{-4}\songti\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 图片 表格 双语名称
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{caption}
\RequirePackage[list=false]{subcaption}% 子图也加入llistoffigures list=true
\RequirePackage[list=off]{bicaption}% 第一个标题加入 listoffigures

\renewcommand {\thetable} {\thechapter{}-\arabic{table}}
\renewcommand {\thesubfigure} {\;(\alph{subfigure})}
\renewcommand {\thefigure} {\thechapter{}-\arabic{figure}}
\renewcommand {\theequation} {\thechapter{}-\arabic{equation}}

\DeclareCaptionFont{kai}{\kaishu}
\DeclareCaptionFont{minusfour}{\zihao{5}}
\captionsetup[figure]{
    labelsep=space,
    format=hang,
    font={minusfour,kai},
    skip=20pt,
    position=auto,
    % aboveskip=6pt,
    belowskip=-17pt,
}
\captionsetup[subfigure]{
    labelsep=space,
    format=hang,
    font={minusfour,kai},
    skip=10pt,
    position=auto,
}
\captionsetup[table]{
    labelsep=space,
    format=hang,
    font={minusfour,kai},
    aboveskip=6pt,
    belowskip=-10pt
    }
% \setlength{\belowcaptionskip}{-1cm}
% \captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-first]{labelsep=space,font={minusfour,kai},format=hang}
\captionsetup[figure][bi-second]{labelsep=space,name=Fig.,font={minusfour},format=hang}
\captionsetup[subfigure][bi-first]{labelsep=space,font={minusfour,kai},format=hang,labelformat=simple}
\captionsetup[subfigure][bi-second]{labelsep=space,font={minusfour},format=hang,labelformat=simple}
% \captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-first]{labelsep=space,font={minusfour,kai},format=hang}
\captionsetup[table][bi-second]{labelsep=space,name=Table,font={minusfour},format=hang}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%图 表 公式 算法 超链接
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[nameinlink]{cleveref}
\usepackage{threeparttable}
\crefname{figure}{图}{}
\crefname{table}{表}{}
\crefname{equation}{公式}{}
\crefname{algocf}{算法}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 主要符号对照表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[shortlabels]{enumitem}
\newcommand{\denotationname}{主要符号对照表}
\newenvironment{denotation}[1][2.5cm]{
\cleardoublepage
\chapter*{\denotationname}
\noindent\begin{list}{}{
    \renewcommand\makelabel[1]{##1\hfil}
    \setlength{\labelwidth}{#1}%标签盒子宽度
    \setlength{\labelsep}{0.5cm}%标签与列表文本距离
    \setlength{\itemindent}{0cm}%标签缩进量
    \setlength{\leftmargin}{\labelwidth + \labelsep}%左边界
    \setlength{\rightmargin}{0cm}
    \setlength{\parsep}{-.1cm}%段落间距
    \setlength{\itemsep}{0cm}%标签间距
    \setlength{\listparindent}{0cm}%段落缩进量
    \setlength{\topsep}{\z@}%标签与上文的间距
    \setlength{\listparindent}{0cm}
    \setlength{\baselineskip}{20pt}
}}{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 参考文献
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[numbers]{gbt7714}
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewenvironment{thebibliography}[1]{%
   \chapter*{\bibname}%
   \thispagestyle{refbib}
   \zihao{-4}\linespread{1.5}
   \addcontentsline{toc}{chapter}{\bibname}
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{-.5em}
         \setlength{\itemindent}{\z@}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 攻读学位期间取得的学术成果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\TYUST@achievement@title}{攻读学位期间取得的学术成果}
\newenvironment{achievement}[1][\TYUST@achievement@title]{%
  \clearpage\chapter*{#1}
  \addcontentsline{toc}{chapter}{攻读学位期间取得的学术成果}
  \thispagestyle{achieve}
  }{\clearpage}
\newlist{mychineselist}{enumerate}{1}
\setlist[mychineselist,1]{label=\chinese{mychineselisti}、, font=\bfseries}
% \newcommand{\achievementitem}[1]{{\zihao{-4}\sffamily{#1}}\vspace{.5em}\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 致谢
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\TYUST@ackname}{致\hspace{\ccwd} 谢}
\newenvironment{ack}{%
    \chapter*{\TYUST@ackname}
    \thispagestyle{ack}
    \addcontentsline{toc}{chapter}{致谢}
    \songti\zihao{-4}
  }{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 附录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{appendix}{
	\setcounter{equation}{0}
	\setcounter{table}{0}
	\setcounter{figure}{0}
	\setcounter{chapter}{0}
	\renewcommand {\thefigure}{\thechapter\arabic{figure}}
	\renewcommand {\theequation}{\thechapter\arabic{equation}}
	\renewcommand {\thetable} {\thechapter{}\arabic{table}}
	\ctexset{
		section={
            break = \Needspace{.5\textheight},
            fixskip=true,
            afterindent=true,
            name = {附录},
			number = \Alph{section},
            numberformat=\bfseries,
            format = \heiti\zihao{-3},
            beforeskip=12pt,
            afterskip=6pt,
		},
		subsection={
            afterindent=true,
            fixskip=true ,
			numberformat=\bfseries,
			number = \arabic{section}.\arabic{subsection},
			format = \heiti\zihao{-4},
            beforeskip   = 12pt,
            afterskip    = 6pt,
		}
	}}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (为了写说明文档的一些配置)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz,listings,tcolorbox}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{color1}{HTML}{ff7b89}
\lstset{
	frame=tb,
	aboveskip=3mm,
	belowskip=3mm,
	showstringspaces=false,
	columns=flexible,
	framerule=1pt,
	rulecolor=\color{gray!35},
	backgroundcolor=\color{gray!2},
	basicstyle={\small\ttfamily},
	numbers=none,
	% numbers=left,  
	numberstyle=\footnotesize\color{black},
	keywordstyle=\color{blue},
	commentstyle=\color{dkgreen},
	stringstyle=\color{mauve},
	breaklines=true,
	breakatwhitespace=true,
	tabsize=3,
	%firstnumber=last,   %连续编号
	commentstyle=\color{gray!50!black!50},
	emph={main,none,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,
	itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,
	PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,
	marginnote,ctex,listings},
	emphstyle={\color{frenchplum}},
	morekeywords={begin,main,DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,
		version,includegraphics,setmainfont,setsansfont,setmonofont,setCJKmainfont,setCJKsansfont,
		setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,
		logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,tableofcontents,elegantpar,
		numbers,authoryear,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,end
	},
}
\tcbuselibrary{xparse,skins}

\DeclareTotalTCBox{\myverb}{ v }{verbatim,
	on line,
	arc=0pt,colframe=black,colupper=blue,before upper={\rule[-3pt]{0pt}{12pt}},
	boxsep=1pt,left=0pt,right=0pt,top=0pt,bottom=0pt,
	boxrule=1pt,bottomrule=1pt,toprule=1pt}{#1}

% ----- 边注 ----- %
\newcommand{\customNode}[1]{%
	\tikz[baseline=(X.base)]{
		\node[rectangle, draw=none, thick, black, inner sep=-1pt] (X) {\strut #1}; % 创建节点并设置内容
		\draw[color1, thick] (X.north west) -- (X.north east); % 绘制上边框
		\draw[color1, thick] (X.south west) -- (X.south east); % 绘制下边框
	}%
}
\RequirePackage{marginnote,varwidth}
\newcommand{\leftnote}[1]{%
\reversemarginpar
\marginpar{%
    \hspace*{45pt}
    \customNode{\strut #1}
    }%
}
\newcommand{\rightnote}[1]{%
\normalmarginpar
\marginpar{%
    \hspace*{45pt}
    \customNode{\strut #1}
    }%
}
% ----- 文档结构 ----- %
\RequirePackage[edges]{forest}
\definecolor{folderbg}{RGB}{124,166,198}
\definecolor{folderbg3}{RGB}{24,206,148}
\definecolor{folderborder}{RGB}{110,144,169}
\def\foldedpaper#1{
	\tikz[scale=#1,line width={#1*1pt}]{
		\def\a{1.41} % relative height
		\def\b{0.2}  % relative height/width of corner
		\def\c{0.1}  % relative margin width (on either side)
		\def\d{0.05} % vertical offset of lines
		\def\N{6}    % number of lines
		\draw         (0,0)
		--  ++(-1,0)
		--  ++(0,\a)
		--  ++(1-\b,0)
		--  ++(\b,-\b)
		-- cycle;
		\foreach \lnum in {1,...,\N}{
			\pgfmathsetmacro\yline{\a-\d-\lnum*\a/(\N+1)}
			\draw (-1+\c,\yline) -- (-\c,\yline);
		}
		\draw[fill=white] (0,\a-\b) -- ++(-\b,0) -- ++ (0,\b);
	}
}
\newlength\Size
\setlength\Size{4pt}
\tikzset{%
	folder/.pic={%
		\filldraw [draw=folderborder, top color=folderbg!50, bottom color=folderbg] (-1.05*\Size,0.2\Size+5pt) rectangle ++(.75*\Size,-0.2\Size-5pt);
		\filldraw [draw=folderborder, top color=folderbg!50, bottom color=folderbg] (-1.15*\Size,-\Size) rectangle (1.15*\Size,\Size);
	},
	file/.pic={%
		\filldraw [draw=folderborder, top color=folderbg!5, bottom color=folderbg!10] (-\Size,.4*\Size+5pt) coordinate (a) |- (\Size,-1.2*\Size) coordinate (b) -- ++(0,1.6*\Size) coordinate (c) -- ++(-5pt,5pt) coordinate (d) -- cycle (d) |- (c) ;
	},
	file2/.pic={%
		\filldraw [draw=folderborder, top color=folderbg3!20, bottom color=folderbg3!50] (-\Size,.4*\Size+5pt) coordinate (a) |- (\Size,-1.2*\Size) coordinate (b) -- ++(0,1.6*\Size) coordinate (c) -- ++(-5pt,5pt) coordinate (d) -- cycle (d) |- (c) ;
	},
	none/.pic={%
	},
}
\forestset{%
	declare autowrapped toks={pic me}{},
	pic dir tree/.style={%
		for tree={%
			folder,
			font=\ttfamily,
			grow'=0,
		},
		before typesetting nodes={%
			for tree={%
				edge label+/.option={pic me},
			},
		},
	},
	pic me set/.code n args=2{%
		\forestset{%
			#1/.style={%
				inner xsep=2\Size,
				pic me={pic {#2}},
			}
		}
	},
	pic me set={directory}{folder},
	pic me set={file}{file},
	pic me set={file2}{file2},
	pic me set={none}{none},
}
\newcounter{question}
\setcounter{question}{0}
\newtcolorbox{mybox}[2][]{enhanced,skin=enhancedlast jigsaw,
attach boxed title to top left={xshift=-4mm,yshift=-0.5mm},
fonttitle=\bfseries\sffamily,varwidth boxed title=0.7\linewidth,
colbacktitle=blue!45!white,colframe=red!50!black,
interior style={top color=blue!10!white,bottom color=red!10!white},
boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
underlay boxed title={
\fill[blue!45!white] (title.north west) -- (title.north east)
-- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
-- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm)
-- (title.south west) -- cycle;
\fill[blue!45!white!50!black] ([yshift=-0.5mm]frame.north west)
-- +(-0.4,0) -- +(0,-0.3) -- cycle;
\fill[blue!45!white!50!black] ([yshift=-0.5mm]frame.north east)
-- +(0,-0.3) -- +(0.4,0) -- cycle; },
title={\stepcounter{question} {\heiti Question\;\thequestion.}\;\;#2},#1}
\endinput