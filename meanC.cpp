/******************************************************
** Author: Jayson Landman
** Description: to be run in R by rcpp
******************************************************/

#include <Rcpp.h>

using namespace Rcpp;

//[[Rcpp::export]]
double meanC(NumericVector x) {
	double sum = 0;
	int n = x.size();
	
	for (int i = 0; i < n; i++) {
		sum += x[i];
	}
	
	return sum / n;
}