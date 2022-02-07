rm(list = ls(all.names = TRUE))
library(tidyverse)
library(openalexR)
library(openalex)
library(DT)
paper_info <- find_work (id_type = "doi", 
                         id = "https://dx.doi.org/10.5152/FNJN.2019.18028",
                         variable_unnest = "authors")
paper_tbl <- paper_info %>% select(title,openalexid,publication_date)
datatable(paper_tbl)

find_author_by_id <-find_author(id_type = "openalex",id="https://openalex.org/A2614412206")
clean_author_info(find_author_by_id)
tbl_info <- find_author_by_id %>%select(name,orcid,openalex_id,total_works)
datatable(tbl_info)

Researcher_oa_id <- paper_info$authors_id[1]
all_papers <- get_authors_papers(id_type = "openalex",
                                 id = Researcher_oa_id)
tbl_all_papers <- all_papers %>% select(title,openalex,publication_year)
datatable(tbl_all_papers)
