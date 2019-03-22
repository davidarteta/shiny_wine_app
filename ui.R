library(shiny)
library(rattle.data)
#library(ggplot2)

#load the wine data
data(wine)
#define variable names from data headers
choices= names(wine)[-1]
#define corporate color
`Grifols Blue` = "#003896"


# Define UI

ui <- fluidPage(
  
  # Application title
  titlePanel(h4("Wine Shiny App", align = "center")),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      selectInput("variable",label="1. Select the variable from the wine dataset", choices = choices),
      br(),
      # tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #003896}")),#color for slider
      # sliderInput("bins","2. Select the number of bins for the histogram", min = 5, max = 25, value = 15),
      # br(),
      radioButtons("graph","3. Select the type of graph", choices = c("Histogram","Boxplot","Stripchart"), selected = "Histogram"),
      br(),
      radioButtons("color","3. Select the color for the histogram", choices = c("Green","Red","Orange","Grifols"), selected = "Grifols")
      
    ),
    
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("mygraph")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)
