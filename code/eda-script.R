advertising <- read.csv("../data/Advertising.csv", sep = ",", row.names = 1)

sink(file = "../data/eda-output.txt")
summary(advertising)
sink()

png(filename = "../images/histogram-tv.png")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

pdf(file = "../images/histogram-tv.pdf")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

png(filename = "../images/histogram-sales.png")
hist(advertising$Sales, main = "Histogram of TV sales")
dev.off()

pdf(file = "../images/histogram-sales.pdf")
hist(advertising$Sales, main = "Histogram of TV sales")
dev.off()
 
