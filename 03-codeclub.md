# Code Club 3

We are continuing our stroll through the Prologue of HtDP2e. 

(When we have finished this stroll, you will know much of the language. Then we
will start over and talk about a more systematic way of designing programs.)


## Recap of 02

_Expressions_ are like little questions for Racket to answer. We have seen two
ways to make expressions. An expression is either:

  1. A _value_; or
  
  2. `(` _function_ _expression_<sub>1</sub> _expression_<sub>2</sub>  ... `)`

The value of the first kind of expression is itself. To evaluate the second kind
of expression, Racket first evaluates all the sub-expressions, then applies the
function to the values produced.

We also now know several kinds of value. A _value_ is either: 

  1. A number (`42`);
  2. A string (`"Hello, World."`);
  3. A "Boolean" (either `#true` or `#false`); or
  4. An image
  
And we know several built-in functions, for example:

  1. Arithmetic functions like `+`, `-`, `log` and so on;
  2. String functions like `string-append`, `string->number` and so on;
  3. Boolean functions like `and`, `or`, and `not`; and
  4. Image functions like `circle`.


## Exercises

1. How many centimetres are there in a foot? (There are 2.54 centimetres in an
   inch, and 12 inches in a foot.) 

2. How many letters are there in "Supercalifragilisticexpialidocious"? (Hint:
   remember there is a function `string-length`)
    
3. Look in the documentation for `string-ith`. What is the 10th letter of
   "antidisestablishmentarianism"?
    
   The documentation is under "*How to Design Programs* Languages", under "1
   Beginning Student".

4. Look in the documentation for `string<?`. What is `(string<? "hello" "goodbye")`?

5. What is `(and (or #true #false #false) (or #false #false))`? (Try to guess
   before entering it into Racket.) 

6. Put the following in the definitions window, and click Run (or select Run
   from one of the menus, or click ctrl-R [or command-R on a Mac]).

```scheme
(require 2htdp/image)
```

   Now try the next few. (Either in the interactions window or the definitions window.)

```scheme
(circle 20 "outline" "orange")
```

```scheme
(rectangle 10 20 "solid" "brown")
```

```scheme
(triangle 20 "solid" "darkgreen")
```

    
    
## More about images

Try the following in the definitions window:

```scheme
(require 2htdp/image)

(above
 (triangle 30 "solid" "darkgreen")
 (rectangle 10 20 "solid" "brown"))
```

(From now on, I'll leave out the `require`.)

```scheme
(beside
 (above
  (triangle 30 "solid" "darkgreen")
  (rectangle 10 20 "solid" "brown"))
 (above
  (triangle 30 "solid" "darkgreen")
  (rectangle 10 20 "solid" "brown")))
```

## Definitions

What if I want lots of trees?

What if I want to make a tree of a given height?

    
## Excerises

Here is the definition of a function to convert inches to centimetres:
```scheme
(define (inches->cm x)
    (* x 2.54))
```


1. Fill in the missing part of this definition to define a function of one
   argument, `feet->inches`, that converts feet into inches:

```scheme
(define (feet->inch x) 
    <missing>)
```

Check that your function works. Eg, 
```
(feet->inch 1)
```
should produce the number 12.

2. Define a function `feet->cm` using the functions `feet->inch` and `inch->cm`. 

3. Define a constant called `CM/INCH` whose value is 2.54 and replace 2.54 in
   the defintion of `inch->cm` with this constant.



    
## Other exercises 

(4) The earth is 24000 miles around the equator. How many meters is that? (There
    are 1.6 kilometres in a mile).

(5) The speed of light is 3&times;10<sup>8</sup> metres per second. How long
    does it take light to go around the earth?






