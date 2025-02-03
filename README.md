# Lex_yacc_semilanguage
A compiler designed using lex and yacc ,that compiles a programming language with common operations
Overview
This project is an implementation of a simple interpreter using Flex (fast lexical analyzer generator) and Bison (parser generator). The interpreter supports basic arithmetic operations, variable assignments, and control flow statements such as if, while, do-while, and for loops. Additionally, it includes commands to print values and exit the program.

Files
lexer.l: The Flex file containing the lexical analyzer definitions.

parser.y: The Bison file containing the grammar and parser rules.

main.cpp: The main C++ file to initialize and execute the parser.

Requirements
Flex

Bison

GCC (GNU Compiler Collection)

Installation
Install Flex and Bison:

sh
sudo apt-get install flex bison
Compile the Lexer and Parser:

sh
flex lexer.l
bison -d parser.y
g++ -o interpreter lex.yy.c parser.tab.c main.cpp -lfl
Usage
Run the Interpreter:

sh
./interpreter
Input Program:

You can input a program directly into the interpreter. Below is an example:

cpp
x = 5;
y = 10;
print x + y;
if (x < y) {
    print y - x;
}
exit;
Grammar Rules
The interpreter supports the following grammar rules:

Keywords: print, exit, while, if, else, do, for

Operators: ++, --, +, -, *, /, =, <, >, ==, &&, ||

Symbols: (, ), {, }, ;

Identifiers: [a-zA-Z]

Numbers: [0-9]+

Example
Here's an example program:

cpp
x = 3;
y = 4;
z = x + y * 2;
print z; // Outputs: 11
if (z > 10) {
    print "Greater than 10";
} else {
    print "Less than or equal to 10";
}
exit;
Functions
Lexical Analyzer: Defined in lexer.l to tokenize the input.

Parser: Defined in parser.y to parse the tokens and build the abstract syntax tree.

Symbol Table: Maintained as an array to store variable values.

Control Flow: Implemented using various parser rules.

Error Handling
Errors are reported using the yyerror function which prints error messages to stderr.
