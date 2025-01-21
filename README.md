# libft_malloc
Implementing a dynamic memory allocation / reallocation / free mechanism

## Requirements

- [x] The library must be named libft_malloc_$HOSTTYPE.so.
- [x] Your Makefile will create a symbolic link `libft_malloc.so -> libft_malloc_$HOSTTYPE.so`
- [ ] You are allowed a global variable to manage your allocations and one for the threadsafe.
- [ ] Implement `malloc`
- [ ] Implement `realloc`
- [ ] Implement `free`
- [ ] Pre-allocate some memory zones to store small and medium malloc.
- [ ] The size of these zones must be a multiple of getpagesize()
- [ ] Each zone must contain at least 100 allocations.
- [ ] "TINY" mallocs, from 1 to n bytes, will be stored in N bytes big zones.
- [ ] "SMALL" mallocs, from (n+1) to m bytes, will be stored in M bytes big zones.
- [ ] "LARGE" mallocs, fron (m+1) bytes and more, will be stored out of zone, which simply means
      with mmap(), they will be in a zone on their own.
- [ ] Write a function that allows visual on the state of the allocated memory zones with the
      prototype `void show_alloc_mem();`
- [ ] The memory should be aligned.

### Allowed functions

- mmap(2)
- munmap(2)
- getpagesize under OSX or sysconf(_SC_PAGESIZE) under linux
- getrlimit(2)
