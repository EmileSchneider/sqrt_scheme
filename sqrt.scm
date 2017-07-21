; this is a scheme implementation of the newton aproximation algorithm for calculating the square root of a given number

#|
it works the following way, first take a number x from which you want to calculate the sqrt
then you want to make a guess what the sqrt COULD be, that is our guess
after that we calculate the next guess which will be a better approximation
to do that we average our guess with the quotient of our guess and radicant (the radicant is the number we want to know the
sqrt of.
we can repeat this step until we are happy with our approximation.
|#

;defines a function to square a given value
(define (square x) 
  (* x x)) 

(define (average x y) ;defines a function to calculate the average of two values
  (/ (+ x y) 2)) 

(define (improve_guess guess x) ;a guess is improves by averagin it with a the quotient of the guess and x
  (average guess (/ x guess)))

(define (good-enough? guess x) ;we only want to calculate the squareroot aproximatly (due to limited time and ressources)
  (< (abs (- (square guess) x)) 0.01) ;so if we check if the absolute difference between the sqaure of the square root and x is less than 0.01 we say, thats good enough :) and stop. 

(define (sqrt-iter guess x) ;what this function does is actually use all of our procedures to finally calc. the sqrt
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) ; LOOK AT THAT! it is RECURSIVE!!! OMG :O. Yeah, the function calls itself isn't that amazing?
		 x)))
