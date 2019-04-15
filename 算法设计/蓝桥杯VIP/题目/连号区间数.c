#include <stdio.h>
#define N 50000

int main()
{
    int i, j, n, a[N] = {0};
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    
    int count = 0;
    for (i = 0; i < n; i++)
    {
        int the_max = a[i];
        int the_min = a[i];
        count += 1;
        for (j = i + 1; j < n; j++)
        {
            if (the_max < a[j]) the_max = a[j];
            if (the_min > a[j]) the_min = a[j];
            if (the_max - the_min == j - i)
                count += 1;
        }
    }
    
    printf("%d", count);
    return 0;
}
