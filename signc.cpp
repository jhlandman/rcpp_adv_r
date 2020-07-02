/*******************************************************
** Author: Jayson Landman
** Description: function to sign ints
*******************************************************/

int signC(int in_int) {
	if (in_int < 0) {
		return -1;
	} else if (in_int == 0) {
		return 0;
	}
	return 1;
}