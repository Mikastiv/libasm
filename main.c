/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleblanc <mleblanc@student.42quebec.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 19:35:22 by mleblanc          #+#    #+#             */
/*   Updated: 2022/04/19 21:03:43 by mleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char** argv) {
    (void)argc;
    if (argv[1]) {
        printf("%zu\n", ft_strlen(argv[1]));
        printf("%zu\n", strlen(argv[1]));

        char arr[1024];
        printf("%s\n", ft_strcpy(arr, argv[1]));
    }
}
