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
}
