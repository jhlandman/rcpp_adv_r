library(Rcpp)
library(bench)

# some simple funcs ----------------------------

cppFunction('
int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}')

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

# c++ is type set ------------------------------------

pdistR <- function(x, ys) { # x unclear scalar
  sqrt((x - ys)^2)
}

cppFunction('NumericVector pdistC(int x, NumericVector ys) {
	int n = ys.size();
	NumericVector out(n);
	
	for (int i; i < n; i++) {
		out[i] = sqrt(pow(x - ys[i], 2.0));
	}
	
	return out;
}')

# quite similar performance for base R (when vectorised)
bench::mark(
  pdistR(0, x),
  pdistC(0, x)
)

# running standalone files in R ----------------------

sourceCpp("meanC.cpp")

x <- runif(1e5)

# meanC is actually faster due to accuracy... Wow
bench::mark(
  mean(x),
  meanC(x)
)

# implementations of var ----------------------------

sourceCpp('varC_usual.cpp')

bench::mark(
  var(x),
  varC_usual(x),
  check = FALSE
)
# only accurate to 4 decimal places, but fast
