# Code Club 3

We are continuing our stroll through the Prologue of HtDP2e. 

(When we have finished this stroll, you will know much of the language. Then we
will start over and talk about a more systematic way of designing programs.)


## Recap of 02

_Expressions_ are little questions for Racket to answer. We saw two ways to make
expressions. An expression is either:

  1. A _value_; or
  
  2. `(` _function_ _expression_<sub>1</sub> _expression_<sub>2</sub>  ... `)`

The value of the first kind of expression is itself. To evaluate the second kind
of epression, Racket first evaluates all the sub-expressions, then applies the
function to the values produced. 

We also now know several kinds of value. A _value_ is either: 

  1. A number (`42`);
  2. A string (`"Hello, World."`);
  3. A "Boolean" (either `#true` or `#false`); or
  4. An image


## Études

1. Convert 5 feet to inches. (There are 12 inches in a foot.)

2. Convert 5 feet 7 inches to inches.

3. Convert 5 feet 7 inches to centimetres. (There are 2.54 centimetres in an
   inch.) Can you do this in one expression, using your expressions from (1) and
   (2)?

4. How many letters are there in "Supercalifragilisticexpialidocious" ? (Hint:
   remember there is a function `string-length`)
    
5. Look in the documentation for `string-ith`. What is the 10th letter of
   "antidisestablishmentarianism"?
    
   The documentation is under "*How to Design Programs* Languages", under "1
   Beginning Student".

6. Look in the documentation for `string<?`. What is `(string<? "hello" "goodbye")`?

7. What is `(and (or #true #false #false) (or #false #false))`? (Try to guess
   before entering it into Racket.) 

8. In the current language we are using, Beginning Student, the function `+` (as
   in, for example, `(+ 2 3)`) must take at least two arguments. In the "full"
   language it can take any number of arguments, including one or none.
    
   If you wanted to give a meaning to `+` on one argument, what would it be?
   That is, what do you think `(+ 2)` *should* be?
    
   What do you think the sum of no numbers should be? (That is, what would you
   want from `(+)`?)
        
   (Note that both of those will give an error in our current language.)
    
    










## Other exercises 

(4) The earth is 24000 miles around the equator. How many meters is that? (There
    are 1.6 kilometres in a mile).

(5) The speed of light is 3&times;10<sup>8</sup> metres per second. How long
    does it take light to go around the earth?






