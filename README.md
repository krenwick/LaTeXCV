LaTeXCV
=======

A LaTeX class for making an academic CV, based on tables and the article class.

I have put several macros, that I use for making my own CV or résumé, into a LaTeX class.  I have taken several pieces from [Nicolas Favre-Félix's](https://github.com/nicolasff) CV template referenced [here](https://github.com/roycoding/fancyresume), some from Eric Dieckman's [article-class-based CV](http://ericdieckman.com/), and from Cameron Fackler's [Internoise class](https://github.com/cfackler/internoise2012-latex).  There is no license since I've mostly put together freely available pieces from forum threads and elsewhere on the internet.

I've included one version of my own CV as an example.

Please contact me with comments, questions, or criticism.

Usage
-----

Start with 

```
\documentclass{tabcv}
```

This is based on the article class, so you should be able to pass options, like font or paper size, as you would to the article class.  In the example, I have made my own title (name, information) by hand using the [Lettrine package](http://www.ctan.org/tex-archive/macros/latex/contrib/lettrine/), but I haven't found a good way to automate it.  So...you're unfortunately on your own with the title.

### Sections

Most CV are broken into sections or blocks, such as "Education" or "Experience."  Each section will be a table with a heading in order to align and separate information .  It's actually the supertabular environment to break tables across pages.  Sections are wrapped in the cvblock macro.  To make our Education section, we'll use

```
\begin{cvblock}{Education}
    ...
\end{cvblock}
```

The second argument is the name of the section, which is right-aligned in the first column.  The text is also boldface and blue, with a thin, gray, rule spanning the page.

### Items and Entries

Within each section, we often have items.  For instance, in the Education section/block, we may have an entry for each degree.  We also tend to have primary information--like degree, university, etc.--and secondary information, often dates.  A typical entry, using the `cvitem` macro will look like this:

```
\begin{cvblock}{Education}
    \cvitem{ 2012 }{ \textbf{Ph.D.}, University of Foo }
    \cvitem{ 2008 }{ \textbf{B.S.}, University of Bar }
\end{cvblock}
```

Everything is split and aligned around a small column.  The first argument is right-aligned in the smaller left column in gray, and the second argument is left-aligned in the larger right column in black.  It is not always necessary to have the discriptive first argument.  For instance, you may want to add some kind of description to an entry, in which case you can leave the first argument empty.  For example, 

```
\begin{cvblock}{Education}
    \cvitem{ 2012 }{ \textbf{Ph.D.}, University of Foo }
    \cvitem{}{Description of projects and dissertation work, blahblahblah...}
    \\
    \cvitem{ 2008 }{ \textbf{B.S.}, University of Bar }
\end{cvblock}
```

As in this example, you may need to use `\\` and `\vspace{}` to achieve the vertical spacing you want.  Although supertabular can break tables across pages, you may need to use `\clearpage` to force it in some places.  Occaisionally, the title of a cvblock will remain at the bottom of a page, and the contents of the section will flow to the next page or even skip a page.  The quick and dirty solution is to just force the entire section onto the next page.

### Publications

Publication lists are handled using bibtex and cite keys.  We again use the `cvblock` environment, but we use the `pubsin` macro instead of `cvitem`:

```
\begin{cvblock}{Journal Articles}
    \pubsin{2012}{CiteKey1,CiteKey2,CiteKey3}
    \pubsin{2011}{CiteKey4,CiteKey5}
\end{cvblock}
```

Somewhere before this and after `\begin{document}`, you'll have to use

```
\nobibliography{<YourBibFile>}
```

Here, `<YourBibFile>` is a bibtex file containing entries with cite keys CiteKey1, CiteKey2, etc.  You may also specify `\bibliographystyle{plain}`, for example, in the preamble.  In the example, I highlight my name in the author list, based on [this thread](http://tex.stackexchange.com/questions/33330/make-one-authors-name-bold-every-time-it-shows-up-in-the-bibliography).  This is why the example uses `\bibliographystyle{myPlain}`.


