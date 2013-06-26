#lang racket

(require "building-blocks-field.rkt")
(require "building-ground.rkt")

(provide program%)
(require "component.rkt")

; +----------+------------ +
; | Building | Definitions |
; |  blocks  +-------------+
; |          | Expression  |
; +----------+-------------+

(define program%
  (class component%
    
    (field (building-blocks (new building-blocks-field%))
           (definitions-ground (new building-ground%))
           (interaction-ground (new building-ground%)))
    
    (define/public (mouse-move-to x y)
      "")
    
    (define/public (mouse-left-down)
      "")
    
    (define/public (mouse-left-up)
      "")
    
    (define/override (set-size! width height)
      (super set-size! width height)
      (send building-blocks set-size! (* width 1/4) height)
      (send definitions-ground set-size! (* width 3/4) (* height 1/2))
      (send interaction-ground set-size! (* width 3/4) (* height 1/2))
      
      (send definitions-ground set-x! (* width 1/4))
      (send interaction-ground set-position! (* width 1/4) (* height 1/2)))
    
    (define/override (draw dc)
      (send building-blocks draw dc )
      (send definitions-ground draw dc)
      (send interaction-ground draw dc))
    
    (super-new [color "green"])))