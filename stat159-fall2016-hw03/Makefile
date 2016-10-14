# Declare phony targets
.PHONY: all data tests clean

# Declare all traget, which will be executed when you call 'Make' command in terminal
all: eda regression report

# target: data
# Description: download advertising.csv
data: 
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

# target: tests
# Description: run unit tests of my functions
tests: code/tests/test-regression.R
	cd code/tests && Rscript test-regression.R

# target: eda
# Description: perform the exploratory data analysis
eda: code/scripts/eda-script.R data/Advertising.csv
	cd code/scripts && Rscript eda-script.R

# target: regression
# Description: perform the series of regression analyses

regression: code/scripts/regression-script.R data/Advertising.csv
	cd code/scripts && Rscript regression-script.R

# target: report
# Description: will generate report.pdf and report.html  
report: report/report.Rmd data/regression.RData data/correlation-matrix.RData code/functions/regression-functions.R images/residual-plot.png
	cd report && Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"
	cd report && Rscript -e "library(rmarkdown); render('report.Rmd','html_document')"



# target: clean
# Description: will delete the generated report
clean:
	cd report && rm -f report.pdf report.html