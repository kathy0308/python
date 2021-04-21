(define-macro (def func args body)
    `(define ,func (lambda, args, body))
)


(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define (all-three-multiples (start))
(cons-stream start
(map-stream (lambda (x) (+ x 3)))))




(define (compose-all funcs)
  'YOUR-CODE-HERE
)


(define (partial-sums stream)
  'YOUR-CODE-HERE
  (helper 0 stream)
)
