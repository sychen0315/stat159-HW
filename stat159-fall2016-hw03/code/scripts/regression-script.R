# Read data
advertising <- read.csv(file = "../../data/Advertising.csv", sep = ",", row.names = 1)

# Computes regression objects
Sales <- advertising$Sales
TV <- advertising$TV
Newspaper <- advertising$Newspaper
Radio <- advertising$Radio

reg_Sales_on_TV <-  lm(Sales ~ TV)
reg_Sales_on_Radio <-  lm(Sales ~ Radio)
reg_Sales_on_Newspaper <-  lm(Sales ~ Newspaper)

multi_reg <- lm(Sales ~ TV+
                  Radio+Newspaper)

multi_reg_sum<-summary(multi_reg)
save(reg_Sales_on_TV,reg_Sales_on_Radio,reg_Sales_on_Newspaper,
     multi_reg, multi_reg_sum,file = "../../data/regression.RData")



# Plots
png(file = "../../images/scatterplot-tv-sales.png")
plot(TV, Sales, pch = 19, col = 'red', 
     main = "Scatterplot of Sales vs TV advertising budgets ")
abline(reg_Sales_on_TV, lwd = 2) 
dev.off()

png(file = "../../images/scatterplot-radio-sales.png")
plot(Radio, Sales, pch = 19, col = 'red', 
     main = "Scatterplot of Sales vs Radio advertising budgets")
abline(reg_Sales_on_Radio, lwd = 2) 
dev.off()

png(file = "../../images/scatterplot-newspaper-sales.png")
plot(Radio, Sales, pch = 19, col = 'red', 
     main = "Scatterplot of Sales vs Newspaper advertising budgets")
abline(reg_Sales_on_Newspaper, lwd = 2) 
dev.off()

png(file = "../../images/residual-plot.png")
plot(multi_reg, which = 1)
dev.off()

png(file = "../../images/normal-qq-plot.png")
plot(multi_reg, which = 2)
dev.off()

png(file = "../../images/scale-location-plot.png")
plot(multi_reg, which = 3)
dev.off()