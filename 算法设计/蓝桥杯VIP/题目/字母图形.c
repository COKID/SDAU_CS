#include <stdio.h>

int main()
{
    int i, j, m, n;
    scanf("%d%d", &n, &m);
    for (i = 0; i < n; i++)
    {
        for (j = i; j > 0 && i - j < m; j--)
            printf("%c", 'A' + j);
        for (j = 0; j < m - i; j++)
            printf("%c", 'A' + j);
        printf("\n");
    }
    return 0;
}
