# CustomLibft

A comprehensive C library containing a re-implementation of many standard C library functions, along with additional utility functions. This project is a core requirement of the **42 school curriculum** (Topic: `42glancell`), designed to strengthen understanding of C programming concepts, memory management, and data structures.

---

## 🚀 Overview

**CustomLibft** is a static library (`libft.a`) that bundles useful C functions. The goal is to create a personal utility library that can be easily linked to future C projects.

This project includes:
1.  **Standard C library functions** (e.g., `strlen`, `memcpy`, `isalpha`).
2.  **Utility functions** (e.g., `itoa`, `split`, `trim`).
3.  **Linked list functions** (Bonus part, typically).

---

## ✨ Features (Functions List)

The library functions are organized into three main categories:

### Part 1: Standard C Library Replicas

These functions replicate the behavior of those found in the standard C library (`<ctype.h>`, `<string.h>`, `<stdlib.h>`, etc.).

| Category | Description |
| :--- | :--- |
| **Character Checks** | `ft_isalpha`, `ft_isdigit`, `ft_isalnum`, `ft_isascii`, `ft_isprint`, `ft_toupper`, `ft_tolower` |
| **Memory Management** | `ft_memset`, `ft_bzero`, `ft_memcpy`, `ft_memmove`, `ft_memchr`, `ft_memcmp`, `ft_calloc` |
| **String Manipulation** | `ft_strlen`, `ft_strlcpy`, `ft_strlcat`, `ft_strchr`, `ft_strrchr`, `ft_strncmp`, `ft_strdup` |

### Part 2: Additional Utility Functions

These functions provide various utilities for string conversion, manipulation, and output.

| Function | Prototype | Description |
| :--- | :--- | :--- |
| `ft_substr` | `char *ft_substr(char const *s, unsigned int start, size_t len)` | Extracts a substring from a string. |
| `ft_strjoin` | `char *ft_strjoin(char const *s1, char const *s2)` | Concatenates two strings. |
| `ft_strtrim` | `char *ft_strtrim(char const *s1, char const *set)` | Trims specified characters from the beginning and end of a string. |
| `ft_split` | `char **ft_split(char const *s, char c)` | Splits a string by a delimiter character. |
| `ft_itoa` | `char *ft_itoa(int n)` | Converts an integer to a string. |
| `ft_striteri` | `void ft_striteri(char *s, void (*f)(unsigned int, char*))` | Applies a function to each character of a string. |
| **Output** | `ft_putchar_fd`, `ft_putstr_fd`, `ft_putendl_fd`, `ft_putnbr_fd` | Outputs a character, string, string with newline, or integer to a given file descriptor. |

### Bonus Part: Linked List Functions

Functions for manipulating a basic singly linked list (`t_list` structure).

> **[REQUIRED: Add your linked list function prototypes here. Examples:]**
> * `t_list *ft_lstnew(void *content)`
> * `void ft_lstadd_front(t_list **lst, t_list *new)`
> * `int ft_lstsize(t_list *lst)`
> * `void ft_lstclear(t_list **lst, void (*del)(void*))`

---

## 🛠️ Installation

To compile the library, you only need the **GNU make** utility and a standard C compiler (like **gcc**).

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Nexus29/CustomLibft.git](https://github.com/Nexus29/CustomLibft.git)
    cd CustomLibft
    ```

2.  **Compile the library:**
    ```bash
    make
    ```
    This command will compile all the `.c` source files located in the `src/` directory and create the static library file, `libft.a`, in the root directory.

3.  **Clean up object files:**
    ```bash
    make clean
    ```

4.  **Full clean (remove object files and the library):**
    ```bash
    make fclean
    ```

---

## 🔗 Usage in Your Projects

To use the `CustomLibft` in another C project, you must:

1.  Include the header file (`libft.h`) in your source files.
2.  Link the compiled static library (`libft.a`) during compilation.

**Example Compilation Command:**

Assuming your main file is `main.c` and is in a folder adjacent to `CustomLibft`:

```bash
# Compile and link
cc -Wall -Wextra -Werror main.c -L CustomLibft -lft -I CustomLibft -o my_program
# or, if compiling locally:
cc -Wall -Wextra -Werror main.c libft.a -I . -o my_program
