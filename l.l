%{
#include "y.tab.h"
void yyerror(char *s);
%}

%%
"print"                 { return print; }
"exit"                  { return exit_command; }
"while"                 { return while_kw; }
"if"                    { return if_kw; }
"else"                  { return else_kw; }
"do"                    { return do_kw; }
"for"                   { return for_kw; }
"++"                    { return inc; }
"--"                    { return dec; }
"+"                     { return plus; }
"-"                     { return minus; }
"*"                     { return mul; }
"/"                     { return divv; }
"="                     { return assign; }
"<"                     { return lt; }
">"                     { return gt; }
"=="                    { return eq; }
"&&"                    { return and; }
"||"                    { return or; }
"("                     { return lparen; }
")"                     { return rparen; }
"{"                     { return lbrace; }
"}"                     { return rbrace; }
";"                     { return semicolon; }
[a-zA-Z]                { yylval.id = yytext[0]; return identifier; }
[0-9]+                  { yylval.num = atoi(yytext); return number; }
[ \t\n]                 { /* skip whitespace */ }
.                       { yyerror("Unexpected character"); }

%%
int yywrap(void) { return 1; }
