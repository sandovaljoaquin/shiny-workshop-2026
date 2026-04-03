ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           # intro text fluidRow ---
           fluidRow(
             
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
           ), # END intro text fluidRow
           
           hr(),
           
           includeMarkdown("text/footer.md")
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Animal Data Explorer",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s)",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)), # END channel type pickerInput
                          
                          # section checkboxGroupButtons
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s)",
                                               choices = c("clear cut forest",
                                                           "old growth forest"),
                                               selected = c("clear cut forest",
                                                            "old growth forest"),
                                               justified = TRUE,
                                               checkIcon = list(yes = icon("check", lib = "font-awesome"),
                                                                no = icon("xmark", lib = "font-awesome")))
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot_output") %>%  withSpinner(color = "dodgerblue", type = 5, size = 2)
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel 
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          # island pickerInput ----
                          pickerInput(inputId = "penguin_island_input",
                                      label = "Select an Island(s)",
                                      choices = unique(penguins$island),
                                      selected = unique(penguins$island),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)), # END channel type pickerInput
                          
                          # Bin Number slider input ---
                          sliderInput(inputId = "bin_num_input",
                                      label = "Select bin size",
                                      min = 1,
                                      max = 50,
                                      # Default value
                                      value = 25,
                                      animate = TRUE)
                          
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "flipper_length_histogram_output")%>%  
                            withSpinner(color = "cyan", type = 8, size = 2)
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage