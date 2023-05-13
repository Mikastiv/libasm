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

// x64 architecture only

#pragma once

#include <sys/types.h>

size_t ft_strlen(const char* s);
char* ft_strcpy(char* restrict dst, const char* src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void* ptr, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char* ft_strdup(const char *s);
int ft_atoi_base(const char* str, char* base);

typedef struct s_list
{
    void* data;
    struct s_list* next;
}   t_list;

void ft_list_push_front(t_list **list, void *data);
int ft_list_size(t_list *list);
void ft_list_sort(t_list **list, int (*cmp)(void*, void*));
void ft_list_remove_if(t_list **list, void *data_ref, int (*cmp)(void*, void*), void (*free_fct)(void*));
