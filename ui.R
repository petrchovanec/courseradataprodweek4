#
# This is the user-interface definition file of the Shiny web application for 
# Week 4 of Coursera Data Products class.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Trend Car Road Tests Modeling"),

  fluidRow(
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h4("Explanatory variables"),
      checkboxInput("cyl","Number of cylinders"),
      checkboxInput("disp","Displacement (cu.in.)"),
      checkboxInput("hp","Gross horsepower"),
      checkboxInput("drat","Rear axle ratio"),
      checkboxInput("wt","Weight (1000 lbs)"),
      checkboxInput("qsec","1/4 mile time"),
      checkboxInput("vs","V/S"),
      checkboxInput("am","Transmission (0 = automatic, 1 = manual)"),
      checkboxInput("gear","Number of forward gears"),
      checkboxInput("carb","Number of carburetors")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       textOutput("distHTML")
    )),
  fluidRow(
    mainPanel(HTML('The purpose of this app to let you chose your regression model to explain the mileage of cars in the mtcars dataset and show the fit.<br/> In the left pane you chose explanatory variables by checking and unchecking checkbox. <br> On the right you see graphical representation of the actual mileages (in red) and your model predicted mileages (in blue). Below is the model and R-squared of the model.<br> Enjoy!'
  ))
  )
)))
