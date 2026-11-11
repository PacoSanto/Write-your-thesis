# Write your thesis

A LaTeX template for a Master's or PhD thesis, based on the one I used for my own PhD in Earth Sciences
at the University of Granada.

When I started writing, I lost a lot of time on things that have nothing to do with science: which packages to load,
how to set the margins for a bound book, why biblatex would not print my references, how to put two photos side by side.
This repository is the setup I ended up with, cleaned up and commented, so you can skip that part.
I wrote it with geology and chemistry in mind (minerals, formulas, units, microscope images), but nothing in it is
specific to one field.

It compiles as it is. Clone it, replace the placeholder text, and write.

## What is in the repository

```
write-your-thesis/
├── maintext_thesis.tex        main file: compile this one
├── references.bib             your bibliography
├── Other_Package/
│   └── package_thesis.tex     packages, page layout, custom commands
├── chapters/
│   ├── Abstract.tex           abstract
│   ├── Resumen.tex            abstract in a second language (optional)
│   ├── CAP1.tex ... CAP8.tex  introduction, goals, methods, three results chapters,
│   │                          discussion, conclusions
│   └── Appendix.tex           appendix (optional)
├── Figures/                   put your images here (Figures/Covers for the cover PDF)
├── Codici_TESTO.txt           cheat sheet: figures, tables, equations, formulas, units
├── COME_CITARE.txt            cheat sheet: citations and .bib entries
├── .latexmkrc                 makes `latexmk` use LuaLaTeX and Biber
├── .vscode/settings.json      build recipe for VS Code (LaTeX Workshop)
└── .gitignore
```

Defaults: B5 paper, two-sided layout with a binding offset, numeric citations ([1-3]), chapters in separate files.
Loaded and configured: maths, chemistry (`chemformula`, `mhchem`), units (`siunitx`), figures and subfigures,
`booktabs` tables, landscape pages, code listings, epigraphs. Every setting in `package_thesis.tex` has a comment
saying what it does.

The two cheat sheets (`Codici_TESTO.txt`, `COME_CITARE.txt`) are the files I kept open next to the editor while writing.
The names are in Italian because that is how I saved them; the content is in English.

## Requirements

- A LaTeX distribution: [TeX Live](https://tug.org/texlive/) (Linux, Windows), [MacTeX](https://tug.org/mactex/) (macOS)
  or [MiKTeX](https://miktex.org/). On Ubuntu/Debian: `sudo apt install texlive-full latexmk biber`.
- **LuaLaTeX** and **Biber**. Both come with the distributions above.
- An editor. I used VS Code with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
  extension (the build recipe is already in `.vscode/`). [Overleaf](https://www.overleaf.com/) also works.

## Compile

```bash
git clone https://github.com/PacoSanto/Write-your-thesis.git
cd Write-your-thesis
latexmk maintext_thesis.tex
```

`latexmk` reads `.latexmkrc`, runs LuaLaTeX and Biber as many times as needed and gives you `maintext_thesis.pdf`.
To do it by hand:

```bash
lualatex maintext_thesis.tex
biber    maintext_thesis
lualatex maintext_thesis.tex
lualatex maintext_thesis.tex
```

**Overleaf:** upload the folder, then Menu > Compiler > **LuaLaTeX**.

## How I use it

**Chapters.** Each chapter is a separate file in `chapters/`. The `\chapter{...}` line lives in `maintext_thesis.tex`,
not in the chapter file, so you see the whole structure of the thesis in one place. Need fewer chapters? Delete the
`\chapter` and `\input` lines you do not use. Need more? Add them and create the file.

**Figures.** Put images in `Figures/` and use the file name only:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.75\linewidth]{my_image.png}
    \caption{What the figure shows.}
    \label{fig:my_image}
\end{figure}
```

Subfigures, landscape tables, chemical formulas and the rest are in `Codici_TESTO.txt`.

**References.** Export your entries from Zotero, Mendeley or Google Scholar into `references.bib`, then cite with
`\cite{Key}`. All the commands, with examples, are in `COME_CITARE.txt`.

**Citation style.** In `package_thesis.tex`, change `style = numeric-comp` to `style = authoryear` and compile again.

**A4 instead of B5.** Change `b5paper` to `a4paper` in two places: the first line of `maintext_thesis.tex` and the
`geometry` options in `package_thesis.tex`. Then adjust the margins to what your university asks for.

**Cover page.** Put the PDF in `Figures/Covers/` and uncomment the `\includepdf` lines at the top of
`maintext_thesis.tex`.

**Abstract, appendix, lists of figures and tables.** They are in `maintext_thesis.tex`, commented out. Remove the `%`
to switch them on.

## From the PDF to the printed thesis

Writing the thesis is half of the job; the other half is getting it printed and bound without surprises.
This is the checklist I followed. Always check your university's rules first: they win over everything below.

1. **Know your page size.** The template is B5 (176 x 250 mm). You can check it with `pdfinfo maintext_thesis.pdf`.
   Ask the print shop whether they can print B5. If you print on A4 yourself, choose **actual size (100%)**, never
   "fit to page": scaling changes the margins and the font size you designed.
2. **Print double-sided, flip on the long edge.** The layout is `twoside`: odd pages on the right, even on the left,
   with an extra 4 mm on the inner margin for the binding (`bindingoffset` in `package_thesis.tex`). Increase it if the
   binding takes more space (spiral, hardcover).
3. **Blank pages are normal.** `\cleardoublepage` and `\chapter` make every chapter start on a right-hand page, so a
   blank left page can appear. Do not delete them, they keep the double-sided layout correct.
4. **Fonts embedded.** Run `pdffonts maintext_thesis.pdf`: every line must say `yes` under *emb*. LuaLaTeX does this
   by default.
5. **Figures.** Plots and diagrams as vector PDF when possible. Photos and microscope images at about 300 dpi at the
   size they have on the page. Lower resolution looks fine on screen and bad on paper.
6. **Colours.** If you print in black and white, check that your figures are still readable in grayscale. Links in
   the PDF are coloured (citations are cyan): for the printed version, set `citecolor = black` in the `\hypersetup`
   of `package_thesis.tex`.
7. **Final front page.** The draft title page in `maintext_thesis.tex` is a placeholder. Replace it with the official
   one of your university (as a PDF with `\includepdf`, or as a separate `Frontespizio.tex`).
8. **Remove the draft material.** Delete `\lipsum` dummy text and `\today` in the title if you do not want a date that
   changes at every compilation.
9. **Read the PDF, not the source.** Before sending it to the printer, scroll through the whole PDF once: widows at the
   bottom of a page, figures that ended up far from their text, overfull lines, references showing as `??`.
10. **Print a test chapter.** One chapter on paper will show you problems (margins, font size, figure quality) that
    the screen hides. It is cheaper than reprinting a whole thesis.
11. **Send the PDF, not the .tex.** Give the print shop the final PDF and, if they ask, the page size and the binding
    type.

## Troubleshooting

**"Undefined control sequence" or font errors.** Compile with LuaLaTeX, not pdfLaTeX.

**The bibliography is empty or shows `[?]`.** Biber has not run. Use `latexmk`, or follow the four steps above.
Also check that the key in `\cite{}` exists in `references.bib`.

**A package is missing.** With TeX Live install `texlive-full`; with MiKTeX allow automatic installation of missing
packages.

**More languages.** Add them in the `babel` line of `package_thesis.tex` (the last one is the document language).

**List of abbreviations or glossary.** Load the `glossaries` package; the
[Overleaf guide](https://www.overleaf.com/learn/latex/Glossaries) explains it well.

## Contributing

Corrections, new examples and compatibility fixes are welcome: see [CONTRIBUTING.md](CONTRIBUTING.md).
If you used the template for your thesis, I would be glad to hear about it.

## License and author

Released under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/): use it, change it, share it, also commercially,
as long as you give credit.

Francesco Santoro De Vico, geologist, University of Padova ([fsdv.eu](https://fsdv.eu)).

If it saved you some time, a star on the repository helps other students find it.
