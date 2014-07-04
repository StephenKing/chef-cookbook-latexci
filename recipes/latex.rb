
[
  'texlive-base',
  'texlive-latex-extra', # pdflatex
  'texlive-fonts-recommended',
  'latexmk',
].each do |pkg|
  package pkg
end

