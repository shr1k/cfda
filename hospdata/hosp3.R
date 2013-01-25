
xyplot(death ~ npatient | owner,
       main = "Heart Attack 30-day Death Rate by Ownership",
       xlab = "Number of Patients Seen",
       ylab = "30-day Death Rate",
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.lmline(x, y)
       })

