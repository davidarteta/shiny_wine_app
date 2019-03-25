library(shiny)
library(ggplot2)

##Inputs
#variable
#graph
#color

#Define server

server <- function(input, output) {
  
  myvariable <- reactive({
    input$variable
  })
  mygraph <- reactive({
    input$graph
  })
  mycolor <- reactive({
    input$color
  })
  
  output$mygraph <- renderPlot({
    #myvariable <- input$variable
    #mygraph <- input$graph
    #mycolor <- input$color
    if (mycolor() == "Grifols") {fill = "#003896"} else {fill = mycolor()}
    # create plot
    if (mygraph() == "Histogram"){
      ggplot(wine, aes_string(myvariable())) +
      geom_histogram(fill = fill, 
      colour = "grey30") + 
      theme_gray() 
      
    } else if (mygraph() == "Boxplot"){
      ggplot(wine, aes_string(y=myvariable())) +
        geom_boxplot(width = 0.3, fill = fill, colour = "grey30", outlier.colour = "red", outlier.size = 3) + 
        coord_flip() +
        scale_x_continuous(limits=c(-0.7, 0.7)) +
        theme_gray() +
        theme(axis.title.y = element_blank(), axis.text.y = element_blank(),axis.ticks.y = element_blank())
    
    } else {#Stripchart
      ggplot(wine, aes_string(x=myvariable(), y = c(0))) +
        geom_point(colour = fill, size = 3) +
        theme(axis.title.y = element_blank(), axis.text.y = element_blank(),axis.ticks.y = element_blank())
    
    }
  })
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    summary(wine)
  })
  
  # Generate an HTML table view of the data ----
  output$table <- renderTable({
    wine
  })

  
}
