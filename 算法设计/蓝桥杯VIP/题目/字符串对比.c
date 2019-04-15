#include <stdio.h>
#include <string.h>

int main()
{
    char a[11], b[11];
    scanf("%s%s", a, b);
    if (strlen(a) != strlen(b)) printf("1");
    else if (strcmp(a, b) == 0) printf("2");
    else if (strcasecmp(a, b) == 0) printf("3");
    else printf("4");
    return 0;
}
