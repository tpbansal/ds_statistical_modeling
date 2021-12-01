library(shiny)
library(ggplot2)
data("mtcars")



shinyServer(function(input, output) {
  
  
  getParams <- function(distribution){
    switch(distribution,
           "qbeta" = c(input$shape1, input$shape2),
           "qbinom" = c(input$size, input$prob),
           "qchisq" = c(input$df, input$ncp),
           "qexp" = c(input$rate),
           "qf" = c(input$df1,input$df2),
           "qgamma" = c(input$shape),
           "qnorm" = c(input$mean, input$sd),
           "qpois" = c(input$lambda))
  }
  
  output$qqplot <- renderPlot({
    
    param <- reactive({getParams(input$dist)})
     # c(input$normMean,input$normSD)
    
    ggplot(mtcars, aes(sample = mpg))+ theme(aspect.ratio = 1)+
      stat_qq(distribution = input$dist, dparams = param())+
       ggtitle("QQ Line Plot")
  
  
    })
  
  output$result <- renderText(getParams(input$dist))

  })


  



