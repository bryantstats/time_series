x <- read.table("unemp.dat")$V1
acf(x, lag.max=72)
acf(diff(x), lag.max=72)
y <- diff(diff(x), 12)

acf(y, lag.max=72)
pacf(y, lag.max=72)

f2001 <- arima(y, order=c(2, 0, 0), seasonal=list(order=c(0, 0, 1), period=12))
f2030 <- arima(y, order=c(2, 0, 0), seasonal=list(order=c(3, 0, 0), period=12))
f0401 <- arima(y, order=c(0, 0, 4), seasonal=list(order=c(0, 0, 1), period=12))
f0430 <- arima(y, order=c(0, 0, 4), seasonal=list(order=c(3, 0, 0), period=12))

# BIC
nobs <- length(y)
log(f2001$sigma2) + 3 * log(nobs) / nobs
log(f2030$sigma2) + 5 * log(nobs) / nobs

# Try again without the mean
f2001a <- arima(y, order=c(2, 0, 0), seasonal=list(order=c(0, 0, 1), period=12),
      include.mean=F)
f2030a <- arima(y, order=c(2, 0, 0), seasonal=list(order=c(3, 0, 0), period=12),
      include.mean=F)

tsdiag(f2001a)
qqnorm(f2001a$residuals)

# Oops, a single outlier kills the Shapiro-Wilk statistic...
shapiro.test(f2001a$residuals)
shapiro.test(f2001a$residuals[-312])

fit <- arima(x, order=c(2, 1, 0), seasonal=list(order=c(0, 1, 1), period=12))
p <- predict(fit, 12)

#
# The rest is just for making printable charts
#
postscript(file="stat_153_solutions4_seas_acf.eps")
par(mfrow=c(4, 1))
acf(x, lag.max=72, ylab="ACF of undifferenced data")
acf(diff(x), lag.max=72, ylab="ACF of first differences")
acf(y, lag.max=72, ylab="ACF of 1 x 12 differences")
pacf(y, lag.max=72, ylab="PACF of 1 x 12 differences")
dev.off()

postscript(file="stat_153_solutions4_seas_diag.eps")
tsdiag(f2001a)
dev.off()

postscript(file="stat_153_solutions4_seas_qq.eps")
qqnorm(f2001a$residuals)
dev.off()

postscript(file="stat_153_solutions4_seas_pred.eps")
nobs <- length(x)
month <- 1:nobs
plot(month, x, type="o", xlim=c(1, nobs+12),
	   ylab="Unemployment")

prange <- (nobs+1):(nobs+12)
lines(prange, p$pred, col="red", type="o")
lines(prange, p$pred - 2*p$se, col="blue", lty="dashed")
lines(prange, p$pred + 2*p$se, col="blue", lty="dashed")
dev.off()
