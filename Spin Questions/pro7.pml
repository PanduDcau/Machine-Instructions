active proctype P() {
	int a = 5, b=5;
	int max;
	assert (a>=0 && b>=0); //pre-condition
	if
		:: a >= b -> max = a;
		:: b >= a -> max = b+1;
	fi;
	assert (a>=b -> max ==a : max == b); //post-condition

	printf ("The max of %d and %d = %d\n", a, b, max);
}

init {
	int lastpid;
	lastpid = run P();
}