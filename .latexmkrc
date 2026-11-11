# Build with LuaLaTeX and Biber:  latexmk maintext_thesis.tex
$pdf_mode = 4;                 # 4 = lualatex
$bibtex_use = 2;               # run biber, and clean its files with latexmk -c
$lualatex = 'lualatex -interaction=nonstopmode -synctex=1 %O %S';
