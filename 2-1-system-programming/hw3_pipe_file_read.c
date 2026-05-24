#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#define BLKSIZE 10000
#include <errno.h>

int main(int argc, char *argv[]){
	int process_num = atoi(argv[2]);
	int pipefd[2];
	int fd;
	char *filename = argv[1];

	if(pipe(pipefd) >0 ){
		perror("pipe");
		exit(1);
	}
	int return_stat;
	struct stat file_info;
	if((return_stat = stat(filename, &file_info)) == -1){
		perror("Failed to stat");
		exit(1);
	}

	off_t size = file_info.st_size;
	off_t process_size = size / process_num;
	off_t process_sizerest = size % process_num;

	int i;
	pid_t childpid = 0;
	for ( i = 0; i < process_num; i++){
		if((childpid = fork()) <= 0){
			break;
		}
	}


	if(childpid == -1){
		perror("Failed to fork");
		exit(1);
	}	
	else if (childpid == 0){
		off_t start = i * process_size;
		off_t end = start + process_size-1;
		off_t howlong = process_size -1;
		if( i == process_num - 1){
			howlong = howlong + process_sizerest;
			end = end + process_sizerest;

		}
		
		if((fd = open(filename, O_RDONLY)) == -1){
			perror("Failed to open file");
			exit(1);
		}

		
		lseek(fd, start, SEEK_SET);

		
		char buf[BLKSIZE];
		ssize_t bytesread = 0;
		int count = 0;
		while((bytesread = read(fd, buf, BLKSIZE)) > 0){
			for (int j = 0 ; j <= howlong; j++){
				if (buf[j] >= 'a' && buf[j] <= 'z'){
					count++;
				}
				else if (buf[j] >= 'A' && buf[j] <= 'Z'){ count++;}
			
			}
		}
		if (bytesread < 0){
			perror("Failed to read");
			exit(1);
		}
		write(pipefd[1], &count, sizeof(count));
		printf("==process[%d] has found %d alphabet letters in (%ld ~ %ld).\n", getpid(), count, start, end);

		if(close(fd) == -1){
			perror("Failed to close");
			exit(1);
		}
		
	}
	else { 
		pid_t pid;
		int status;
		int complete_process = 0;
		int totalletter;
		int childletter;
		ssize_t bytesread2;

		close(pipefd[1]);
		while(pid = wait(&status) > 0){
			complete_process ++;
		}
		while((bytesread2 = read(pipefd[0], &childletter, sizeof(childletter))) > 0 ){
			totalletter += childletter;
		}

		if(complete_process != process_num){ 
			printf("process error");
			exit(1);
		}

		printf("===process[%d] has found %d alphabet letters in %s\n", getpid(), totalletter, argv[1]);

		
		return 0;


	}
}
