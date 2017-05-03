> The Analytical Engine has no pretensions whatever to originate anything. It
> can do whatever we know how to order it to perform.
> — *Ada Lovelace (d. 1852)*


* Installing Racket

* Finding the textbook

* Overview

  - Alternating lessons and "code club"
  - First few weeks follow the Prologue, mostly show-and-tell
  
* Project ideas



Études
------

```scheme
(+ 2 2)
```

```scheme
(* 3 3)
```

```scheme
(- 4 2)
```

```scheme
(/ 6 2)
```

```scheme
(sqr 3)
```

```scheme
(sqrt 49)
```

```scheme
(expt 2 3)
```

```scheme
(sin 0)
```

```scheme
(cos pi)
```

```scheme
(+ 2 (+ (* 3 3) 4))
```

```scheme
> (+ 2 (+ (* 3 (/ 12 4)) 4))
```

```scheme
(+ (* 5 5) (+ (* 3 (/ 12 4)) 4))
```

```scheme
(+)
```

```scheme
(*)
```

Compute the sum of 10, 20 and 30.

Multiply 48&thinsp;384 by 2&thinsp;091.

Divide a billion by a thousand. 

The speed of light is 3&times;10<sup>8</sup> m/s; it is 93&nbsp;million miles
from the earth to the sun; and a mile is about 8/5&nbsp;km. How long does it
take the light from the sun to reach the earth?

What is 37.5 degrees Celsius in Fahrenheit?

Can Racket cope with the number one Googol?




```scheme
"Hello, World."
```
	
```scheme
(string-length "Hello, World")
```
	
```scheme
(string-append "Hello" "World")
```

```scheme
(string-append "Hello" ", " "World)
```

```scheme
(string-length "Hello, World")
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




# Summary

Values and expressions

Is this programming?

