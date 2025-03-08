x <- read.table("globtemp2.dat")$V2

# The ACF looks like we need to take differences
# (linear decay)
acf(x)

# Let's look at the first difference:
x1 <- diff(x, 1)
acf(x1)
pacf(x1)


# Neither one cuts off after a small lag, so we will
# fit using both AR and MA components:
fit111 <- arima(x1, order = c(1, 0, 1))

# Diagnostics look ok.
tsdiag(fit111)

# Test residuals for normality, looks ok.
qqnorm(fit111$residuals)
shapiro.test(fit111$residuals)

# We can get better likelihood (and AIC) by increasing
# the order of the model:
fit112 <- arima(x1, order = c(1, 0, 2))
fit113 <- arima(x1, order = c(1, 0, 3))
fit114 <- arima(x1, order = c(1, 0, 4))
fit115 <- arima(x1, order = c(1, 0, 5))
fit211 <- arima(x1, order = c(2, 0, 1))
fit311 <- arima(x1, order = c(3, 0, 1))

# AICc
log(fit111$sigma2) + (124 + 2) / (124 - 2 - 2)
log(fit114$sigma2) + (124 + 5) / (124 - 5 - 2)

# BIC
log(fit111$sigma2) + 2*log(124) / 124
log(fit114$sigma2) + 5*log(124) / 124

# The best AIC is a114, but the best BIC is a111.
# We'll pick a111, just because it is simpler.

p111 <- predict(fit111, 10)
p114 <- predict(fit114, 10)

# Go back to the undifferenced data for making predictions.
nobs <- length(x)
fit <- arima(x, order=c(1,1,1), xreg=1:nobs)
p <- predict(fit, 10, newxreg=(nobs+1):(nobs+10))

#
# The rest is just for making printable charts
#
postscript(file="stat_153_solutions4_acf.eps",
	width=50, height=3)
par(mfrow=c(1, 3))
acf(x, ylab="ACF of undifferenced data")
acf(x1, ylab="ACF of first differences")
pacf(x1, ylab="PACF of first differences")
dev.off()

postscript(file="stat_153_solutions4_pred.eps")
year <- 1880:2004
plot(year, x, type="o", xlim=c(1880, 2014), ylim=c(-0.6, 1.0),
	   ylab="Global temperatures")
lines(2005:2014, p$pred, col="red", type="o")
lines(2005:2014, p$pred - 2*p$se, col="blue", lty="dashed")
lines(2005:2014, p$pred + 2*p$se, col="blue", lty="dashed")
dev.off()

postscript(file="stat_153_solutions4_diag.eps")
tsdiag(fit111)
dev.off()

postscript(file="stat_153_solutions4_qq.eps")
qqnorm(fit111$residuals)
dev.off()
