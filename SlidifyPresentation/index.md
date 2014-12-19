---
title       : Sensitity Analysis Call and Put Option
subtitle    : 
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: libraries/highcharts}
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

<iframe src=' assets/fig/chartVola-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chartd6594e6c8e8a ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- .class #id 

## How Does the Strike Price Affect the Option Price?

<iframe src=' assets/fig/chartStrike-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chartd65939022e3f ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- .class #id 

## How Does the Stock Price Affect the Option Price?

<iframe src=' assets/fig/chartStock-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chartd6593e2a4756 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- .class #id 

## How Does the Time to MaturityAffect the Option Price?

<iframe src=' assets/fig/chartTTM-1.html ' scrolling='no' frameBorder='0' seamless class='rChart highcharts ' id=iframe- chartd65949b17efc ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- .class #id 

