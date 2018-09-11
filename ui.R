#
# This shiny application allows the user to plot the miles per gallon against 
# any of the three variables - Power, Displacement or Weight. The plots are 
# classified based on the number of cylinders. It uses the data from mtcars.
#

library(shiny)

# Define UI for application that plots the mileage
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Mileage plots"),
  
  # Sidebar with a radio button to select the variable to be plotted 
  sidebarLayout(
    sidebarPanel(
       h3("Please select the variable to be plotted on the "),
       radioButtons("Xaxis", "X-axis:",
                       c("Power" = "hp",
                         "Displacement" = "Displacement",
                         "Weight" = "Weight"
                         ))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("mileagePlot")
    )
  )
))
