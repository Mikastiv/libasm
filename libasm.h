/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleblanc <mleblanc@student.42quebec.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 18:37:36 by mleblanc          #+#    #+#             */
/*   Updated: 2022/04/19 22:13:22 by mleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <sys/types.h>

size_t ft_strlen(const char* s);
char* ft_strcpy(char* restrict dst, const char* src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void* ptr, size_t count);
char* ft_strdup(const char *s);
