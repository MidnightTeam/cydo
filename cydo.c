#include <stdio.h>
#include <sysexits.h>
#include <unistd.h>
#include <dlfcn.h>

int main(int argc, char *argv[]) {
    setuid(0);
    setgid(0);
    
    if (argc < 2 || argv[1][0] != '/') {
        argv[0] = "/usr/bin/dpkg";
    } else {
        --argc;
        ++argv;
    }

    if (access("/.cydo_logging", F_OK) == 0) {
        printf("Running: ");
        for (int i = 0; i < argc; i++)
          printf("%s ", argv[i]);
        printf("\n");
    }
    
    execv(argv[0], argv);
    return EX_UNAVAILABLE;
}
