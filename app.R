library(shiny)
library(Rcpp)

# Define UI for application that draws a histogram
ui <- fluidPage(
  numericInput("a", "A:", value = 0),
  numericInput("b", "B:", value = 0),
  textOutput("c")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  sourceCpp('sum.cpp')
  output$c <- renderText({rcpp_sum(c(input$a, input$b, 20))})
}

# Run the application 
shinyApp(ui = ui, server = server)
