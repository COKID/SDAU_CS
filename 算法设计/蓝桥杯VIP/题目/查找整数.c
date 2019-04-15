#include <stdio.h>

int main()
{
    int i, m, n, a[1000];
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    scanf("%d", &m);
    for (i = 0; i < n; i++)
        if (a[i] == m) break;
    if (i == n)
        printf("-1");
    else
        printf("%d", i + 1);
    return 0;
}
