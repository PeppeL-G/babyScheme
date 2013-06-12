babyScheme
==========
My contribution to Lisp In Summer Projects. Visual drag and drop programming and
interpretation with a subset of the scheme language.

I yet haven't decided how the program is going to work in the end, but below is
a short summary of how I (at the moment) imagine it to work. This is also the
reason why the text below isn't that good written (I may change it many times
during the development). If you got any ideas of improvement, please, tell me!

Description
===========
babyScheme is a project that aims to help new programmers to understand how the
functional part of scheme works (pure functional programs consiting of expressions).
By writing code by draging and dropping building blocks, the programmers don't
have to worry about syntax errors, nice indentation, and things like that. Further
more (if all goes well), it will also be possible to follow the interpretation of
an expression by the substitution model, making it very clear for the programmer
how it's program is executed.

The bulding blocks
==================
The building blocks available will (hopefully) be:

Special forms:
 if-expression: (if condition consequense alternative)
 function definition: (define (function-name) body-expression)
 function definition: (define (function-name para1) body-expression)
 function definition: (define (function-name para1 para2) body-expression)
 function definition: (define (function-name para1 para2 para3) body-expression)

Ordinary function calls:
 Mathematical functions:
  Addition: (+ term1 term2)
  Subtraction: (- minuend subtrahend)
  ...
  
 List functions:
  Create empty list: (list)
  Insert element first: (cons element list)
  Get first element in list: (first list)
  Get rest of elements in list: (rest list)
  ...

Variables (parameters)

Atomic expressions:
 #true
 #false
 Numbers

Regarding the four different function definitions: one could instead use one
building block that would accept an arbitrary number of parameters, but since
all other building blocks excepts a fixed number of arguments, I think it will
be easier to learn the program this way (but we'll see!).

Diverse
=======
The condition in an if-expression must be an expression resulting in #true or #false
(unlike sceheme).