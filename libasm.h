/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleblanc <mleblanc@student.42quebec.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 18:37:36 by mleblanc          #+#    #+#             */
/*   Updated: 2022/04/19 21:20:19 by mleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <stddef.h>

size_t ft_strlen(const char* s);
char* ft_strcpy(char* restrict dst, const char* src);
int ft_strcmp(const char *s1, const char *s2);
