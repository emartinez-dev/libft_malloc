#include "libft_malloc.h"
#include "libft.h"
#include <stdio.h>

int	main(void)
{
	int size = getpagesize();
	printf("Page size: %d\n", size);
	return (0);
	void *ptr = malloc(1);
	printf("Mallloc for 1 byte, ptr: %p\n", ptr);
	void *ptr2 = realloc(ptr, 2);
	printf("Realloc for ptr: %p to 2 bytes to new ptr: %p\n", ptr, ptr2);
	free(ptr2);
	printf("Freed ptr2: %p\n", ptr2);
	return (0);
}
