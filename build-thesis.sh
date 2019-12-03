Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "rmarkdown::render_site(output_format = 'bookdown::word_document2', encoding = 'UTF-8')"
