#
# This is the server logic of a Shiny web application to plot the mileage. 
# You can run the application by clicking 'Run App' above.
#

library(shiny)
library(ggplot2)

# Define server logic required to draw the plots
shinyServer(function(input, output) {

    output$mileagePlot <- renderPlot({
    df <- mtcars
    df$cyl <- as.factor(df$cyl)
    
    if (input$Xaxis == "hp") {
      classfn <- df$hp
    }
    
    if (input$Xaxis == "Displacement") {
      classfn <- df$disp
    }
    
    if (input$Xaxis == "Weight") {
      classfn <- df$wt
    }
    
    # Make the plot with the selected variable
    ggplot(df, aes(y=mpg, x=classfn, color=cyl))+
      geom_point(aes(y=mpg, x=classfn)) + 
      geom_smooth(method = "lm") +
      xlab(input$Xaxis) +
      ylab("Miles per gallon") +
      theme_bw()
  })
  
})
