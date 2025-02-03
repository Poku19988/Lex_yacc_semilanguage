%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
void yyerror(char *s);
int yylex();
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {
    int num;
    char id;
}
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%start program
%token <num> number
%token <id> identifier
%token print exit_command while_kw if_kw else_kw do_kw for_kw
%token inc dec plus minus mul divv assign lt gt eq and or lparen rparen lbrace rbrace semicolon

%type <num> program stmt stmt_list exp term factor condition
%type <id> assignment
%left and
%left or

%%

program:
    stmt_list { $$ = 0; }
    ;

stmt_list:
    stmt stmt_list
    | { $$ = 0; }
    ;

stmt:
    assignment semicolon { $$ = 0;}
    | print exp semicolon       { printf("Printing: %d\n", $2); { $$ = $2; }}
    | exit_command semicolon    { exit(EXIT_SUCCESS);{ $$ = 0; } }
    | while_kw lparen condition rparen lbrace stmt_list rbrace { 
        while ($3) { 
            yyparse();  
        }
        $$ = 0; 
    }
    | do_kw lbrace stmt_list rbrace while_kw lparen condition rparen semicolon { $$ = 0;}
    | if_kw lparen condition rparen lbrace stmt_list rbrace %prec LOWER_THAN_ELSE { $$ = 0;}
    | if_kw lparen condition rparen lbrace stmt_list rbrace %prec LOWER_THAN_ELSE else_kw lbrace stmt_list rbrace { $$ = 0;}
    | for_kw lparen assignment semicolon condition semicolon assignment rparen lbrace stmt_list rbrace { $$ = 0;}
    ;

assignment:
    identifier assign exp       { updateSymbolVal($1, $3); $$ = $3;}
    ;

condition:
    exp lt exp                  { $$ = $1 < $3; }
    | exp gt exp                { $$ = $1 > $3; }
    | exp eq exp                { $$ = $1 == $3; }
    | condition and condition   { $$ = $1 && $3; }
    | condition or condition    { $$ = $1 || $3; }
    ;

exp:
    exp plus term               { $$ = $1 + $3; }
    | exp minus term            { $$ = $1 - $3; }
    | term                      { $$ = $1; }
    ;

term:
    term mul factor             { $$ = $1 * $3; }
    | term divv factor           { $$ = $1 / $3; }
    | factor                    { $$ = $1; }
    ;

factor:
    number                      { $$ = $1; }
    | identifier                { $$ = symbolVal($1); }
    | lparen exp rparen         { $$ = $2; }
    ;

%%

int computeSymbolIndex(char token) {
    if (islower(token)) return token - 'a' + 26;
    if (isupper(token)) return token - 'A';
    return -1;
}

int symbolVal(char symbol) {
    return symbols[computeSymbolIndex(symbol)];
}

void updateSymbolVal(char symbol, int val) {
    symbols[computeSymbolIndex(symbol)] = val;
}

int main(void) {
    for (int i = 0; i < 52; i++) symbols[i] = 0;
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
