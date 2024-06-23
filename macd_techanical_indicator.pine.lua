//@version=5
indicator("MACD Indicator", shorttitle="MACD", overlay=false)

// Input parameters
fastLength = input.int(12, title="MACD Fast Length")
slowLength = input.int(26, title="MACD Slow Length")
signalSmoothing = input.int(9, title="MACD Signal Smoothing")

// Calculate MACD
fastMA = ta.ema(close, fastLength) // Fast EMA
slowMA = ta.ema(close, slowLength) // Slow EMA
macd = fastMA - slowMA // MACD Line
signal = ta.ema(macd, signalSmoothing) // Signal Line
histogram = macd - signal // Histogram (MACD Line - Signal Line)

// Plot MACD Line
plot(macd, color=color.blue, title="MACD Line")

// Plot Signal Line
plot(signal, color=color.orange, title="Signal Line")

// Plot Histogram
plot(histogram, color=color.red, style=plot.style_histogram, title="MACD Histogram")
