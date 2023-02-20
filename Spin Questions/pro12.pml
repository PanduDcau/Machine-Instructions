bool wantP=false, wantQ=false;

active proctype P() {
	do
		:: 	printf("Non-critical section P\n");
			wantP=true;
			!wantQ;
			cs: printf("Critical section P\n");
			wantP=false;
	od
}

active proctype Q() {
	do
		:: 	printf("Non-critical section Q\n");
			wantQ=true;
			!wantP;
			cs: printf("Critical section Q\n");
			wantQ=false;
	od
}