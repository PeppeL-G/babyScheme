#lang racket/gui

(require "program.rkt")

(define (display* . args)
  (for-each (lambda (arg) (display arg) (display " ")) args)
  (newline))

(define my-canvas%
  (class canvas%
    
    (init-field program)
    
    (define/override (on-size width height)
      (send program set-size! width height))
    
    (define/override (on-event event)
      (cond ((send event moving?)
             (send program mouse-move-to (send event get-x) (send event get-y)))
            ((send event button-down? 'left)
             (send program mouse-left-down))
            ((send event button-up? 'left)
             (send program mouse-left-up))))
    
    (super-new)))

(define (baby-scheme)
  ; The model...
  (let ((program (new program%)))
    ; ...and the graphics.
    (let-values (((width height) (get-display-size)))
      (let* ((frame (new frame% [label "Baby Scheme"] [width (/ width 2)] [height (/ height 2)]))
             (menu-bar (new menu-bar% [parent frame]))
             (menu-help (new menu% [parent menu-bar] [label "Help"]))
             (menu-item-about (new menu-item% [parent menu-help] [label "About"] [callback (lambda (menu-item control-event)
                                                                                             (let ((dialog (new dialog% [label "About"] [parent frame])))
                                                                                               (new message% [parent dialog] [label "Baby Scheme is a small program developed by Peter Larsson-Green."])
                                                                                               (new message% [parent dialog] [label "Its purpose is to help new programmers to understand how pure functional programming works in a Lispish language with the help of visuall drag and drop programming."])
                                                                                               (new message% [parent dialog] [label "It's is also Peters contribution to Lisp In Summer Projects 2013."])
                                                                                               (send dialog show #t)))]))
             (canvas (new my-canvas% [parent frame] [program program] [paint-callback (lambda (canvas dc) (send program draw dc))])))
        (send program set-size! (send canvas get-width) (send canvas get-height))
        (send frame show #t)))))

(baby-scheme)