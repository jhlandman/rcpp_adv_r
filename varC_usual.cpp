/***************************************************************
** Author: Jayson Landman
** Description: an implementation of the usual variance formula
***************************************************************/

#include <Rcpp.h>

using namespace Rcpp;

//[[Rcpp::export]]
double varC_usual(NumericVector x) {
	double mean = 0;
	int n = x.size();
	
	for (int i = 0; i < n; i++) {
		mean += x[i];
	}
	mean *= (1 / (double) n);
	
	double var = 0;
	for (int j = 0; j < n; j++) {
		var += pow(x[j] - mean, 2);
	}
	
	return (double)var * (1 / (double) n);
}
