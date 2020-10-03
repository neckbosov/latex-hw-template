for f in $1; do 
  name=${f%.*}
  rm -f $name.{toc,log,out,aux}
  pdflatex -shell-escape $name.tex || exit
  pdflatex -shell-escape -interaction=nonstopmode >/dev/null $name.tex || exit
  rm -f $name.{toc,log,out,aux,dvi,pyg,fls}
  rm -rf _minted*
done
