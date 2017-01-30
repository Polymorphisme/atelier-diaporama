% Un diaporama pour un atelier CLI
% Grégory Roche
% 08 avril 2016



# Introduction

## Motivations

Face à la diversité des outils et des formats de fichier,
la gestion des ateliers CLI est simplifiée par la mise en œuvre 
d'outils communs.


# Les outils

## Les langages


Les langages [\LaTeX][latex], [Markdown][pandocMarkdown] et [Wikitext][wikitext] sont très connus.

Pour créer un diaporama [Beamer][beamerUserGuide] :

- le **[langage \LaTeX][latex]** est pris en charge par **[Beamer][beamerUserGuide]**;
- le **[langage Markdown][pandocMarkdown]** est converti vers [Beamer][beamerUserGuide] via **[Pandoc][pandoc]**;
- le **[langage Wikitext][wikitext]** est converti vers [Beamer][beamerUserGuide] via **[Wiki2beamer][wiki2beamer]**.

Le format de fichier du diaporama est le PDF.


## Installation des outils[^1]


Installation du **gestionnaire de version** Git :

~~~~~~~ { .bash }
$ sudo apt-get install git
~~~~~~~


Installation du **générateur de diaporama** :

~~~~~~~ { .bash }
$ sudo apt-get install texlive-latex-base \
  texlive-lang-french latex-beamer
~~~~~~~


Installation des **outils de convertion** :

~~~~~~~ { .bash }
$ sudo apt-get install pandoc wiki2beamer
~~~~~~~


Installation d'une **visionneuse** :

~~~~~~~ { .bash }
$ sudo apt-get install evince
~~~~~~~


[^1]: \tiny Les commandes ont été testées sous [Debian][debian] 8.



# La mise en œuvre


## La création du diaporama


**Cloner le diaporama** pour prendre exemple :

~~~~~~~ { .bash }
$ git clone \
  https://github.com/Polymorphisme/atelier-diaporama
~~~~~~~


**Écrire le code source** de son diaporama :

~~~~~~~ { .bash }
$ cd atelier-diaporama
$ vim atelierTheme.md
~~~~~~~

La chaîne « *Theme* » est à remplacée par le thème de l'atelier.
On obtient ainsi un nom tel que « *atelierGpg* » ou « *atelierTmux* ».


**Générer son diaporama** :

~~~~~~~ { .bash }
$ make
~~~~~~~


## Visualiser le diaporama


Pour **visualiser le diaporama** généré :

~~~~~~~ { .bash }
$ make run
~~~~~~~

\center\includegraphics[height=5.0cm]{images/imgAteliersCliTheme-800x468.png}



# Le langage Markdown


## Les extraits de code source


La **coloration syntaxique** est aisée :

~~~~~~~ { .java }
public static void main(String... args) {
    System.out.println("Hello world!");
}
~~~~~~~


La **numérotation du code source** :

~~~~~~~ { .c .numberLines startFrom="5" }
int main(int argc, char *argv[]) {
  printf("Hello world!\n");
  return 0;
}
~~~~~~~


## Les listes

Les **énumérations** :

- pré-diagnostique;
    - observation,
    - prélévement;
-diagnostique.


Les **listes numérotées** :

1. récupérer le projet;
2. installer `pandoc`;
3. installer les dépendances;
    a. `texlive-latex-base`,
    b. `latex-beamer`.


## La mise en forme, les citations et les notes


La **mise en forme de texte** :

| Il y a 2 types de personnes :
|   ceux qui comprennent la récursivité et
|   ceux qui ne comprennent pas qu'il y a 2 types de personnes :
|     ceux qui comprennent la récursivité …


Les **citations** :

> If you learn to read, you can then read to learn.\
> If you learn to code, you can then code to learn.[^ted]

de [*Mitch Resnick*](https://en.wikipedia.org/wiki/Mitchel_Resnick).


Les **notes** se trouvent en bas de diapositive.


[^ted]: \tiny<http://www.ted.com/talks/mitch_resnick_let_s_teach_kids_to_code.html>



# Spécial \LaTeX /Beamer


## Du spécifique

Certains objets n'existent pas nativement dans le [langage Markdown][pandocMarkdown], 
il suffit donc d'utiliser le [langage \LaTeX][latex].


## Les blocs


\begin{exampleblock}{Exemple}
Le contenu d'un exemple.
\end{exampleblock}

\begin{block}{Remark}
Le contenu d'une remarque.
\end{block}

\begin{alertblock}{Alerte}
Le contenu d'un avertissement.
\end{alertblock}



## Les images

Les **images** sont supportées par le [langage Markdown][pandocMarkdown], 
mais on ne peut pas spécifier leur taille. 
Il est plus pratique d'utiliser le [langage \LaTeX][latex].

\center\includegraphics[height=5.0cm]{images/imgAteliersCli-400x400.png}


## Les mathématiques

Une égalité mathématique :

\center$\displaystyle\frac{\pi}{4}=\int_0^1 \sqrt{1-x^2}\mathrm dx$



# Les données génériques


## Les méta-données

L'auteur définit des **méta-données** dans l'en-tête du diaporama :

- le titre du diaporama;
- ses nom et prénom;
- ainsi que la date du jour.

qui apparaîtront en première de couverture.


## Les remerciements et la licence

Les **remerciements** et la **licence** apparaîtront en quatrième de couverture.

Toutes ces licences autorisent la distribution et l'adaptation du diaporama.

|Logo|Signification|
|----|-----|
|\includegraphics[width=48px]{images/imgCcBy-88x31.png}|L'auteur est cité.|
|\includegraphics[width=48px]{images/imgCcByNd-88x31.png}|Pas de modification.|
|\includegraphics[width=48px]{images/imgCcBySa-88x31.png}|Partage dans les mêmes conditions.|
|\includegraphics[width=48px]{images/imgCcByNc-88x31.png}|Pas d’utilisation commerciale.|
|\includegraphics[width=48px]{images/imgCcByNcNd-88x31.png}|Cumule les licences by, nc et nd.|
|\includegraphics[width=48px]{images/imgCcByNcSa-88x31.png}|Cumule les licences by, nc et sa.|



## Le diaporama terminé


L'**arborescence** d'un diaporama a pour forme :

~~~~~~~ { .bach }
$ tree
+-- atelierTheme.md
+-- AUTHORS
+-- beamerthemeAteliersCli.sty
+-- images
|   +-- img-256x256.png
|   +-- imgCCBy-88x31.png
+-- LICENSE
+-- Makefile
+-- README.md
~~~~~~~


## L'envoi


Pour archiver et compresser le diaporama :

~~~~~~~ { .bach }
$ ls -d atelier-theme
atelier-theme
$ tar cvzf atelier-theme.tar.gz atelier-theme
~~~~~~~

Le diaporama pourra ainsi être envoyé 
afin d'être préparer en vue de l'atelier CLI.



## Sources


* « *[Debian : The Universal Operating System][debian]* »;
* « *[Le guide de l'utilisateur de Beamer][beamerUserGuide]* »;
* « *[\LaTeX – A document preparation syste][latex]* »;
* « *[Pandoc a universal document converter][pandoc]* »;
* « *[Élaboration et conversion de documents avec Markdown et Pandoc][pandocMarkdown]* »;
* « *[Wiki2beamer][wiki2beamer]* »;
* « *[Wikitext example][wikitext]* »;
* « *[About the licenses][Cc]* ».


\begin{textblock*}{5cm}(1cm,8cm) % {block width} (coords)
\includegraphics[width=48px]{images/imgCcByNd-88x31.png}
\end{textblock*}



<!-- Les liens -->

[debian]: https://www.debian.org/ "Debian : The Universal Operating System"
[beamerUserGuide]: http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/beamer/doc/beameruserguide.pdf "Le guide de l'utilisateur de Beamer"
[latex]: https://www.latex-project.org/ "\LaTeX – A document preparation system"
[pandoc]: http://pandoc.org/ "Pandoc a universal document converter"
[pandocMarkdown]: http://enacit1.epfl.ch/markdown-pandoc/ "Élaboration et conversion de documents avec Markdown et Pandoc"
[wiki2beamer]: http://wiki2beamer.sourceforge.net/ "Wiki2beamer"
[wikitext]: https://meta.wikimedia.org/wiki/Help:Wikitext_examples "Help:Wikitext examples" 
[Cc]: http://creativecommons.org/licenses/ "About the licenses"



