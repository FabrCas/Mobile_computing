#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/types.h>

int n;
void handler(int sig){
  
  if(n==0){
    printf("termino esecuzione\n");
    exit(0);
  }
  else{
  pid_t pid;
  printf("pid[%d]forse hai premuto per sbaglio Ctrl+C?\n", getpid());
  printf("Vuoi realmente sospendere l'esecuzione? Per farlo digita il pid del processo\n");
  scanf("%d",&pid);

  if(pid==getpid()){
    printf("termino esecuzione\n");
    exit(0);
  }
  n--;
}
}

int main(int argc, char*argv[]){
  if(argc==1){
    printf("errore\n");
    exit(1);
  }
  n= atoi(argv[1]);
  signal(SIGINT,handler);
  while(1){
  /*  if(n==0){
      printf("termino l'esecuzione\n");
      exit(0);
    }*/
    printf("si sta per stoppare\n");
    pause();
    printf("riparte\n");
  }
}
