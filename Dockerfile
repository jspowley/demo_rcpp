FROM rocker/shiny-verse:latest

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    git

RUN R -e "install.packages(c('Rcpp', 'shiny'), dependencies = TRUE, repos = 'https://packagemanager.rstudio.com/cran/latest')"
# RUN R -e "devtools::install_github('https://github.com/jspowley/eiatools')"

RUN git clone https://github.com/jspowley/demo_rcpp.git /srv/shiny-server/demo_rcpp
RUN chown -R shiny:shiny /srv/shiny-server/demo_rcpp

EXPOSE 3838

#CMD ["/init"]
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/demo_rcpp/', host = '0.0.0.0', port = 3838)"]
