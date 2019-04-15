#include <stdio.h>

int main()
{
    int h, m;
    char* en0to19[] = {
        "zero","one","two","three","four","five",
        "six","seven","eight","nine","ten","eleven",
        "twelve","thirteen","fourteen","fifteen",
        "sixteen","seventeen","eighteen","nineteen"
    };
    char* en20to50[] = {
        "twenty","thirty","forty","fifty"
    };
    char* oclick = "o'clock";
    scanf("%d%d", &h, &m);
    if (h >= 20)
    {
        printf("%s", en20to50[0]);
        if (h % 20 > 0)
            printf(" %s", en0to19[h % 20]);
    }
    else
    {
        printf("%s", en0to19[h]);
    }
    if (m == 0)
    {
        printf(" %s", oclick);
    }
    else if (m >= 20)
    {
        printf(" %s", en20to50[m / 10 - 2]);
        if (m % 10 > 0)
            printf(" %s", en0to19[m % 10]);
    }
    else
    {
        printf(" %s", en0to19[m]);
    }
    return 0;
}
