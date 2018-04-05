/*
* Description: Flex specification for a lexical anaylyzer for a simple calculator language.
* 
*
*
*/

digit		[0-9]
alpha		[a-zA-z]
PLUS		[+]
MINUS		[-]
MULT		[*]
DIV		[/]
L_PAREN		[(]
R_PAREN		[)]
EQUAL		[=]
EX		[!]
SPACE		[ \t]*
NEWLINE		[\n]
DECIMAL_NUM	((\.{digit}+)|({digit}+(\.{digit}*)))
	int num_ints = 0, num_ops = 0, num_pars = 0, num_eq = 0;

%%
{digit}		++num_ints;
{DECIMAL_NUM}	++num_ints;
{PLUS}		++num_ops;
{MINUS}		++num_ops;
{MULT}		++num_ops;
{DIV}		++num_ops;
{L_PAREN}	++num_pars;
{R_PAREN}	++num_pars;
{EQUAL}		++num_eq;
{SPACE}		{}
{NEWLINE}	{}
.		printf("ERROR: invalid character inputted\n"); exit(0);
%%

main(int argc, char** argv)
{
  if(argc >= 2)
  {
    yyin = fopen(argv[1], "r");
    if(yyin == NULL)
    {
      yyin = stdin;
    }
  }
  else
  {
     yyin = stdin;
  }
  yylex();
  printf("# of digits = %d, # of operators = %d, # of paraentheses = %d, # of equal signs = %d\n", num_ints, num_ops, num_pars, num_eq);
}
