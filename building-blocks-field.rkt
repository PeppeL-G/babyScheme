#lang racket

(provide building-blocks-field%)
(require "component.rkt")
(require "building-block.rkt")

(define building-blocks-field%
  (class component%
    
    (field (building-blocks (list
                             (new building-block% [name "+"])
                             (new building-block% [name "-"])
                             (new building-block% [name "*"])
                             (new building-block% [name "/"]))))
    
    (define/override (set-size! width height)
      (super set-size! width height)
      (for-each (lambda (block)
                  (send block set-width! width)) building-blocks))
    
    (define/override (draw dc)
      (super draw dc)
      (for-each (lambda (building-block)
                                  (send building-block draw dc)
                                  ) building-blocks))
    
    (super-new [color "blue"])
    
    (let ((y (send this get-y)))
      (for-each (lambda (block)
                  (send block set-position! 0 y)
                  (send block set-height! 30)
                  (set! y (+ y 30)))
                building-blocks))))