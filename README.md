# ✍️ write-your-thesis

> **A clean, well-documented LaTeX template for Master's and PhD theses.**
> Built from real experience, so you don't have to waste weeks reinventing the wheel.

---

## Why this template?

If you've ever started writing a thesis in LaTeX, you know the pain: hours spent hunting for the right packages, fighting with margins, figuring out how citations work, getting subfigures to behave, and wondering why your table looks terrible. By the time the setup is "done", you've lost days — or weeks — that should have gone into actual writing.

**This template is the starting point I wish I had.** It collects all the configuration, custom commands, and best practices I accumulated during my own thesis work, and organises them into a structure that just works out of the box.

It is designed for students in **Earth Sciences, Geology, Chemistry, Physics**, and related STEM fields, but it is general enough for any discipline. Whether you're writing about geochemistry or quantum mechanics, this gives you a solid foundation.

### What you get

- **A complete, compilable project** — clone it, open it, start writing.
- **Sensible defaults** — B5 paper, professional headers/footers, clean typography, correct bibliography setup.
- **All the packages you'll need** — maths, chemistry, units, figures, subfigures, tables, landscape pages, code listings, and more — already loaded and configured.
- **Two quick-reference cheat sheets** — `Codici_TESTO.txt` (LaTeX commands) and `COME_CITARE.txt` (citation guide) that you can keep open while writing.
- **Chapter files ready to fill in** — just open and type.
- **Detailed comments everywhere** — every setting is explained so you can understand *and* customise.

---

## 📁 Repository Structure

```
write-your-thesis/
│
├── maintext_thesis.tex          # Main document — compile this one
├── references.bib               # Your bibliography entries go here
│
├── Other_Package/
│   └── package_thesis.tex       # All packages, layout, custom commands
│
├── chapters/
│   ├── Abstract.tex             # Abstract (English)
│   ├── Resumen.tex              # Abstract (second language, optional)
│   ├── CAP1.tex                 # Chapter 1 — Introduction
│   ├── CAP2.tex                 # Chapter 2 — Research Goals
│   ├── CAP3.tex                 # Chapter 3 — Materials and Methods
│   ├── CAP4.tex                 # Chapter 4 — Results Part 1
│   ├── CAP5.tex                 # Chapter 5 — Results Part 2
│   ├── CAP6.tex                 # Chapter 6 — Results Part 3
│   ├── CAP7.tex                 # Chapter 7 — General Discussion
│   ├── CAP8.tex                 # Chapter 8 — Conclusions
│   └── Appendix.tex             # Appendix (optional)
│
├── Figures/
│   └── Covers/                  # Cover page PDFs (optional)
│
├── Codici_TESTO.txt             # Cheat sheet: common LaTeX commands
├── COME_CITARE.txt              # Cheat sheet: citation commands
│
├── .gitignore                   # Ignores LaTeX auxiliary files
├── .latexmkrc                   # Auto-compilation config for latexmk
├── LICENSE                      # CC BY 4.0 license
└── README.md                    # This file
```

---

## 🚀 Getting Started

### Prerequisites

You need a working LaTeX distribution:

| OS | Recommended distribution |
|---|---|
| **Windows** | [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/) |
| **macOS** | [MacTeX](https://tug.org/mactex/) |
| **Linux** | TeX Live (`sudo apt install texlive-full`) |

You also need **Biber** (usually included with the distributions above) for bibliography processing.

**Recommended editor:** [Visual Studio Code](https://code.visualstudio.com/) with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension, or [Overleaf](https://www.overleaf.com/) for online editing.

### Step 1 — Clone the repository

```bash
git clone https://github.com/PacoSanto/write-your-thesis.git
cd write-your-thesis
```

Or download the ZIP from the green **Code** button on GitHub.

### Step 2 — Open and customise

1. Open `maintext_thesis.tex` in your editor.
2. Replace the placeholder author name and title with your own.
3. Start writing in the chapter files inside `chapters/`.
4. Add your figures to the `Figures/` folder.
5. Add your bibliography entries to `references.bib`.

### Step 3 — Compile

The compilation requires **four passes** to resolve all cross-references and bibliography:

```bash
lualatex  maintext_thesis.tex
biber     maintext_thesis
lualatex  maintext_thesis.tex
lualatex  maintext_thesis.tex
```

**Or, much easier**, use `latexmk` (included with TeX Live and MacTeX):

```bash
latexmk maintext_thesis.tex
```

The included `.latexmkrc` file tells `latexmk` to use LuaLaTeX and Biber automatically.

---

## 📝 How to Use This Template

### Writing chapters

Each chapter lives in its own file inside `chapters/`. For example, to write your introduction, open `chapters/CAP1.tex` and start typing:

```latex
% chapters/CAP1.tex
This thesis investigates the geochemical properties of...

\section{Background}
The study area is located in...

\section{State of the Art}
Previous studies have shown that \cite{Smith2020}...
```

The chapter heading itself (e.g., `\chapter{Introduction}`) is defined in `maintext_thesis.tex`, not in the chapter file. This keeps things clean and gives you a single place to see the full thesis structure.

### Adding figures

1. Place your image files (`.jpg`, `.png`, `.pdf`) in the `Figures/` folder.
2. Reference them in your chapter:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.75\linewidth]{my_image.jpg}
    \caption{Description of the figure.}
    \label{fig:my_image}
\end{figure}
```

See `Codici_TESTO.txt` for more examples (subfigures, landscape figures, etc.).

### Adding references

1. Open `references.bib` and add your entries (or export them from Zotero, Mendeley, Google Scholar, etc.).
2. Cite in the text with `\cite{label}`.

See `COME_CITARE.txt` for the full citation command reference.

### Switching citation style

The default style is **numeric-comp** (compressed numbers: [1–3]). To switch to **author-year** (e.g., Eco, 1977):

1. Open `Other_Package/package_thesis.tex`.
2. Find the line `style = numeric-comp`.
3. Change it to `style = authoryear`.
4. Recompile with Biber.

### Changing paper size

The default is **B5** (common for European theses). To switch to **A4**:

1. In `maintext_thesis.tex`, change `b5paper` to `a4paper`.
2. In `Other_Package/package_thesis.tex`, change `b5paper` to `a4paper` in the `geometry` settings.
3. Adjust margins to your university's requirements.

---

## 📋 Quick Reference Files

| File | What it contains |
|---|---|
| **`Codici_TESTO.txt`** | Copy-paste snippets for figures, tables, equations, subfigures, chemical formulas, units, lists, cross-references, and more. |
| **`COME_CITARE.txt`** | Complete guide to citation commands (`\cite`, `\parencite`, `\textcite`, etc.) with examples, plus how to structure `.bib` entries. |

**Tip:** Keep these files open in a separate tab while you write. They save you from constantly Googling "how do I do X in LaTeX".

---

## ⚙️ Customisation Guide

### Packages and settings

Everything is in `Other_Package/package_thesis.tex`, organised in numbered sections:

1. **Spacing and titles** — line spacing, heading format
2. **Fonts and language** — encoding, Babel languages
3. **Page layout** — headers, footers, page numbers
4. **Maths and chemistry** — amsmath, chemformula, siunitx
5. **Figures and tables** — graphicx, booktabs, subfig, landscape
6. **Typography** — microtype, indentation, colours
7. **Code listings** — syntax highlighting
8. **Cross-references** — hyperlinks, bookmarks
9. **Lists** — enumitem configuration
10. **Bibliography** — biblatex/Biber setup
11. **Custom commands** — shortcuts and abbreviations
12. **Abstract environment** — decorative abstract block

Each section has comments explaining what every package and setting does, so you can turn things on/off and understand the consequences.

### Adding or removing chapters

Open `maintext_thesis.tex` and add/remove `\chapter` + `\input` lines. Create the corresponding `.tex` file in `chapters/`.

### Adding a cover page

1. Place your cover PDF in `Figures/Covers/`.
2. Uncomment the `\includepdf` lines at the top of `maintext_thesis.tex`.

---

## 🤔 FAQ / Troubleshooting

**Q: I get "undefined control sequence" errors.**
A: Make sure you compile with **LuaLaTeX** (not pdfLaTeX). Some packages in this template require it.

**Q: My bibliography doesn't appear.**
A: You need to run Biber between LuaLaTeX passes. Use `latexmk` to automate this, or run the four-step compilation manually.

**Q: Can I use this on Overleaf?**
A: Yes! Upload all the files, set the compiler to **LuaLaTeX** in the project settings (Menu → Compiler), and it should compile directly.

**Q: I only need 5 chapters, not 8.**
A: Just comment out or delete the extra `\chapter` / `\input` lines in `maintext_thesis.tex`. The template adapts automatically.

**Q: How do I add a List of Abbreviations or Glossary?**
A: Add the `glossaries` package in `package_thesis.tex` and create a glossary file. There are excellent guides on the [Overleaf documentation](https://www.overleaf.com/learn/latex/Glossaries).

---

## 📜 License

This template is released under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0). You are free to use, modify, and distribute it, even for commercial purposes, as long as you give appropriate credit.

---

## 👤 Author

**Francesco Santoro De Vico**
Geologist · Research Fellow · University of Padova

This template was created from the practical experience of setting up a LaTeX environment for a PhD thesis in Earth Sciences. It is shared publicly so that students and colleagues don't have to spend the same amount of time to reach a good starting point.

If you find it useful, a star on the repository is always appreciated. If you have suggestions or improvements, feel free to open an issue or a pull request.

---

## 🙏 Acknowledgements

Built with LaTeX and the extraordinary work of the open-source community that maintains all the packages used here. Special thanks to the developers of `biblatex`, `booktabs`, `siunitx`, `chemformula`, `titlesec`, and all the other packages that make scientific writing in LaTeX possible.
