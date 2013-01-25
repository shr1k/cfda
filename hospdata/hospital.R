par(mfrow = c(3, 1))

hist(outcome[, 11], main = bquote("Heart Attack " * (bar(X) == .(mean(outcome[,11], na.rm = TRUE))))
     , xlab = "30-day Death Rate"
     , xlim = range(outcome[,11], outcome[,17], outcome[,23], na.rm = TRUE)
     , prob = TRUE)
abline(v = median(outcome[,11], na.rm = TRUE), col = "red")
attack <- density(outcome[,11], na.rm = TRUE)
lines(attack, lty = 2, col = "green")

hist(outcome[, 17], main = bquote("Heart Failure " * (bar(X) == .(mean(outcome[,17], na.rm = TRUE))))
     , xlab = "30-day Death Rate"
     , xlim = range(outcome[,11], outcome[,17], outcome[,23], na.rm = TRUE)
     , prob = TRUE)
abline(v = median(outcome[,17], na.rm = TRUE), col = "red")
failure <- density(outcome[,17], na.rm = TRUE)
lines(failure, lty = 2, col = "green")

hist(outcome[, 23], main = bquote("Pneumonia " * (bar(X) == .(mean(outcome[,23], na.rm = TRUE))))
     , xlab = "30-day Death Rate"
     , xlim = range(outcome[,11], outcome[,17], outcome[,23], na.rm = TRUE)
     , prob = TRUE)
abline(v = median(outcome[,23], na.rm = TRUE), col = "red")
pneumonia <- density(outcome[,23], na.rm = TRUE)
lines(pneumonia, lty = 2, col = "green")
