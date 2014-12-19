---
title       : Sensitity Analysis Call and Put Option
subtitle    : 
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---






## Introduction

The following slides will give an overview of how option values change if either time to maturity, stock price, strike price or volatility are adjusted, everything else equal.
Generally, the values are set to:
* Strike Price: 10
* Stock Price: 10
* Volatility: 0.20
* Time to Maturity: 1.0
* Interest Rate: 0.05

--- .class #id 

## How Does the Volatility Affect the Option Price?

![plot of chunk chartVola](assets/fig/chartVola-1.png) 

--- .class #id 

## How Does the Strike Price Affect the Option Price?

![plot of chunk chartStrike](assets/fig/chartStrike-1.png) 

--- .class #id 

## How Does the Stock Price Affect the Option Price?

![plot of chunk chartStock](assets/fig/chartStock-1.png) 

--- .class #id 

## How Does the Time to MaturityAffect the Option Price?

![plot of chunk chartTTM](assets/fig/chartTTM-1.png) 

--- .class #id 
