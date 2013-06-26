#lang racket

(provide component%)

(define component%
  (class object%
    
    (init-field color)
    (field [x 0] [y 0] [width 0] [height 0])
    
    (define/public (get-x)
      x)
    
    (define/public (get-y)
      y)
    
    (define/public (set-x! new-x)
      (set! x new-x))
    
    (define/public (set-y! new-y)
      (set! y new-y))
    
    (define/public (set-width! new-width)
      (set! width new-width))
    
    (define/public (set-height! new-height)
      (set! height new-height))
    
    (define/public (set-size! width height)
      (send this set-width! width)
      (send this set-height! height))
    
    (define/public (set-position! x y)
      (send this set-x! x)
      (send this set-y! y))
    
    (define/public (contains-x? x)
      (<= (send this get-x) x (+ (send this get-x) (send this get-width))))
    
    (define/public (contains-y? y)
      (<= (send this get-y) y (+ (send this get-y) (send this get-height))))
    
    (define/public (contains? x y)
      (and (send this contains-x? x)
           (send this contains-y? y)))
    
    (define/public (draw dc)
      (send dc set-brush color 'solid)
      (send dc draw-rectangle x y width height))
    
    (super-new)))