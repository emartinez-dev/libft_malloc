/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   malloc.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: franmart <franmart@student.42malaga.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/02 14:08:22 by franmart          #+#    #+#             */
/*   Updated: 2025/01/24 20:06:07 by franmart         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft_malloc.h"
#include "libft.h"

// Memory must be aligned by 16 bytes

bool initialized = false;
static long	pagesize;

void	init_alloc(void)
{
	pagesize = 4 * 1024;
	#ifdef __APPLE__
	pagesize = getpagesize();
	#elif __linux__
	pagesize = sysconf(_SC_PAGESIZE);
	#endif
}

void	*malloc(size_t size)
{
	if (!initialized)
	{
		init_alloc();
		initialized = true;
	}
	(void) size;
	return NULL;
}

void	free(void *ptr)
{
	(void) ptr;
}

void	*realloc(void *ptr, size_t size)
{
	(void) ptr;
	(void) size;
	return NULL;
}