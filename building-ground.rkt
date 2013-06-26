#lang racket

(provide building-ground%)
(require "component.rkt")

(define building-ground%
  (class component%
    
    (define/override (draw dc)
      (super draw dc)
      (send dc draw-text "Drag the building blocks to the left here." (send this get-x) (send this get-y)))
    
    (super-new [color "red"])))