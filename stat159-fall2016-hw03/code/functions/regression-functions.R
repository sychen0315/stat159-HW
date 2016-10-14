
# Description: Computes Residual Sum of Squares (RSS): 
# Input: Takes in lm() object 
# Output: returns RSS value
residual_sum_squares <- function (regression_object) {
  sum(regression_object$residuals^2)
}


# Description: Computes Total Sum of Squares (TSS): 
# Input: Takes in lm() object 
# Output: returns TSS value
total_sum_squares <- function (regression_object) {
  y = regression_object$residuals+regression_object$fitted.values
  sum((y-mean(y))^2)
}

# Description: Computes R-squared: 
# Input: Takes in lm() object 
# Output: returns R-squared value
r_squared <- function(regression_object) {
  reg_tss <- total_sum_squares(regression_object)
  reg_rss <- residual_sum_squares(regression_object)
  (reg_tss-reg_rss)/reg_tss
}

# Description: Computes F-statistic: 
# Input: Takes in lm() object 
# Output: returns F-statistic value
f_statistic <- function(regression_object) {
  p <- length(regression_object$coefficients) - 1
  n <- length(regression_object$fitted.values)
  reg_tss <- total_sum_squares(regression_object)
  reg_rss <- residual_sum_squares(regression_object)
  ((reg_tss-reg_rss)/p)/(reg_rss/(n-p-1))
}

# Description: Computes Residual Standard Error: 
# Input: Takes in lm() object 
# Output: returns Residual Standard Error value
residual_std_error <- function(regression_object) {
  p <- length(regression_object$coefficients) - 1
  n <- length(regression_object$fitted.values)
  reg_tss <- total_sum_squares(regression_object)
  reg_rss <- residual_sum_squares(regression_object)
  sqrt((1/(n-p-1))*reg_rss)
}