/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleblanc <mleblanc@student.42quebec.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 19:35:22 by mleblanc          #+#    #+#             */
/*   Updated: 2022/04/19 21:22:00 by mleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>

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
}
