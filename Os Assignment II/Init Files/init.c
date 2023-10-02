#include <stdio.h>
#include <sys/types.h>
#include <unistd.h> //Necessary header files to run fork

//W.P Pallewatta - 18001149 (Os Takehome Assignment)
void main()
{   //Printing Hellow World to find the Starting point
    printf("Hello World!\n");
    int pid = fork();//implementing fork

    if (pid == 0)
    {
        while (1)
        {
            char text[30];

            scanf("%[^\n]%*c", text);//Testing the typed word is a char
            printf("%s \n", text); //Printing the char array
        }
    }
    
    else
    {
        while (1);//When parent process not implemented. Endless loop
    }
}
