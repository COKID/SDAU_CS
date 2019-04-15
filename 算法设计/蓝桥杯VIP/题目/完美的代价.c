#include <stdio.h>

void swap(char* a, char* b)
{
    char c = *a;
    *a = *b;
    *b = c;
}

int find(char* p, char* q)
{
    char* o = q - 1;
    while (o > p && *o != *p) o--;
    return o - p;
}

int rfind(char*p, char* q)
{
    char* o = q + 1;
    while (o < p && *o != *p) o++;
    return p - o;
}

int main()
{
    int i, j, k, len, count[26] = {0};
    char str[8000];
    scanf("%d", &len);
    scanf("%s", str);
    for (i = 0; i < len; i++)
        count[str[i]-'a']++;
    int odd = 0;
    for (i = 0; i < 26; i++)
        if (count[i] % 2 == 1)
            odd++;
    if (odd <= 1)
    {
        int change = 0;
        for (i = 0; i < len / 2; i++)
        {
            if (count[str[i]-'a'] == 1)
                break;
            count[str[i]-'a'] -= 2;
            k = find(str + i, str + len - i);
            for (j = i + k; j < len - i - 1; j++)
            {
                swap(str + j, str + j + 1);
                change++;
            }
        }
        if (i != len / 2)
        {
            for (i = len - i - 1; i > len / 2; i--)
            {
                k = rfind(str + i, str + len - i - 1);
                for (j = i - k; j > len - i - 1; j--)
                {
                    swap(str + j, str + j - 1);
                    change++;
                }
            }
        }
        printf("%d", change);
    }
    else
    {
        printf("Impossible");
    }
    return 0;
}
