active proctype P() {
	int x = 3, y = 4;
	int gcd;
	do
		:: x == y ; gcd = x ; break ;
		:: x < y ; gcd = y - x ; y = x ; x = gcd ;
		:: y < x ; gcd = x - y ; x = y ; y = gcd ;
	od

	printf ("The gcd of x = %d and y = %d is %d \n", x, y, gcd)
}

init {
	int lastpid;
	lastpid = run P();
}