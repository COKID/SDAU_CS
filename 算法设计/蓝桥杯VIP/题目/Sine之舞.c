#include <stdio.h>
#define N 200000

int main()
{
    char* sinA = "sin(%d%s%s)";
    char* Sa = "%s+%d";
    char* S = "(%s)%s";
    char An[N] = "sin(1%s%s)", An2[N], An3[N], Sn[N] = "sin(1)+%d", Sn2[N];
    int i, j, n;
    scanf("%d", &n);
    sprintf(Sn2, Sn, n);
    strcpy(Sn, Sn2);
    for (i = 2; i <= n; i++)
    {
        sprintf(An2, An, i % 2 == 0 ? "-" : "+", sinA);
        strcpy(An, An2);
        sprintf(An2, An, i, "%s", "%s");
        strcpy(An, An2);
        sprintf(An2, Sa, An, n - i + 1);
        sprintf(An3, An2, "", "");
        sprintf(Sn2, S, Sn, An3);
        strcpy(Sn, Sn2);
        sprintf(Sn2, Sn, n - i+ 1);
        strcpy(Sn, Sn2);
    }
    printf("%s", Sn);
    return 0;
}
