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

    int c = ft_isspace(9);
    printf("%d\n", c);

    printf("%s\n", ft_strchr("123345657868789789", '8'));
    printf("%s\n", ft_strchr("", '\0'));
    printf("%s\n", ft_strchr("123345657868789789", '\0'));
    printf("%s\n", ft_strchr("Hello World!", '!'));
    printf("%s\n", ft_strchr("Hello World!", 'l'));
    printf("%s\n", ft_strchr("Hello World!", 'H'));
    printf("%s\n", ft_strchr("Hello World!", '1'));
}
