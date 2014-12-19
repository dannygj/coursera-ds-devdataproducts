library(shiny)
library(rCharts)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Option Calculator"),
  
  # Option inputs
  sidebarLayout(
    sidebarPanel(
textInput(inputId = "S", label = "Stock Price", value = 10),
textInput(inputId = "X", label = "Strike Price", value = 10),
textInput(inputId = "TTM", label = "Time to Maturity (in years)", value = 1),
textInput(inputId = "vola", label = "Volatility", value = 0.2),
textInput(inputId = "rf", label = "Interest Rate", value = 0.05),
selectInput(inputId = "xAxisDimension", label = "Choose xAxis Dimension", choices = c("TimeToMaturity", "StockPrice" , "StrikePrice", "Volatility", "InterestRate"), selected = "StockPrice", multiple = FALSE )

    ),
    
    mainPanel(
      #small introduction
      p("This tool computes plain vanilla call and put prices based on the input on the left sidebar panel. The xAxis of the chart is dependent on the input in xAxis Dimension. The chart provides a sensitivity anlysis of the attribute you choose in that dimension. Futhermore, the option prices are based on the Black Scholes model."),
      hr(),
      # placeholder for the chart
      showOutput("chart", "highcharts")
    )
  )
))