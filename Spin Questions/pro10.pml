bool wantP=false, wantQ=false;
byte critical=0;

active proctype P() {
	do
		:: printf("Non-critical section P\n");
		wantP=true;
		critical++;
		printf("Critical section P\n");
		assert (critical<=1);
		critical--;
		wantP=false;
	od
}

active proctype Q() {
	do
		:: printf("Non-critical section Q\n");
		wantQ=true;
		critical++;
		printf("Critical section Q\n");
		assert (critical<=1);
		critical--;
		wantQ=false;
	od
}
