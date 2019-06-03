/* Example of peforming a chi-square test.  Create a table
with a column specifying the observed vehicle type (class) */
DATA Vehicle;
	INPUT Vehicle_Type $ City $;
	datalines;
Car Toronto
Car Brampton
Truck Toronto
Car Hamilton
Van Hamilton
Bus Toronto
Van Toronto
Car Brampton
Car Toronto
Car Toronto
Truck Hamilton
Car Toronto
Van Brampton
Car Brampton
Truck Brampton
Truck Toronto
Car Hamilton
Car Toronto
Car Toronto
Bus Hamilton
Car Hamilton
Truck Brampton
Car Toronto
Truck Toronto
Car Brampton
Car Hamilton
Van Hamilton
Van Toronto
Bus Brampton
Car Hamilton
Truck Hamilton
Car Toronto
Truck Brampton
Truck Brampton
Bus Brampton
Bus Toronto
Bus Toronto
Bus Hamilton 
Van Hamilton
Van Toronto
Car Toronto
Truck Toronto
Car Toronto
Car Brampton
Car Brampton
Truck Hamilton
Truck Hamilton
Car Hamilton
Car Brampton
Car Brampton
;

/*Can now do the chisquare test.  Create a table
of frequency counts for each vehicle type and compare
this to a test proportion distribution.  Note that
in the test proportions, the percentages are given
in alphabetical order for each instance of the class v
variable (ie. Bus Car Truck and Van in that order).  From
the results, the test proportions fall statistically within
the expected proportions of vehicles (ie. no difference
from expected proportions).*/	
PROC FREQ DATA=Vehicle;
 TABLES Vehicle_Type / CHISQ testp = (0.1 0.5 0.3 0.1);
RUN;

/* Now let's see if there is a relationship between
vehicle type and the city that type of vehicle is from
(two-way chisquare test). If significance is found, then
vehicle type and city are not independent variables from
one another and they do depend on each other in some way.
Don't immediately see any obvious dependence, but more
data may be required to determine conclusively. */
PROC FREQ DATA=Vehicle;
 TABLES Vehicle_Type*City / CHISQ;
RUN;


/*Because we're dealing with a small sample size for
each category, let's try using Fisher's exact test
instead.  This test also doesn't show any real 
dependence between vehicle type and city from the data. */
PROC FREQ DATA=Vehicle;
 TABLES Vehicle_Type*City / FISHER;
RUN;
	
