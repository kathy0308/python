(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
 (car (cdr s))
)

(define (caddr s)
 'YOUR-CODE-HERE
 (car (cddr s))
)

(define (sign num)
  'YOUR-CODE-HERE
 (cond
  ((< num 0) -1)
  ((= num 0) 0)
  ((> num 0) 1))
)

(define (square x) (* x x))

(define (pow x y)
  (cond
    ((= y 0) 1)
    ((odd? y) (* x (pow x (- y 1))))
    (else (square (pow x (quotient y 2))))
  )
)


(define (unique s)
  'YOUR-CODE-HERE
  (if (null? s) '()
(cons (car s) (unique (filter (lambda (x) (not (equal? x (car s))))
(cdr s)))))
)



(define (replicate x n)
(define (helper x n so-far)
   (if (= n 0)
     so-far
     (helper x (- n 1) (append so-far (list x)))))
 (helper x n nil)

  )


(define (accumulate combiner start n term)
(if (= n 0)
   start
   (accumulate combiner (combiner (term n) start) (- n 1) term))

)


(define (accumulate-tail combiner start n term)
(if (= n 0)
 start
 (accumulate combiner (combiner (term n) start) (- n 1) term))
)


(define-macro (list-of map-expr for var in lst if filter-expr)
`(map (lambda (,var) ,map-expr)(filter (lambda (,var) ,filter-expr), lst))
)
