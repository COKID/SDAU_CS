#include "str.h"

int strlen(char *s)
{
	char *p = s;
	int len = 0;
	while (*p != '\0')
	{
		len++;
		p++;
	}
	return len;
}

char *strcat(char *s1, char *s2)
{
	char *p = s1, *q = s2; 
	while (*p != '\0')
		p++;
	while (*q != '\0')
	{
		*p = *q;
		p++; q++;
	}
	*p = '\0';
	return s1;

}

int strcmp(char *s1, char *s2)
{
	char *p = s1, *q = s2;
	while (*p != '\0' && *q != '\0')
	{
		if (*p > *q)
			return 1;
		else if (*p < *q)
				return -1;
		else {p++; q++;}
	}
	if (*p == '\0' && *q == '\0')
		return 0;
	if (*p != '\0')
		return 1;
	if (*q != '\0')
		return -1;
}

