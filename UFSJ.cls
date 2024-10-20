% -----------------------------------------------------------------------------
%                    Universidade Federal de São João del-Rei - UFSJ
% -----------------------------------------------------------------------------
%
%                       Declaração da classe 'ufsj_dctef'
%               Extensão das classes 'memoir' e 'abntex2'
%
%                Projeto hospedado em: https://github.com/gbrielcsta
%                      Autor: Gabriel Victor Costa Pereira
% 
%
% -----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UFSJ}[2024/10/20 v2.0]

% Define a opção 'NomeCapitulo' para exibir a palavra "Capítulo" no início
\providecommand{\flagNomeCapitulo}{false}
\DeclareOption{mostrarNomeCapitulo}{
    \renewcommand{\flagNomeCapitulo}{true}
}

% Transfere as opções para a classe 'abntex2'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{
    12pt, chapter=TITLE, section=TITLE, 
    openright, a4paper, 
    sumario=tradicional, brazil
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% -----------------------------------------------------------------------------
%                               Pacotes Utilizados
% -----------------------------------------------------------------------------
% Abaixo estão os pacotes essenciais para o funcionamento do documento.
% Cada pacote adiciona funcionalidades específicas necessárias para
% diferentes aspectos da formatação, citações, algoritmos e referências.
% -----------------------------------------------------------------------------

% Pacote para criar links clicáveis no documento
\RequirePackage{hyperref}

% Controle da numeração de capítulos, seções, etc.
\RequirePackage{chngcntr}

% Ferramentas adicionais de manipulação de macros
\RequirePackage{etoolbox}

% Inclusão de PDFs externos no documento
\RequirePackage{pdfpages}

% Configurações para referências cruzadas com links para páginas, em português
\RequirePackage[brazilian, hyperpageref]{backref}

% Criação de algoritmos com formatação específica e regras em português
\RequirePackage[portuguese, onelanguage, algoruled]{algorithm2e}

% Suporte para cores no documento
\RequirePackage{color}

% Configuração de citações no estilo ABNT com opções personalizadas
\RequirePackage[
    alf,                        % Formato alfabético para as referências
    abnt-emphasize=bf,           % Ênfase em negrito nas citações
    bibjustif,                   % Justificação do texto nas referências
    recuo=0cm,                   % Recuo de citações com zero centímetros
    abnt-doi=expand,             % Expansão do DOI nas referências
    abnt-url-package=hyperref,   % Uso do pacote 'hyperref' para URLs
    abnt-refinfo=yes,            % Informações completas nas referências
    abnt-etal-cite=3,            % Usa "et al." para mais de 3 autores nas citações
    abnt-etal-list=3,            % Limita a lista de autores a 3 no máximo
    abnt-thesis-year=final       % Exibe o ano de tese na posição final
]{abntex2cite}

% -----------------------------------------------------------------------------
%                         Configurações Gerais do Documento
% -----------------------------------------------------------------------------

% Definição das cores para links no documento
\definecolor{blue_link}{RGB}{0,0,0}

% Configurações dos links no PDF (pacote 'hyperref')
\hypersetup{
    portuguese,
    colorlinks=true,       % Links coloridos (false: links com caixa ao redor)
    linkcolor=black,       % Cor dos links internos
    citecolor=black,       % Cor dos links para citações
    filecolor=black,       % Cor dos links para arquivos
    urlcolor=black,        % Cor dos links de URLs
    breaklinks=true,       % Permite quebra de links longos
}

% Criação do índice remissivo
\makeindex

% Remoção do espaço extra entre frases (padrão francês)
\frenchspacing

% Remove o texto padrão antes dos números de página no backref
\renewcommand{\backref}{}

% Configuração para numeração sequencial de equações (independente de capítulos)
\counterwithout{equation}{chapter}

% Adiciona um espaço extra após as equações
\AtEndEnvironment{equation}{
    \vspace{8pt}
}

% Ajuste da largura do campo de numeração de páginas no sumário (TOC)
% Aumentado para evitar "overfull \hbox" (padrão é 1.55em na classe 'memoir')
\renewcommand\@pnumwidth{1.8em}

% Aumenta o espaço de assinatura em documentos baseados na classe 'abntex2'
% (padrão definido como 8cm, aqui expandido para 10cm)
\setlength{\ABNTEXsignwidth}{10cm}

% Configura os floats (elementos flutuantes) para serem posicionados no topo de páginas vazias
% Referência: https://github.com/abntex/abntex2/issues/170
\setlength{\@fptop}{5pt}

% Posiciona os floats sempre acima do rodapé
\feetbelowfloat

% Definição personalizada do comando \autoref para equações
\def\equationautorefname~#1\null{Equa\c c\~ao~(#1)\null}

% Comando para garantir que os rodapés sejam posicionados no final da página
\newcommand{\bottomfootnote}{
    \renewcommand\footnoterule{
        \vspace*{\fill}
        \kern-3\p@
        \hrule
        \kern2.6\p@
    }
}

% Comandos a serem executados ao final do preâmbulo
\AfterPreamble{
    % Configura rodapés para aparecerem no final da página
    \bottomfootnote
    % Permite o uso de múltiplas subfiguras dentro de uma única figura
    \providecommand\subfigureautorefname{\figureautorefname}
    \newsubfloat{figure}
    % Metadados do PDF (pacote 'hyperref')
    \hypersetup{
        pdftitle={\@title},     % Define o título do PDF
        pdfauthor={\@author}    % Define o autor do PDF
    }
}

% -----------------------------------------------------------------------------
%                          Configurações de Parágrafos
% -----------------------------------------------------------------------------

% Define o recuo do início dos parágrafos
\setlength{\parindent}{1.25cm}

% Define o espaçamento entre parágrafos
\setlength{\parskip}{0.0cm}

% -----------------------------------------------------------------------------
%                              Configurações de Fontes
% -----------------------------------------------------------------------------

% Redefine o tamanho e estilo da fonte para capítulos e seções (classe 'abntex2')

% Fonte para capítulos
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\Large} % Alterar para \Huge, se necessário

% Fonte para partes
\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

% Fonte para seções
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize} % Pode ser ajustado para \Large

% Fonte para subseções
\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

% Fonte para subsubseções
\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

% Fonte para subsubsubseções
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% Redefine tamanho de fonte para legendas de figuras e subfiguras (classe 'memoir')
\captiontitlefont{\small}
\captionnamefont{\small}
\subcaptionsize{\small}
\subcaptionlabelfont{\small}
\subcaptionfont{\small}

% -----------------------------------------------------------------------------
%                        Definição de Novos Comandos
% -----------------------------------------------------------------------------

% Define o comando para inserir o nome do programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Define o comando para inserir o subtítulo do trabalho
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Define o comando para inserir a instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Define o comando para inserir a instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Define o comando para inserir o tipo de projeto (tese, dissertação, etc.)
\providecommand{\imprimirprojeto}{}
\newcommand{\projeto}[1]{\renewcommand{\imprimirprojeto}{#1}}

% Define o comando para inserir o título acadêmico (Doutor, Mestre, etc.)
\providecommand{\imprimirtituloAcademico}{}
\newcommand{\tituloAcademico}[1]{\renewcommand{\imprimirtituloAcademico}{#1}}

% Define o comando para inserir a área de concentração
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Define o comando para inserir a linha de pesquisa
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Define o comando para inserir a logomarca da instituição
\providecommand{\imprimirlogoinstituicao}{}
\newcommand{\logoinstituicao}[2]{\renewcommand{\imprimirlogoinstituicao}{%
    \includegraphics[height={#1}]{#2}}}

% Comando para imprimir a lista de figuras
\newcommand{\imprimirlistafiguras}{%
    \pdfbookmark[0]{\listfigurename}{lof}
    \listoffigures*
    \cleardoublepage
}

% Comando para imprimir a lista de tabelas
\newcommand{\imprimirlistatabelas}{%
    \pdfbookmark[0]{\listtablename}{lot}
    \listoftables*
    \cleardoublepage
}

% Comando para imprimir a lista de quadros
\newcommand{\imprimirlistaquadros}{%
    \pdfbookmark[0]{\listofquadrosname}{loq}
    \listofquadros*
    \cleardoublepage
}

% Comando para imprimir a lista de algoritmos
\newcommand{\imprimirlistaalgoritmos}{%
    \newcommand{\algoritmoname}{Algoritmo}
    \renewcommand{\listalgorithmcfname}{Lista de Algoritmos}

    \newlistof{listofalgoritmos}{loa}{\listalgoritmoname}
    \newlistentry{algocf}{loa}{0}

    \counterwithout{algocf}{chapter}
    \renewcommand{\cftalgocfname}{\algoritmoname\space}
    \renewcommand*{\cftalgocfaftersnum}{\hfill\textendash\hfill}

    \pdfbookmark[0]{\listalgorithmcfname}{loa}
    \listofalgorithms
    \cleardoublepage
}

% Comando para imprimir o sumário
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}
    \tableofcontents*
    \cleardoublepage
}

% Comando para imprimir as referências bibliográficas
\newcommand{\imprimirreferencias}[1]{%
    % Carrega o arquivo de bibliografia especificado
    \bibliography{#1}{}
    % Estilo de citação ABNT
    \bibliographystyle{abntex2-alf}
}

% -----------------------------------------------------------------------------
% Estilo de página para elementos pré-textuais
% -----------------------------------------------------------------------------
% Define o estilo de página para as seções antes do texto principal.
% Segundo a NBR 14724/2011 da ABNT, essas páginas devem ser contadas, mas não numeradas.
\renewcommand{\pretextual}{%
    \pagestyle{empty}  % Não exibe numeração nas páginas pré-textuais
    \aliaspagestyle{chapter}{empty}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% -----------------------------------------------------------------------------
% Estilo de página para elementos textuais
% -----------------------------------------------------------------------------
% Define o estilo das páginas para o corpo principal do trabalho.
\renewcommand{\textual}{%
    % Define o estilo dos capítulos com base no valor da flag 'flagnomecapitulo'.
    \ifthenelse{\equal{\flagNomeCapitulo}{true}}{%
        \chapterstyle{default}  % Usa o estilo padrão para os capítulos
    }{%
        \chapterstyle{abnt}  % Usa o estilo ABNT para os capítulos
    }
    \setlength{\beforechapskip}{-30pt}  % Remove o espaço antes dos títulos dos capítulos
    \pagestyle{abntheadings}  % Define o cabeçalho conforme padrão ABNT
    \aliaspagestyle{chapter}{abntchapfirst}
    \nouppercaseheads  % Mantém o estilo das cabeçalhos sem maiúsculas
    \bookmarksetup{startatroot}  % Define os marcadores de navegação no sumário
}

% -----------------------------------------------------------------------------
% Estilo de página para elementos pós-textuais
% -----------------------------------------------------------------------------
% Define o estilo das páginas após o texto principal.
\renewcommand{\postextual}{%
    \pagestyle{abntheadings}  % Continua com o estilo ABNT no pós-textual
}

% -----------------------------------------------------------------------------
% Personalização de objetos flutuantes (ex. Figuras, Tabelas)
% -----------------------------------------------------------------------------
% Personaliza a fonte usada para a legenda "Fonte:" nas figuras e tabelas.
\renewcommand{\fonte}[1]{%
    \vspace{4pt}\break%
    \centering\footnotesize{Fonte: #1}
}

% -----------------------------------------------------------------------------
% Sumário
% -----------------------------------------------------------------------------
% Ajusta a formatação do sumário, como a inclusão de travessões para apêndices e anexos.
\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}  % Insere travessão entre capítulo e número de página

% Configura o estilo de formatação da seção 'part' no sumário.
\renewcommand{\cftpartfont}{\bfseries\large}  % Define a fonte das 'partes' em negrito e tamanho grande
\renewcommand{\cftpartpagefont}{\normalfont\cftchapterfont}  % Define a fonte da página correspondente a 'partes'

% Define um espaço extra entre os itens de diferentes capítulos no sumário.
\setlength{\cftbeforechapterskip}{2.0ex}

% -----------------------------------------------------------------------------
% Tradução de termos e títulos
% -----------------------------------------------------------------------------
% Traduz diversos termos para o português, como "Lista de Abreviaturas" e "Sumário".
\addto\captionsbrazil{%
    \renewcommand{\listadesiglasname}{LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{LISTA DE SÍMBOLOS}
    \renewcommand{\contentsname}{SUMÁRIO}
    \renewcommand{\bibname}{REFERÊNCIAS}
    \renewcommand{\listfigurename}{LISTA DE ILUSTRAÇÕES}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    \renewcommand{\indexname}{ÍNDICE REMISSIVO}
    \renewcommand{\pageautorefname}{página}
    \renewcommand{\sectionautorefname}{Seção}
    \renewcommand{\subsectionautorefname}{Subseção}
    \renewcommand{\subsubsectionautorefname}{Subsubseção}
    \renewcommand{\resumoname}{RESUMO}
    \renewcommand{\abstractname}{ABSTRACT}
    \renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
    \renewcommand*{\backrefalt}[4]{%
        \ifcase #1
            Nenhuma citação no texto.
        \or
            Citado na página #2.
        \else
            Citado #1 vezes nas páginas #2.
        \fi
    }   
}

% -----------------------------------------------------------------------------
% Listas de quadros e outros elementos
% -----------------------------------------------------------------------------
% Cria uma lista personalizada de quadros (semelhante a listas de figuras e tabelas).
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}

% -----------------------------------------------------------------------------
% Lista de abreviaturas e siglas
% -----------------------------------------------------------------------------
% Personaliza a formatação da lista de abreviaturas/siglas e símbolos.
\renewenvironment{siglas}{%
    \pretextualchapter{\listadesiglasname}
    \begin{symbols}
    \setSpacing{0.0}  % Remove o espaçamento entre os itens da lista
}{%
    \end{symbols}
    \cleardoublepage
}

% Lista de símbolos
% Formatação similar à lista de abreviaturas.
\renewenvironment{simbolos}{%
    \pretextualchapter{\listadesimbolosname}
    \begin{symbols}
    \setSpacing{0.0}
}{%
    \end{symbols}
    \cleardoublepage
}

% -----------------------------------------------------------------------------
% Capa
% -----------------------------------------------------------------------------
% Configura a estrutura da capa do documento.
\renewcommand{\imprimircapa}{%
    \begin{capa}
        % Imprime logo, instituição e o nome do programa
        \begin{center}
            \imprimirlogoinstituicao{} \\
            \normalfont\scshape{\imprimirinstituicao} \\
            \normalfont\scshape{\imprimirprograma} \\
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{2}}

        % Imprime o título do trabalho
        \begin{center}
            \ABNTEXchapterfont\LARGE\scshape\SingleSpacing{%
                \imprimirtitulo%
                \abntex@ifnotempty{\imprimirsubtitulo}{%
                    {:\\}{\Large\imprimirsubtitulo}}%
            }
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime o nome do autor
        \begin{center}
            \normalfont\large\scshape\textbf\imprimirautor
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime os orientadores
        \begin{center}
            \abntex@ifnotempty{\imprimirorientador}{%
                \small\imprimirorientadorRotulo~\imprimirorientador \\
                \small\imprimirinstOrientador \\
            }
            \abntex@ifnotempty{\imprimircoorientador}{%
                \begin{SingleSpacing}\par\end{SingleSpacing}
                \small\imprimircoorientadorRotulo~\imprimircoorientador \\
                \small\imprimirinstCoorientador
            }
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime local e data
        \begin{center}
            \normalfont{\imprimirlocal}\\
            \normalfont{\imprimirdata}
        \end{center}

    \end{capa}
}


% -----------------------------------------------------------------------------
% Folha de rosto
% -----------------------------------------------------------------------------
% Estrutura a folha de rosto com autor, título, orientador e informações institucionais.
\renewcommand{\folhaderostocontent}{%
    \begin{center}
        \normalfont\large\scshape\textbf\imprimirautor
    \end{center}

    \vspace*{\stretch{2}}

    \begin{center}
        \ABNTEXchapterfont\LARGE\scshape\SingleSpacing{\imprimirtitulo}
    \end{center}

    \vspace*{\stretch{0.5}}

    \abntex@ifnotempty{\imprimirpreambulo}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \imprimirpreambulo
            \end{minipage}
        \end{SingleSpacing}
    }

    \abntex@ifnotempty{\imprimirareaconcentracao}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \imprimirareaconcentracaoRotulo~\imprimirareaconcentracao
            \end{minipage}
        \end{SingleSpacing}
    }

    \abntex@ifnotempty{\imprimirlinhapesquisa}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \imprimirlinhapesquisaRotulo~\imprimirlinhapesquisa
            \end{minipage}
        \end{SingleSpacing}
    }

% Exibe o nome do orientador, caso esteja disponível
\abntex@ifnotempty{\imprimirorientador}{%
    \begin{SingleSpacing}
        \hspace{.3\textwidth}
        \begin{minipage}{.6\textwidth}
            \hyphenpenalty=10000\hbadness=10000%
            \imprimirorientadorRotulo~\imprimirorientador \\
            \imprimirinstOrientador
        \end{minipage}
    \end{SingleSpacing}
}

% Exibe o nome do coorientador, se houver
\abntex@ifnotempty{\imprimircoorientador}{%
    \begin{SingleSpacing}
        \hspace{.3\textwidth}
        \begin{minipage}{.6\textwidth}
            \hyphenpenalty=10000\hbadness=10000%
            \imprimircoorientadorRotulo~\imprimircoorientador \\
            \imprimirinstCoorientador
        \end{minipage}
    \end{SingleSpacing}
}

% Insere um espaçamento vertical
\vspace*{\stretch{1}}

% Apresenta a instituição, o nome do programa, e a localidade e data
\begin{center}
    %\normalfont\scshape{\imprimirinstituicao}\\
    %\normalfont\scshape{\imprimirprograma}\\
    \normalfont{\imprimirlocal}\\
    \normalfont{\imprimirdata}
\end{center}
}

% -----------------------------------------------------------------------------
% Folha de aprovação
% -----------------------------------------------------------------------------
\newcommand{\importarfolhadeaprovacao}[1]{%
    \begin{folhadeaprovacao}
        \IfFileExists{#1}{\includepdf[pages=last-last]{#1}}{%
            \vspace*{\fill}
            \begin{adjustwidth}{2cm}{2cm}%
                \begin{center}
                    Insira o arquivo \textbf{\detokenize{#1}}, fornecido pela
                    instituição, no mesmo diretório do trabalho.
                    Assim, a folha de aprovação será automaticamente
                    adicionada aqui.
                \end{center}
            \end{adjustwidth}
        }
    \end{folhadeaprovacao}
}

% -----------------------------------------------------------------------------
% Ficha catalográfica
% -----------------------------------------------------------------------------
\newcommand{\importarfichacatalografica}[1]{%
    \begin{fichacatalografica}
        \IfFileExists{#1}{\includepdf[pages=last-last]{#1}}{%
            \vspace*{\fill}
            \begin{adjustwidth}{2cm}{2cm}%
                \begin{center}
                    Coloque o arquivo \textbf{\detokenize{#1}}, fornecido pela
                    instituição, no diretório do trabalho.
                    Desta forma, a ficha catalográfica será automaticamente
                    inserida aqui.
                \end{center}
            \end{adjustwidth}
        }
    \end{fichacatalografica}
}

% -----------------------------------------------------------------------------
% Dedicatória
% -----------------------------------------------------------------------------
\renewenvironment{dedicatoria}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% -----------------------------------------------------------------------------
% Epígrafe
% -----------------------------------------------------------------------------
\renewenvironment{epigrafe}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% -----------------------------------------------------------------------------
% Resumo
% -----------------------------------------------------------------------------
% (redefinições da classe 'abntex2')
\renewenvironment{resumo}[1][\resumoname]{%
    \PRIVATEbookmarkthis{#1}
    \renewcommand{\abstractnamefont}{\chaptitlefont}
    \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
    \begin{abstract}
    \vspace{23pt} % <-- Espaço adicional para uniformizar com capítulos
}{%
    \end{abstract}\PRIVATEclearpageifneeded
}

