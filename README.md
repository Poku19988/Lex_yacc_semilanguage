# Features
Arithmetic Operations: Supports addition (+), subtraction (-), multiplication (*), and division (/).

Conditional Statements: Supports if, else, and while loops.

Loops: Supports while and do-while loops.

Variable Assignment: Supports assignment of values to variables (single-character identifiers, both uppercase and lowercase).

Print Statement: Supports printing the value of expressions.

Exit Command: Supports an exit command to terminate the program.

# Grammar
The grammar of the language is defined in the yacc file (y.tab.c). Here is a brief overview of the grammar rules:

Program: A program consists of a list of statements.

Statements: Statements can be assignments, print statements, exit commands, loops, or conditional statements.

Expressions: Expressions can be arithmetic expressions, conditions, or factor expressions.

Conditions: Conditions are used in if and while statements and support comparison operators (<, >, ==) and logical operators (&&, ||).

# Tokens
The lexer (lex.yy.c) recognizes the following tokens:

Keywords: print, exit, while, if, else, do, for.

Operators: ++, --, +, -, *, /, =, <, >, ==, &&, ||.

Punctuation: (, ), {, }, ;.

Identifiers: Single-character identifiers (a-z, A-Z).

Numbers: Integer literals.

# How to Build and Run
Install Dependencies: Ensure you have flex and bison installed on your system.
```
sh

sudo apt-get install flex bison
```
Generate Lexer and Parser:

```
sh

flex lexer.l
bison -d parser.y
```
Compile the Code:

```
sh

gcc lex.yy.c y.tab.c -o interpreter
```

Run the Interpreter:
```
sh

./interpreter
Example Input
```
Here is an example of valid input for the interpreter:

```
a = 5;
b = 10;
print a + b;
if (a < b) {
    print a;
} else {
    print b;
}
while (a < b) {
    a = a + 1;
    print a;
}
exit;
```
Error Handling
The interpreter includes basic error handling. If an unexpected character is encountered, it will print an error message and continue parsing.

# Limitations
Single-character Identifiers: Variables must be single-character identifiers (a-z, A-Z).

No Floating-point Numbers: The interpreter only supports integer arithmetic.

Basic Error Reporting: Error handling is minimal and may not cover all edge cases.
