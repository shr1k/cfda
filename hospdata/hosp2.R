death <- outcome2[, 11]
state <- outcome2$State
outcome3 <- data.frame(death, state)
bymedian <- with(outcome3, reorder(state, death, median, na.rm = TRUE))
boxplot(death ~ bymedian, data = outcome3,
        main = "Heart Attack 30-day Death Rate by State",
        ylab = "30-day Death Rate",
        las = 2,
        xaxt = "n")
axis(1,
     bymedian,
     paste0(bymedian," (",table(outcome2$State)[outcome2$State],")"),
     las=2, cex.axis=0.7)