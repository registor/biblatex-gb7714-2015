@echo off


IF NOT EXIST gb7714-2015.bbx (
copy ..\example.bib . /y
copy ..\gb7714-2015.bbx . /y
copy ..\gb7714-2015.cbx . /y
copy ..\gb7714-2015ay.bbx . /y
copy ..\gb7714-2015ay.cbx . /y
copy ..\gb7714-2015ms.bbx . /y
copy ..\gb7714-2015ms.cbx . /y
copy ..\gb7714-2015-gbk.def . /y
)


setlocal enabledelayedexpansion
for  %%a in ( eg*.tex ) do (
call makeclear
set jobfile=%%a
set jobname=!jobfile:~0,-4!
echo %%a
echo !jobfile!
echo !jobname!
xelatex.exe --synctex=-1 !jobfile!
biber !jobname!
xelatex.exe --synctex=-1 !jobfile!
)
setlocal DISABLEDELAYEDEXPANSION



call makeclearfig


del *.bbx /Q
del *.cbx /Q
del *.def /Q
del eg*.bib /Q




::pause