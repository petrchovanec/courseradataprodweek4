#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    fmlparts <- "1"
    if (input$cyl) {fmlparts <- c(fmlparts,"cyl")}
    if (input$disp) {fmlparts <- c(fmlparts,"disp")}
    if (input$hp) {fmlparts <- c(fmlparts,"hp")}
    if (input$drat) {fmlparts <- c(fmlparts,"drat")}
    if (input$wt) {fmlparts <- c(fmlparts,"wt")}
    if (input$qsec) {fmlparts <- c(fmlparts,"qsec")}
    if (input$vs) {fmlparts <- c(fmlparts,"vs")}
    if (input$am) {fmlparts <- c(fmlparts,"am")}
    if (input$gear) {fmlparts <- c(fmlparts,"gear")}
    if (input$carb) {fmlparts <- c(fmlparts,"carb")}


    # generate formula
    frm <- paste("mpg ~ ",paste(fmlparts, collapse = " + ") ,sep="")
    #frm <- "mpg~cyl"

    # solve formula and create dataset

    mdl <- lm(frm,data=mtcars)

    dts <- NULL
    dts <- data.frame(realized= mdl$model$mpg )
    #dts$nr <- 1:nrow(dts)
    dts$predicted <- fitted(mdl)
    dts$names <- names(fitted(mdl))

    ndts <- melt(dts,'names')

    # plot
    ggplot(data=ndts, aes(x=names, y=value , color = variable)) + geom_point() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ylab('Realized and Predicted MPG') + ggtitle('Realized and Predicted MPG')

  })

  output$distHTML <- renderText({
    fmlparts <- "1"
    if (input$cyl) {fmlparts <- c(fmlparts,"cyl")}
    if (input$disp) {fmlparts <- c(fmlparts,"disp")}
    if (input$hp) {fmlparts <- c(fmlparts,"hp")}
    if (input$drat) {fmlparts <- c(fmlparts,"drat")}
    if (input$wt) {fmlparts <- c(fmlparts,"wt")}
    if (input$qsec) {fmlparts <- c(fmlparts,"qsec")}
    if (input$vs) {fmlparts <- c(fmlparts,"vs")}
    if (input$am) {fmlparts <- c(fmlparts,"am")}
    if (input$gear) {fmlparts <- c(fmlparts,"gear")}
    if (input$carb) {fmlparts <- c(fmlparts,"carb")}
    
    
    # generate formula
    frm <- paste("mpg ~ ",paste(fmlparts, collapse = " + ") ,sep="")
    mdl <- lm(frm,data=mtcars)
    
    (paste('Explanatory model is  "',frm,'", R-square of the model is ', round(100*summary(mdl)$r.squared,1), "%"))
    
    
    })
  
  
})
