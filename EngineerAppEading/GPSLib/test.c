# include <math.h>
# include "test.h"
double dValue;
double GetValue(double dIndex)
{
	double i;
	i = sqrt(dIndex)+1.0;
	return i;
}

unsigned int wgtochina_lb(int wg_flag, unsigned int wg_lng, unsigned int wg_lat, int wg_heit,  int wg_week, unsigned int wg_time, unsigned  int *china_lng, unsigned int *china_lat)
{
	double dGps;
	dGps = GetValue(wg_heit);

	float tmp_lng = wg_lng/1024;
	float tmp_lat = wg_lat/1024;
	*china_lng = (int)(tmp_lng*1000);
	*china_lat = (int)(tmp_lat*1000);

	return 0;
}

