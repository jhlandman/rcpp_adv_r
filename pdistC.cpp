/*************************************************************
** Author: Jayson Landman
** Description: function to calculate Euclidean distance where
    <p, q> p is a scalar
*************************************************************/

NumericVector pdistC(int x, NumericVector ys) {
	int n = ys.size();
	NumericVector out(n);
	
	for (int i; i < n; i++) {
		out[i] = sqrt(pow(x - ys[i], 2.0));
	}
	
	return out;
}