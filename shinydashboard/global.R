# load pkgs ----
library(shiny)
library(shinydashboard)
library(arrow)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)

# read in data ---- 
# Do not use `here()`

lake_data <- read_parquet("data/lake_data_processed.parquet")
