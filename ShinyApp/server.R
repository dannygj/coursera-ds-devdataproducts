library(shiny)
library(rCharts)
library(dplyr)


# Black scholes function
# Call value is returned in values[1], put in values[2]
blackscholes <- function(S, X, rf, T, sigma) {
  values <- c(2)
  d1 <- (log(S/X)+(rf+sigma^2/2)*T)/sigma*sqrt(T)
  d2 <- d1 - sigma * sqrt(T)
  values[1] <- S*pnorm(d1) - X*exp(-rf*T)*pnorm(d2)
  values[2] <- X*exp(-rf*T) * pnorm(-d2) - S*pnorm(-d1)
  values
}

# Define server logic required to draw the chart
shinyServer(function(input, output) {
  
  chartData <- reactive({
    
    chart.data <- data.frame()
    
    # calculate price for different TTM
    pctValues <- seq(from = 0.5, to = 1.5, by = 0.05)
    
    strikePrice <- as.numeric(input$X)
    stockPrice <- as.numeric(input$S)
    vola <- as.numeric(input$vola)
    ttm <- as.numeric(input$TTM)
    rf <- as.numeric(input$rf)
    xAxisDimension <- as.character(input$xAxisDimension)
    
    # for TTM
    chart.data <- data.frame()
    
    # for TTM
    for(pctValue in pctValues){
      
      if(xAxisDimension=="TimeToMaturity"){
        x <- pctValue * ttm
        call <- blackscholes(S = stockPrice, X = strikePrice,rf = rf, T = x, sigma = vola)[1]
        put <- blackscholes(S = stockPrice, X = strikePrice,rf = rf, T = x, sigma = vola)[2]
        
      } else if(xAxisDimension=="StockPrice"){
        x <- pctValue * stockPrice
        call <- blackscholes(S = x, X = strikePrice,rf = rf, T = ttm, sigma = vola)[1]
        put <- blackscholes(S = x, X = strikePrice,rf = rf, T = ttm, sigma = vola)[2]
        
      } else if(xAxisDimension=="StrikePrice"){
        x <- pctValue * strikePrice
        call <- blackscholes(S = stockPrice, X = x,rf = rf, T = ttm, sigma = vola)[1]
        put <- blackscholes(S = stockPrice, X = x,rf = rf, T = ttm, sigma = vola)[2]
        
      } else if(xAxisDimension=="Volatility"){
        x <- pctValue * vola
        call <- blackscholes(S = stockPrice, X = strikePrice,rf = rf, T = ttm, sigma = x)[1]
        put <- blackscholes(S = stockPrice, X = strikePrice,rf = rf, T = ttm, sigma = x)[2]
        
      } else if(xAxisDimension=="InterestRate"){
        x <- pctValue * rf
        call <- blackscholes(S = stockPrice, X = strikePrice,rf = x, T = ttm, sigma = vola)[1]
        put <- blackscholes(S = stockPrice, X = strikePrice,rf = x, T = ttm, sigma = vola)[2]
        
      }
      
        chart.data <- rbind(chart.data, c(x, call , put ))

    }
    
    colnames(chart.data) <- c("x", "call", "put")
    
  return(chart.data)
    
    
  })
  
  
  output$chart <- renderChart2 ({
    
    data <- chartData()
    
    chart <- Highcharts$new()
    chart$chart(type="line")
    chart$title(text="Call and Put Option Pricing")
    chart$yAxis(title = list(text ="Option Price"))
    chart$xAxis(title = list(text =as.character(input$xAxisDimension)))
    chart$series(name = "Call", data = toJSONArray2(select(data, x, call) %>% arrange(x), json = F, names = F))
    chart$series(name = "Put", data = toJSONArray2(select(data, x, put) %>% arrange(x), json = F, names = F))
    chart$tooltip(shared=T, useHTML=F, crosshairs=T, valueDecimals=4)
    return(chart)
  
    
  })
})