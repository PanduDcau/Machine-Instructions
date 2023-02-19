byte x = 7 ;

active proctype increment() {
	int oldx = x ;
	printf("Hello, world\n") ;
	printf("x = %d\n", x) ;
	x++ ;
	printf("x = %d\n", x) ;
	assert( x >= oldx ) ;
}

init {
	int lastpid;
	lastpid = run increment();
}