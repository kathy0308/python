(define (rle s)
  (define (rle-helper prev len stream)
        (cond
              ((null? stream) (cons-stream (list prev len) nil))
              ((= prev (car stream)) (rle-helper prev (+ len 1) (cdr-stream stream)))
              (else
                (cons-stream (list prev len) (rle-helper (car stream) 0 stream)))
        )
    )
    (if (null? s) nil
      (rle-helper (car s) 0 s)
    )
)

(define (group-by-nondecreasing s)
(define (rest-stream len lst)
  (if (<= len 0) lst
      (cdr-stream (rest-stream (- len 1) lst))))
  (define (helper lst)
    (cond ((null? (cdr-stream lst)) (list (car s)))
          ((> (car lst) (car (cdr-stream lst)))
           (cons (car lst) nil))
          (else (cons (car lst)
            (helper (cdr-stream lst))))))
  (if (null? s) s
    (begin
        (define p (helper s))
        (cons-stream p (group-by-nondecreasing (rest-stream (length p) s))))))


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))
