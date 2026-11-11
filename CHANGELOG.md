# Changelog

All notable changes to this template will be documented in this file.

## [1.0.1]

### Fixed
- Conclusions chapter now appears in the table of contents and has the correct running header
- Removed `inputenc` (not needed with LuaLaTeX) and set `\headheight`, which silenced the compiler warnings
- Corrected the commented-out include for the second-language abstract (`chapters/Resumen`)
- The abstract no longer prints its title twice
- Cheat sheets: `\figref` output and numeric vs author-year examples described correctly

### Added
- `.gitignore`, `.latexmkrc`, `.vscode/settings.json` and the `Figures/` folders that the README already described
- README: section on printing the thesis, troubleshooting, A4 and cover instructions

## [1.0.0] — 2025

### Initial release
- Complete thesis template with B5 paper layout
- Package file with 12 organised sections covering all common needs
- Chapter files (Introduction through Conclusions + Appendix)
- Abstract environments (English + second language)
- Bibliography setup with Biber (numeric-comp, switchable to author-year)
- Quick-reference cheat sheets: `Codici_TESTO.txt` and `COME_CITARE.txt`
- VS Code LaTeX Workshop configuration
- latexmk configuration for automated builds
- Comprehensive README with getting started guide, FAQ, and customisation instructions
- `.gitignore` for LaTeX auxiliary files
- CC BY 4.0 license
