#include <stdio.h>
#include <string.h>

int main()
{
    int i, j, n;
    char str[1024] = "A", str2[1024];
    scanf("%d", &n);
    for (i = 1; i < n; i++)
    {
        sprintf(str2, "%s%c%s", str, 'A' + i, str);
        strcpy(str, str2);
    }
    printf("%s", str);
    return 0;
}
