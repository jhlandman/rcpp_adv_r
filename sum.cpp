/**********************************************
** Author: Jayson Landman
** Description: sumC function for benchmarking
*********************************************/

double sumC(NumericVector x) {
	double sum = 0;
	for (int i = 0; i < x.size(); i++) {
		sum += x[i];
	}
	return sum;

}
	