# load packages ----
library(tidyverse)
library(palmerpenguins)


# practice filtering ----
body_mass_df <- penguins |> 
  filter(body_mass_g %in% c(3000:4000))

# create scatterplot ----
ggplot(na.omit(body_mass_df), 
       aes(x = flipper_length_mm, y = bill_length_mm, 
           color = species, shape = species)) +
  geom_point() +
  scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
       color = "Penguin species", shape = "Penguin species") +
  guides(color = guide_legend(position = "inside"),
         size = guide_legend(position = "inside")) +
  theme_minimal() +
  theme(legend.position.inside = c(0.85, 0.2), 
        legend.background = element_rect(color = "white"))



# year input ----
checkboxGroupInput(inputId = "year_input", label = "Select year(s):",
                   choices = c(2007, 2008, 2009), # or `unique(penguins$year)` | NOTE: update checkbox display name by using "New name" = "observation name" (e.g "The year 2007" = 2007)
                   selected = c(2007, 2008))

# DT output ----
DT::dataTableOutput(outputId = "penguin_DT_output")

# filter for years ----
years_df <- reactive({
  penguins |> 
    filter(year %in% c(input$year_input)) # return observations where year is "in" the set of options provided by the user via the checkboxGroupInput
})

# render the DT::datatable ----
output$penguin_DT_output <- DT::renderDataTable({
  
  DT::datatable(years_df(),
                options = list(pagelength = 10),
                rownames = FALSE)
  
})

        