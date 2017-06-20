## 01 

Perhaps surprisingly, there was no confusion at all about prefix notation for
arithmetic expressions.

I suspect there's going to be a lot of confusion about the parentheses and the
difference between, for example, `12` and `(12)`. 

## 02

Extending values to strings, booleans, and images.

It's going to be hard to choose good examples: People have very different domain
knowledge, and the domain challenge can get in the way of learning programming.

It's going to be hard for individuals to attend every class. For people who have
a full-time job, this will always be a lower priority than something else -- and
there is always something else.

Ideas:

 - We could drop to one (lunchtime) per week. This seems too little to maintain
   momentum, but perhaps we will end up here eventually, and perhaps that's okay
   if there are projects
   
 - We could change from formal + informal, to each class being the same, a
   mixture of new material and practice, but where we cover the new material in
   both, possibly staggered. (Eg, in class 1 we do A, in class 2 A + B, in class
   3 B + C, in class 4 C + D, and so on.)
   
On reflection, I think the major difficulty will be "breaking down"
problems. Given a task, there is the whole "how do I even get started" problem?

When should I introduce testing? Maybe as soon as definitions are introduced?

## 03 (4)

Down to four this week. Not entirely sure how to manage the trade-off between:
losing people because we're going too fast, and losing people because we're not
doing interesring things. 

It turned out that digressing into Excel was very helpful -- not only is it
relevant to many people, but also it helps people understand what Racket is
doing.

## 04
    
Back up to ~ 10 people this week. Yay!

Started by demonstrating two simple programs: one to draw a
house-next-to-a-tree, and the other to show a bouncing ball. My plan was to
generate enthusiasm by showing "where this is all going".

Many people immediately decided to play around with the bouncing ball program --
changing magic numbers, etc, and seeing the effect. There was quite a bit of
enthusiasm about this. But at some point most people changed the program
sufficiently to cause a syntax error, from which they were not able to
recover. I think some people were also quite lost.

At that point, we switched back to exploring 2htdp/image, with the task of
drawing a tree, and binding the value to a name. That was a good plan, but only
after people had deleted all the bouncing ball code. 

Ended with definitions of constants. Interestingly, in starting with the
template:

```scheme
(define TREE ... )
```
many people started to complete it by patterning after `circle` from the image
library:

```scheme
(define TREE "solid" "red" ...)
```

# 05 Functions!

We started with the comment-based function statement from the beginning. It was
very helpful even for live-coding, because it explains what is going to happen
before the code.

Some challenges that arose:
    - understanding that the formal argument to a function is just a placeholder (and
      not, for example, a global variable)
    - tendency to drop back to non-syntactically valid forms when calling
      user-defined functions
      
Plan: lots of examples and practice!


# 06 Conditionals and repetition

We used `animate` from `2htdp/universe` to explore doing something over and
over.

Introduced `if`, and used it to define a version of `max`. That was reasonably
clear.

Some people with experience of other languages used a different syntax
occasionally, but it seemed to be straightforward to return to Racket syntax.

