/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleblanc <mleblanc@student.42quebec.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 19:35:22 by mleblanc          #+#    #+#             */
/*   Updated: 2022/04/19 23:54:38 by mleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/syscall.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    (void)argc;
    if (argc > 1) {
        printf("ft  : %zu\n", ft_strlen(argv[1]));
        printf("libc: %zu\n", strlen(argv[1]));

        char arr[1024];
        printf("ft  : %s\n", ft_strcpy(arr, argv[1]));
        printf("libc: %s\n", strcpy(arr, argv[1]));
    }

    if (argc > 2) {
        printf("ft  : %d\n", ft_strcmp(argv[1], argv[2]));
        printf("libc: %d\n", strcmp(argv[1], argv[2]));
    }

    ssize_t r;
    r = write(1, "test\n", 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(1, "test\n", 5);
    printf("ft  : %ld, errno: %d\n", r, errno);
    r = write(-1, "test\n", 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(-1, "test\n", 5);
    printf("ft  : %ld, errno: %d\n", r, errno);
    r = write(5, "test\n", 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(5, "test\n", 5);
    printf("ft  : %ld, errno: %d\n", r, errno);
    r = write(5, 0, 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(5, 0, 5);
    printf("ft  : %ld, errno: %d\n", r, errno);
    r = write(1, 0, 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(1, 0, 5);
    printf("ft  : %ld, errno: %d\n", r, errno);
    r = write(1, "test\n", 5);
    printf("libc: %ld, errno: %d\n", r, errno);
    r = ft_write(1, "test\n", 5);
    printf("ft  : %ld, errno: %d\n", r, errno);

    char* st = ft_strdup("Hello World 1234123412341234123412341234123412341234123412341234123412341234");
    printf("%s\n", st);
    free(st);
    st = strdup("Hello World 1234123412341234123412341234123412341234123412341234123412341234");
    printf("%s\n", st);
    free(st);

    // char buf[20] = {};
    // r = ft_read(0, buf, 10);
    // printf("%s\n", buf);

    printf("%d\n", ft_atoi_base("  +++--+++-456731hg", "0123456789"));

    t_list* list = NULL;
    int* data = malloc(5 * sizeof(int));
    data[0] = 64;
    data[1] = 128;
    data[2] = 6464;
    data[3] = 128128;
    data[4] = 646464;
    ft_list_push_front(&list, data);
    ft_list_push_front(&list, data + 1);
    ft_list_push_front(&list, data + 2);
    ft_list_push_front(&list, data + 3);
    ft_list_push_front(&list, data + 4);

    t_list* ptr = list;
    while (ptr) {
        const int* p = ptr->data;
        printf("%d\n", *p);
        ptr = ptr->next;
    }
    ptr = list;
    while (ptr) {
        t_list* tmp = ptr;
        ptr = ptr->next;
        free(tmp);
    }
    free(data);
}
