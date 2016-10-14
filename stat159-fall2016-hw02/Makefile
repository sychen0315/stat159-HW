.PHONY: all data clean


all: eda-output.txt regression.RData report.pdf

eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code && Rscript eda-script.R

regression.RData: code/regression-script.R data/Advertising.csv
	cd code; Rscript regression-script.R

report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	cd report;Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"
	cd report;Rscript -e "library(rmarkdown); render('report.Rmd','html_document')"


data: 
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

clean:
	cd report; rm -f report.pdf report.html