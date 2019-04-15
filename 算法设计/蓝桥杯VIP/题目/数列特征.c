#include <stdio.h>

int main()
{
    int i, n, a[10000];
    int sum, the_min, the_max;
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    sum = the_min = the_max = a[0];
    for (i = 1; i < n; i++)
    {
        sum += a[i];
        if (the_min > a[i]) the_min = a[i];
        if (the_max < a[i]) the_max = a[i];
    }
    printf("%d\n%d\n%d", the_max, the_min, sum);
    return 0;
}
