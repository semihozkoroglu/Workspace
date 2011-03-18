#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main()
{
	char path[256];

	if (getcwd(path, 256) == NULL) {
		fprintf(stderr, "Yolu bulamadik\n");
		exit(1);
	}
	printf("%s\n", path);
	
	return 0;
}
