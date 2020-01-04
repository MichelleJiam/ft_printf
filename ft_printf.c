/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_printf.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: mjiam <mjiam@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/12/02 12:35:56 by mjiam          #+#    #+#                */
/*   Updated: 2019/12/29 19:48:16 by mjiam         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libftprintf.h"

int		isvalid(const char **input, t_data *data)
{
	if (!**input)
	{
		data->type = 0;
		return (0);
	}
	return (1);
}

int		adjuster(t_data *data, size_t len)
{
	size_t	newlen;

	newlen = len;
	if (data->width != (int)len)
		newlen = data->width;
	if (data->precision != -2 && data->width < data->precision)
	{
		if (data->type == 's' && data->precision < (int)len)
			newlen = data->precision;
		else if (data->type != 's' && data->precision > (int)len)
			newlen = data->precision;
	}
	return (newlen);
}

void	datainitialiser(t_data *data)
{
	data->modifier = 0;
	data->left = 0;
	data->zero = 0;
	data->precision = -2;
	data->hash = 0;
	data->group = 0;
	data->sp_plus = 0;
	data->sign = 0;
	data->size = 0;
	data->width = 0;
}

int		ft_printf(const char *input, ...)
{
	va_list	list;
	t_data	data;
	int		printcount;

	printcount = 0;
	va_start(list, input);
	while (*input)
	{
		if (*input != '%')
			writer(input, 1, &printcount);
		else
		{
			datainitialiser(&data);
			input++;
			if (parser(&input, &data, list, &printcount) < 0)
				return (-1);
		}
		input++;
	}
	va_end(list);
	return (printcount);
}
