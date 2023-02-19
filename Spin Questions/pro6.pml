#define N 100

init {
	int i=1;
	do
	:: break
	:: i<N -> i++
	od;
	printf("%d\n",i);
}