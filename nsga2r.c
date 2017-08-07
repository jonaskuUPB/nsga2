# include "rand.h"
# include "nsga2.h"

int main(int argc, char **argv)
{
	/* code */
	NSGA2Type nsga2Params;
	void *inp = NULL;
	void *out = NULL;

	nsga2Params = ReadParameters(argc, argv);

	InitNSGA2(&nsga2Params, inp, out, test_problem, "./results/");
	NSGA2(&nsga2Params, inp, out, test_problem);

	return 0;
}
