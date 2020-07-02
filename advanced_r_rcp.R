library(Rcpp)
library(bench)

# some simple funcs ----------------------------

cppFunction('
int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}
')

add(1, 2, 3)

cppFunction('int signC(int in_int) {
	if (in_int < 0) {
		return -1;
	} else if (in_int == 0) {
		return 0;
	}
	return 1;
}')

sapply(-3:3, signC)

# benchmark -------------------------------

sumR <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  return(total)
}

cppFunction('double sumC(NumericVector x) {
	double sum = 0;
	for (int i = 0; i < x.size(); i++) {
		sum += x[i];
	}
	return sum;

}')

x <- runif(1e4)

# loop overhead is about 20 times less..
bench::mark(
  sum(x),
  sumR(x),
  sumC(x)
)

# type set ------------------------------------

pdistR <- function(x, ys) { # x unclear scalar
  sqrt((x - ys)^2)
}


