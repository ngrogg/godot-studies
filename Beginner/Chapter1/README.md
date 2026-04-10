# Chapter 1: Introduction to Programming in GDScript

## Overview
OOP basics as they apply to GDScript

## Notes
### Introduction
Covers the following: <br>
* Classes
* Objects
* Statements
* Comments
* Variables
* Constants
* Operators
* Assignments
* Data types
* Methods
* Decision-making structures
* Loops
* Inheritance
* Events
* Comparisons
* Type conversions
* Reserved Words
* Messages to the console windows
* Declarations
* Calls to methods

### Statements
An order to the system.

Example statement: <br>
`print("Hello World")` <br>

In GDScript the keywords "method" and "function" are used interchangeably.

Space indent, not bracket indent.

I.E. <br>
`if (x>100):` <br>
`     print("some statement");` <br>

As opposed to: <br>
`if (x>100) {`<br>
`    print("some statement");`<br>

Statements can end with a semi-colon like above. Optional. Can be used to add multiple statements on the same line.
Not stated in book, however this should be kept consistent for readability. Either always use semi-colons to end lines or don't. Don't mix them.

Ex. `print ("Hello"); print ("World");` <br>

For readability, recommend against doing that...

### Comments
Use `#` for comments, like Python.

Ex. <br>
`# print("This line won't be read by system");`<br>
`print("This line WILL be read by system");`<br>

GoDot hotkey "control + k" to comment/uncomment lines

### Variables
A variable is a container that holds a value.

Declare a variable, assign it a value and optionally combine with other variables.

Ex. <br>
`# Declare variable`<br>
`var myAge:int;`<br>
`# Assign value to variable`<br>
`myAge = 20;`<br>
`# Add 1 to variable`<br>
`myAge = myAge + 1;`<br>


Type is optional, probably good to use for readability and documentation.
Also probably a good idea to keep it consistent like the semi-colons. Either always define type or don't.

Same with other programming conventions can't use reserved words for variables i.e. `var if`.

Variables can be several data types including int, double, float, string, char, bool, arrays or nodes.

Variables need to be declared before use i.e. `var myName:String;`.

Variables are affected by scope.

### Arrays
Function like normal arrays, store variables in an indexed list. Refer to with array and index.

Syntax: <br>
`var names = [];`<br>
`names [0] = "Paul"`<br>

Also can be declared all at once: <br>
`names = ["Joe","Fred","Mary];` <br>

Same with multidimensional arrays.

`var 2darray = [];`<br>
`2darray[0][1] = 0;`<br>
`2darray[0][2] = 0;`<br>
`print (2darray[0][1]);`<br>

Can also use a loop to iterate through array.

### Constants
Variables that don't change. Need declared at top of script. Considered best case to uppercase.

`const VARIABLE:int = 1;`

### Operators
Arithmetic operators: `+, -, *, /, %`.

Remember `%` is modulo.

If adding an int to a string variable needs cast, similiar to python.

`var item:String = "Trucks";`<br>
`var number:int = 3;`<br>
`var message:String = "I have " + str(number) " " + item;`<br>
`print(message);`<br>

Assignment operators: `=, +=, -=, *=, /=, %=`.

Comparison operators: `==, !=, >, <, >=, <=`.

### Conditional statements
if statements.

if (condition): statement <br>
else: statement

### Match statements
Case statements

`var choice:int = 1;` <br>
`match choice:` <br>
`1: print("option 1");` <br>
`2: print("option 2");` <br>
`3: print("option 3");` <br>
`_: print("default option");` <br>

A "break" statement is not required.

Use the "default" as a fail state for unexpected or out of scope choices.

### Loops
While loops

`var iterator:int = 0;`<br>
`while (iterator<10):`<br>
`    print("x = " + str(iterator)");`<br>
`    x += 1;`<br>

For loops

`for iterator in range(0,10):` <br>
`    print ("x = " + str(iterator));` <br>

### Classes
### Defining a class
### Accessing class members and variables
### Constructors
### Static members of a class
### Inheritance
### Methods and Functions
### Default parameters and return types for functions
### Scope of variables
### Events or Signals
### Workflow to create a script
### Coding convention
### A few things to remember when you create a script (checklist)
### Level Roundup
