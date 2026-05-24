#include <stdio.h>

int main()
{
	int m, h;
	char ap;

	printf("시간,  분 그리고 오전/오후를 입력하세요(예: 12 25 A) : ");
	scanf("%d %d %c", &h, &m, &ap);

	if( (2 <= h) && (h<= 11))
	{	
		if( m >= 45)
		{
			m = m - 45;
		}

		else
		{
			m = m + 15;
			h = h -1;
	
		}
	}

	else if( (h = 12) && (ap == 'A') )
	{
		if( m >= 45)
		{ 
			m = m - 45;
		}

		else
		{
			m = m + 15;
			h = h - 1;

			ap = 'P';
		}
	}

	else if( (h = 12) && (ap == 'P'))
	{
		if( m >= 45)
		{
			m = m -45;
		}

		else
		{
			m = m + 15;
			h = h - 1;

			ap = 'A';
		}
	}

	else
	{
		if( m >= 45)
		{
			m = m - 45;
		}

		else
		{
			m = m + 15;
			h = 12;
		}
	}

	printf("%d %d %c", h, m, ap);
	
	return 0;
}
