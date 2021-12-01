library(shiny)
shinyUI(fluidPage(
  
  titlePanel("QQ Plots"),
  
  sidebarLayout(
    sidebarPanel(
  
      selectInput("dist", label = h3("Choose the Distribution"), 
                  choices = list("Beta"="qbeta","Binomial"="qbinom","Chi-Squared"="qchisq",
                   "Exponential"="qexp","F"="qf","Gamma"="qgamma","Normal" ="qnorm", "Poisson" = "qpois"), 
                  selected = "qnorm"),
      
      conditionalPanel(
        condition = "input.dist == 'qbeta'",  
        sliderInput(  "shape1", "Shape 1 ",
        min = 0, max=100, value=1
        ),
        sliderInput(  "shape2", "Shape 2 ",
                      min = 0, max=100, value=1
        )),
      
      conditionalPanel(
        condition = "input.dist == 'qbinom'",  
        sliderInput(  "size", "Size ",
                      min = 0, max=1000, value=1
        ),
        sliderInput(  "prob", "Probability ",
                      min = 0, max=1, value=1,step = 0.01
        )),
      
      conditionalPanel(
        condition = "input.dist == 'qchisq'",  
        sliderInput(  "df", "Degrees of Freedom ",
                      min = 0, max=1000, value=1
        ),
        sliderInput(  "ncp", "Non Centrality Parameter ",
                      min = 0, max=10000, value=1
        )),
      
      conditionalPanel(
        condition = "input.dist == 'qexp'",  
        sliderInput(  "rate", "Rate ",
                      min = 0, max=100, value=1
        )),
      
      conditionalPanel(
        condition = "input.dist == 'qf'",  
        sliderInput(  "df1", "DF1 ",
                      min = 0, max=100, value=1,step=0.2
        ),
        sliderInput(  "df2", "DF2 ",
                      min = 0, max=100, value=1,step=0.2
        )),
      
      conditionalPanel(
        condition = "input.dist == 'qgamma'",  
        sliderInput(  "shape", "Shape ",
                      min = 0, max=100, value=1,step=0.2
        )),
      conditionalPanel(
        condition = "input.dist == 'qnorm'",  
        sliderInput(  "mean", "Mean ",
                      min = 0, max=1000, value=1
        ),
        sliderInput(  "sd", "SD ",
                      min = 0, max=20, value=1,step=0.1
        )),
      conditionalPanel(
        condition = "input.dist == 'qpois'",  
        sliderInput(  "lambda", "Lambda ",
                      min = 0, max=100, value=1
        )),
      textOutput("result"),
      
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    
    ),
  
   mainPanel(
    plotOutput(outputId= "qqplot", height = 800)
  )
 )
))