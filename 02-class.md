# Code Club

## Exercises

* Compute the sum of 10, 20 and 30.

* Multiply 48&thinsp;384 by 2&thinsp;091.

* Divide a billion by a thousand. 

* Try evaluating `1/2` (just as written, not `(/ 1 2)`). What about
  `2/3`? What about `2 / 3`? What's going on?

* The speed of light is 3&times;10<sup>8</sup> m/s; it is 93&nbsp;million miles
  from the earth to the sun; and a mile is about 8/5&nbsp;km. How long does it
  take the light from the sun to reach the earth?
  
  (Try to do this all in one expression.)

* Temperatures in Celsius, C, can be converted to Fahrenheit, F, with the
  following formula: C = (5/9)&times;(F&minus;32). What is 37.5 degrees Celsius in
  Fahrenheit?

* What is the difference between `12` and `(12)`? What happens if you ask Racket
  to evaluate each? Can you explain the error message?

## Recap of 01

We saw two ways to make _expressions_. Either:

  1. A _value_; or
  
  2. `(` `op` `arg`<sub>1</sub> `arg`<sub>2</sub> ... `)`

where the `arg`s are also expressions. And so far, "a value" has meant "a
number". (This is not the whole truth!)


## Other kinds of values

1. Numbers (`42`)
2. Strings (`"Hello, World."`)
3. Booleans (`#true`, `#false`)
4. Images


## Other kinds of function

Try the following:

```scheme
"Hello, World."
```
	
```scheme
(string-length "Hello, World.")
```
	
```scheme
(string-append "Hello" "World.")
```

```scheme
(string-append "Hello" ", " "World" ".")
```

```scheme
(string-length "Hello, World.")
```

```scheme
(string=? "Hello" "World")
```

```scheme
(string=? "Hello" "hello")
```

```scheme
(string=? "Hello" "Hello ")
```


```scheme
(number->string 42)
```

```scheme
(= 1 2)
```
	
```scheme
(= 2 2)
```
	
```scheme
(> 2 1)
```
	
```scheme
(and #true #false)
```

```scheme
(or #true #false #false)
```

