bool wantP=false, wantQ=false;
byte critical=0;

#define mutex (critical <=1)

active proctype P() {
	do
		:: 	printf("Non-critical section P\n");
			wantP=true;
			!wantQ;
			critical++;
			printf("Critical section P\n");
			critical--;
			wantP=false;
	od
}

active proctype Q() {
	do
		:: 	printf("Non-critical section Q\n");
			wantQ=true;
			!wantP;
			critical++;
			printf("Critical section Q\n");
			critical--;
			wantQ=false;
	od
}