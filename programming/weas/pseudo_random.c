#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int i;
    printf("RAND_MAX is %u\n",RAND_MAX);
    srand(time(NULL));
    
    printf("Random values from 0 to RAND_MAX\n");
    for(i=0;i<10;i++)
    	printf("%d\n",rand());
    printf("Random values from 0 to 20\n");
    for(i=0;i<10;i++)
    	printf("%d\n",(rand()%20)+1);
    return 0;
}
