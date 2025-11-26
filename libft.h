/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                        +:+ +:+         +:+     */
/*   By: glancell <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/19 11:27:52 by glancell          #+#    #+#             */
/*   Updated: 2025/03/17 02:04:53 by glancell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

# include <ctype.h>
# include <unistd.h>
# include <stdlib.h>
# include <string.h>
# include <stdio.h>
# include <fcntl.h>
# include <stdint.h>
# include <stdarg.h>
# include <stdbool.h>
# include <limits.h>

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 4
# endif

# define BASE10 "0123456789"
# define BASE16 "0123456789abcdef"

typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}	t_list;

typedef struct s_flags
{
	int		minus;
	int		zero;
	int		dot;
	int		hash;
	int		space;
	int		plus;
	int		width;
	int		precision;
	char	specifier;
}	t_flags;

typedef struct s_ft_printf
{
	va_list	args;
	int		len;
	int		error;
	t_flags	flags;
}	t_ft_printf;

int		ft_atoi(const char *nptr);
void	ft_bzero(void *s, size_t n);
void	*ft_calloc(size_t nmemb, size_t size);
int		ft_isalnum(int c);
int		ft_isalpha(int c);
int		ft_isascii(int c);
int		ft_isdigit(int c);
int		ft_isprint(int c);
char	*ft_itoa(int n);
void	*ft_memchr(const void *s, int c, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
void	*ft_memcpy(void *dest, const void *src, size_t n);
void	*ft_memmove(void *dest, const void *src, size_t n);
void	*ft_memset(void *s, int c, size_t n);
char	**ft_split(char const *s, char c);
char	*ft_strchr(const char *str, int c);
char	*ft_strdup(const char *src);
size_t	ft_strlcat(char *dst, const char *src, size_t size);
size_t	ft_strlcpy(char *dst, const char *src, size_t size);
size_t	ft_strlen(const char *s);
char	*ft_strnstr(const char *big, const char *little, size_t len);
char	*ft_strrchr(const char *s, int c);
int		ft_strncmp(const char *s1, const char *s2, size_t n);
int		ft_tolower(int c);
int		ft_toupper(int c);
char	*ft_substr(char const *s, unsigned int start, size_t len);
char	*ft_strjoin(char const *s1, char const *s2);
char	*ft_strtrim(char const *s1, char const *set);
char	*ft_strmapi(char const *s, char (*f)(unsigned int, char));
void	ft_striteri(char *s, void (*f)(unsigned int, char*));
void	ft_putchar_fd(char c, int fd);
void	ft_putstr_fd(char *s, int fd);
void	ft_putendl_fd(char *s, int fd);
void	ft_putnbr_fd(int n, int fd);
t_list	*ft_lstnew(void *content);
void	ft_lstadd_front(t_list **lst, t_list *new);
int		ft_lstsize(t_list *lst);
t_list	*ft_lstlast(t_list *lst);
void	ft_lstadd_back(t_list **lst, t_list *new);
void	ft_lstdelone(t_list *lst, void (*del)(void*));
void	ft_lstclear(t_list **lst, void (*del)(void*));
void	ft_lstiter(t_list *lst, void (*f)(void *));
t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));
char	*get_next_line(int fd);
int		ft_printf(const char *format, ...);
void	parse_flags(const char *format, t_ft_printf *data, int *i);
void	parse_width(const char *format, t_ft_printf *data, int *i);
void	parse_precision(const char *format, t_ft_printf *data, int *i);
void	parse_specifier(const char *format, t_ft_printf *data, int *i);
void	print_char(t_ft_printf *data);
void	print_string(t_ft_printf *data);
void	print_pointer(t_ft_printf *data);
void	print_int(t_ft_printf *data);
void	print_unsigned(t_ft_printf *data);
void	print_hex(t_ft_printf *data, int uppercase);
void	print_sign(t_ft_printf *data, int is_negative);
void	apply_width(t_ft_printf *data, int len, int zero_pad);
void	apply_precision_str(t_ft_printf *data, char *str);
void	apply_precision_num(t_ft_printf *data, long num, int base);
int		calc_num_length(long num, int base, t_ft_printf *data);
void	ft_putchar_len(char c, t_ft_printf *data);
void	ft_putstr_len(char *str, t_ft_printf *data);
void	ft_putnbr_base(long n, char *base, t_ft_printf *data);
void	ft_putnbr_base_unsigned(unsigned long n, char *base, t_ft_printf *data);
char	**ft_free_split(char **tab);
int		is_valid_int(char *str);
int		ft_strcmp(const char *s1, const char *s2);

#endif
