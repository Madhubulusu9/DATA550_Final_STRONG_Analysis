
all: strong_analysis.html

strong_analysis.html: strong_analysis.Rmd output/table1.rds output/figure1.png
	Rscript -e "rmarkdown::render('strong_analysis.Rmd', output_format = 'html_document')"

output/table1.rds: code/02_make_table1.R output/analysis_data.rds
	Rscript code/02_make_table1.R

output/figure1.png: code/03_make_figure1.R output/analysis_data.rds
	Rscript code/03_make_figure1.R

output/analysis_data.rds: code/01_prepare_data.R data/strong_simulated.rds
	Rscript code/01_prepare_data.R

clean:
	rm -f output/analysis_data.rds output/table1.rds output/figure1.png strong_analysis.html

.PHONY: all clean
