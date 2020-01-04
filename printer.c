/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   printer.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: mjiam <mjiam@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/12/03 20:16:50 by mjiam          #+#    #+#                */
/*   Updated: 2019/12/27 22:55:23 by mjiam         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libftprintf.h"

void	writer(const char *ptr, size_t len, int *printcount)
{
	write(1, ptr, len);
	*printcount += len;
}

void	printer(const char c, size_t len, int *printcount)
{
	size_t	i;

	i = 0;
	while (len && i < len)
	{
		writer(&c, 1, printcount);
		i++;
	}
}
