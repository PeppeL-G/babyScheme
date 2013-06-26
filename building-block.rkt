#lang racket

(provide building-block%)
(require "component.rkt")

(define building-block%
  (class component%
    
    (init-field number-of-arguments name)
    
    (define/override (draw dc)
      (super draw dc)
      (send dc draw-text (string-append "(" name ")") (send this get-x) (send this get-y)))
    
    (super-new [color "yellow"])))