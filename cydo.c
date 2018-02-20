#include <stdio.h>
#include <sysexits.h>
#include <unistd.h>
#include <dlfcn.h>

void fixup() {
    void* handle = dlopen("/usr/lib/libjailbreak.dylib", RTLD_LAZY);
    if (!handle) {
        printf("Err: %s \n", dlerror());
        printf("unable to find libjailbreak.dylib \n");
        return;
    }

    typedef void (*fix_entitle_prt_t)(pid_t pid);
    fix_entitle_prt_t setuid_ptr = (fix_entitle_prt_t)dlsym(handle, "jb_oneshot_fix_setuid_now");
    
    const char *dlsym_error = dlerror();
    if (dlsym_error) {
        printf("encountered dlsym error: %s \n", dlsym_error);
        return;
    }

    setuid_ptr(getpid());
}

int main(int argc, char *argv[]) {
    setuid(0);
    setgid(0);
    
    // basically, we want this to work on other jb's, not only Meridian
    // this checks if setuid works the normal way (kppbypass jb's)
    // if it doesn't, it then calls to libjb as it must be kppless
    if (getuid() != 0) {
        fixup();
    }
    
    if (argc < 2 || argv[1][0] != '/') {
        argv[0] = "/usr/bin/dpkg";
    } else {
        --argc;
        ++argv;
    }
    
    execv(argv[0], argv);
    return EX_UNAVAILABLE;
}
