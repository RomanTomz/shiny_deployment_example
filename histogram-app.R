install.packages('shiny')

library(shiny)


ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  plotOutput("punk"),
  
  sliderInput(inputId = "num2", 
              label = "Choose a number", 
              value = 100, min = 1, max = 1000),
  plotOutput("hist")
  
  )

server <- function(input, output) {
  output$punk <- renderPlot({
    hist(rnorm(input$num))
  })
  
  output$hist <- renderPlot({
    hist(rnorm(input$num2))
  })
}

shinyApp(ui = ui, server = server)