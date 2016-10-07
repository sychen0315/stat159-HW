advertising <- read.csv(file = "../data/Advertising.csv", sep = ",", row.names = 1)

reg <-  lm(advertising$Sales ~ advertising$TV)

summary(reg)
save(reg, file = "../data/regression.RData")

pdf(file = "../images/scatterplot-tv-sales.pdf")
plot(advertising$TV, advertising$Sales, pch = 19, col = 'red')
abline(reg, lwd = 2) 
dev.off()

png(file = "../images/scatterplot-tv-sales.png")
plot(advertising$TV, advertising$Sales, pch = 19, col = 'red')
abline(reg, lwd = 2) 
dev.off()

