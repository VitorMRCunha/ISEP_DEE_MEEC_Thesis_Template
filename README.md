# ISEP DEE MEEC LaTeX Thesis Template

**Português** | [English](README.en.md)

Este repositório é a fonte do *template* LaTeX para dissertações do Mestrado em Engenharia Eletrotécnica e de Computadores (MEEC) do Instituto Superior de Engenharia do Porto (ISEP).

> **Versão atualmente em desenvolvimento:** v2.0 — primeira versão formalmente publicada através do GitHub.

[![Licença: LPPL 1.3c](https://img.shields.io/badge/Licen%C3%A7a-LPPL%201.3c-blue.svg)](LICENSE)
[![Versão](https://img.shields.io/badge/vers%C3%A3o-v2.0--dev-orange.svg)](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases)

## Visão geral

O *ISEP DEE MEEC Thesis Template* disponibiliza uma estrutura LaTeX pronta a utilizar para dissertações do MEEC, incluindo formatação institucional, criação automática das capas e preâmbulos, metadados da dissertação, gestão da bibliografia, glossários, listas de acrónimos e símbolos e declarações de integridade académica.

O projeto teve origem em 2021 como uma adaptação do template *Masters/Doctoral Thesis* da LaTeXTemplates disponível nessa altura. Desde então, o *template* tem sido objeto de desenvolvimento independente, reformulação, adaptação institucional e manutenção extensivos por Vítor M. R. Cunha.

## Principais funcionalidades

- Português ou inglês como língua principal do documento.
- Seleção da especialização do MEEC através das opções da classe.
- Geração automática das capas e preâmbulos formais/institucionais.
- Centralização dos metadados da dissertação.
- Validação dos metadados obrigatórios.
- Modos de documento *draft* e final.
- Geração automática da declaração de integridade académica.
- Gestão da bibliografia através de BibLaTeX/Biber.

## Estrutura do *template*

O ficheiro ZIP do *template* tem a seguinte estrutura:

```text
ISEP_DEE_MEEC_Thesis_Template_vX.Y/
├── main.tex
├── preamble.tex
├── sampleRefs.bib
├── DEEclass.cls
├── chapters/
├── front/
├── figures/
├── examples/
├── README.md
├── README.en.md
└── LICENSE
```

O repositório GitHub contém adicionalmente ficheiros destinados à manutenção do projeto, documentação, fluxos de integração e publicação automática e histórico de desenvolvimento. Estes ficheiros não são necessários no pacote distribuído aos estudantes.

## Início rápido

### Overleaf ou outros editores *online*

Pode iniciar um projeto através de um dos seguintes métodos:

**Opção A — Importar a partir do GitHub**
1. Faça um *fork* do [repositório ISEP DEE MEEC Thesis Template](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template) para a sua conta GitHub.
2. Crie um novo projeto no editor LaTeX online importando o repositório GitHub resultante do *fork*.
3. Defina `main.tex` como documento principal caso a plataforma não o detecte automaticamente.
4. Compile o projeto.
5. Compare o documento gerado com o PDF de referência correspondente, disponível na pasta `examples/` (PT ou EN), para confirmar que o template está a ser corretamente processado e apresentado.
6. Leia o documento gerado antes de substituir o conteúdo de exemplo. Este contém regras, orientações e exemplos LaTeX para a preparação da dissertação.
7. Edite os metadados e substitua o conteúdo de exemplo pelo conteúdo da sua dissertação.

**Opção B — Carregar o ZIP de uma versão publicada**
1. Descarregue o ficheiro `ISEP_DEE_MEEC_Thesis_Template_vX.Y.zip` mais recente a partir da página de [Releases do GitHub](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases).
2. Crie um novo projeto carregando o ficheiro ZIP para a plataforma *online*.
3. Siga os passos 3–7 acima.

**O repositório GitHub é a fonte oficial de distribuição do *template***. O Overleaf continua a ser suportado mas apenas como ambiente de edição e compilação.

### Instalação local do LaTeX

1. Instale uma distribuição TeX atual, por exemplo:
   - Windows: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/);
   - macOS: [MacTeX](https://www.tug.org/mactex/) ou [MiKTeX](https://miktex.org/);
   - Linux: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/).

   Depois, utilize um editor LaTeX como o TeXstudio, TeXmaker ou VS Code com uma extensão para LaTeX.

2. Descarregue o ficheiro `ISEP_DEE_MEEC_Thesis_Template_vX.Y.zip` mais recente a partir da página de [Releases do GitHub](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/releases).
3. Descomprima o ficheiro, preservando a estrutura de ficheiros e diretórios.
4. Abra `main.tex` e utilize o processo de compilação normal do editor. O *template* utiliza BibLaTeX/Biber e ferramentas para geração de glossários, pelo que estas deverão estar disponíveis na distribuição TeX instalada.
5. Compare o documento gerado com o PDF de referência correspondente, disponível na pasta `examples/` (PT ou EN), para confirmar que o *template* está a ser corretamente processado e apresentado.
6. Leia o documento gerado antes de substituir o conteúdo de exemplo. Este contém regras, orientações e exemplos LaTeX para a preparação da dissertação.
7. Edite os metadados e substitua o conteúdo de exemplo pelo conteúdo da sua dissertação.

### Leia o PDF gerado pelo *template*

O PDF produzido através da compilação do *template* inalterado não é apenas um documento de exemplo. Constitui também parte da documentação e deverá ser lido antes de iniciar a preparação da dissertação.

O documento de exemplo contém regras, recomendações e orientações práticas para a preparação de uma dissertação do MEEC, juntamente com exemplos do código LaTeX. Estes exemplos ilustram a utilização correta de elementos comuns do documento e das funcionalidades disponibilizadas pelo *template*.

Os estudantes deverão, por isso, compilar o *template* e consultar o PDF gerado antes de eliminar ou substituir os capítulos de exemplo. O documento gerado e o respetivo código LaTeX foram concebidos para ser utilizados em conjunto:

- o PDF apresenta regras, recomendações e exemplos da apresentação esperada;
- os ficheiros `.tex` fornecem exemplos práticos de LaTeX que implementam esses elementos.

Pode ser útil conservar uma cópia inalterada da versão original do *template* para consulta posterior.

## Configuração e utilização

Considere os seguintes ficheiros e diretórios:

- `main.tex` — configuração do documento, metadados e estrutura do documento;
- `preamble.tex` — pacotes adicionais e comandos personalizados definidos pelo utilizador, quando necessário;
- `sampleRefs.bib` — base de dados bibliográfica de exemplo, que pode ser renomeada ou substituída;
- `front/` — conteúdo dos preâmbulos;
- `chapters/` — capítulos e apêndices da dissertação em ficheiros `.tex` independentes;
- `figures/` — figuras e outros elementos gráficos.

## Versionamento

A **v2.0** é a primeira versão formalmente publicada através do GitHub. A designação v2 reflete a transição do período de desenvolvimento baseado no Overleaf, entre 2021 e 2026, para um projeto de *software* com versionamento formal, documentação, validação automática e pacotes de distribuição.

Consulte o [CHANGELOG.md](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/CHANGELOG.md).

## Reportar problemas

Antes de abrir um *issue*:

1. confirme que o problema ocorre com a versão mais recente publicada;
2. efetue uma compilação limpa do projeto;
3. confirme que o Biber e as ferramentas necessárias para os glossários estão instalados;
4. confirme que todos os metadados obrigatórios estão definidos;
5. reduza, sempre que possível, o problema a um exemplo mínimo reproduzível.

Um relatório de problema útil deverá incluir a versão do *template*, o sistema operativo, a distribuição e versão de TeX, o editor ou comando de compilação utilizado, a parte relevante do ficheiro de *log* e o menor conjunto possível de ficheiros necessário para reproduzir o problema.

## Citação

Os metadados para citação do projeto encontram-se no ficheiro [CITATION.cff](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/CITATION.cff). Poderá ser adicionado um DOI a versões futuras caso o projeto seja arquivado através de um serviço como o Zenodo.

## Licença e proveniência

O *software* do *template* é distribuído ao abrigo da **LaTeX Project Public License (LPPL), versão 1.3c ou posterior**, salvo indicação em contrário num ficheiro específico.

O projeto tem o estado de manutenção `maintained` segundo a LPPL, sendo **Vítor M. R. Cunha** o *Current Maintainer*.

Consulte o ficheiro [LICENSE](LICENSE) para informação sobre a licença e o [NOTICE.md](https://github.com/VitorMRCunha/ISEP_DEE_MEEC_Thesis_Template/blob/main/NOTICE.md) para informação sobre a proveniência e atribuição.

As dissertações e outros trabalhos originais criados utilizando este *template* não ficam automaticamente sujeitos à licença do *template*.

## Aviso

Este repositório é disponibilizado sem qualquer garantia. Os nomes institucionais, logótipos, marcas e elementos de identidade visual permanecem sujeitos aos direitos e políticas dos respetivos titulares. A publicação deste repositório não implica, por si só, reconhecimento ou aprovação oficial por parte da instituição, salvo se tal for explicitamente indicado.
