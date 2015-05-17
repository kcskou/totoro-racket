;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname totoro) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;;;;;;;;;;;;;;;;;;;;;
;; Totoro in Racket ;;
;;  By Kelvin Kou   ;;
;;    06.09.2014    ;;
;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/image)
(define GREY (make-color 141 151 106))
(define BROWN (make-color 129 101 36))
(define BEIGE (make-color 231 226 186))
(define PEN-STYLE (make-pen BROWN 2 "solid" "round" "round"))
(define sclera (circle 15 "solid" BEIGE))
(define pupil (circle 7 "solid" BROWN))
(define eye (overlay pupil sclera))
(define eyes (overlay/offset eye 106 0 eye))
(define nose (underlay
              (rectangle 40 18 0 GREY)
              (isosceles-triangle 18 95 "solid" BROWN)
              (polygon
               (list (make-posn 0 0)
                     (make-posn 5 0)
                     (make-posn 14 8)
                     (make-posn -9 8))
               "outline"
               (make-pen BROWN 5 "solid" "round" "miter"))))
(define mouth-left (beside/align
                    "top"
                    (rotate 180 (right-triangle 40 13 "solid" BEIGE))
                    (crop 370 970 50 30 (circle 500 "solid" BEIGE))))
(define mouth-middle (rectangle 60 24 "solid" BEIGE))
(define teeth-outline (place-images
                       (list 
                        (line 0 33 PEN-STYLE)
                        (line 0 46 PEN-STYLE)
                        (line 0 52 PEN-STYLE)                        
                        (line 0 46 PEN-STYLE)                        
                        (line 0 33 PEN-STYLE))
                       (list 
                        (make-posn 45 0)
                        (make-posn 82 0)
                        (make-posn 119 0)                        
                        (make-posn 156 0)                        
                        (make-posn 193 0))
                       (overlay/align/offset
                        "center" "top"
                        (line 238 0 PEN-STYLE)
                        0 -1
                        (add-curve (rectangle 238 10 0 GREY)
                                   0 0 -37 0.3
                                   238 0 37 0.3
                                   PEN-STYLE))))
(define mouth (overlay/offset
               teeth-outline
               0 0
               (beside/align
                "top"
                mouth-left
                mouth-middle
                (flip-horizontal mouth-left))))

(define ear (rotate 18 (overlay/align/offset
                        "center" "bottom"
                        (overlay/align/offset
                         "center" "bottom"
                         (ellipse 25 10 "solid" GREY)
                         0 -5
                         (isosceles-triangle 60 25 "solid" GREY))
                        0 8
                        (rectangle 8 10 "solid" GREY))))
(define whisker (line 60 13 PEN-STYLE))
(define whiskers-left (overlay/offset
                       (overlay/offset
                        whisker
                        -3 10
                        (rotate 6 whisker))
                       4 15
                       (rotate 9 (scale/xy
                                  0.9 1 whisker))))
(define whiskers (overlay/offset 
                  whiskers-left 
                  218 0 
                  (flip-horizontal whiskers-left)))
(define bodypart1 (crop 0 0 105 70 (ellipse 220 140 "solid" GREY)))
(define bodypart2 (rotate -8.5 (rectangle 40 177 "solid" GREY)))
(define bodypart3 (rectangle 95 175 "solid" GREY))
(define bodypart4 (scale/xy 1.257 1.3 (flip-vertical bodypart1)))
(define arm (rotate 75 (ellipse 145 50 "solid" GREY)))
(define arm-outline (add-curve (rectangle 50 150 0 GREY)
                               35 35 -130 1/3
                               8 139 -230 1/4
                               PEN-STYLE))
(define body-left (underlay/xy
                   (underlay/xy
                    (underlay/xy
                     (underlay/xy
                      (underlay/xy
                       (overlay/xy
                        ear
                        -20 50
                        bodypart1)
                       -27 118
                       bodypart2)
                      37 119
                      bodypart3)
                     0 293
                     bodypart4)
                    -14 162
                    arm)
                   0 160
                   arm-outline))
(define body-whole (beside 
                    body-left 
                    (flip-horizontal body-left)))
(define crescent (scale/xy 1.1 1 
                           (underlay/offset
                            (ellipse 26 30 "solid" GREY)
                            0 4
                            (crop 0 0 30 22 (circle 15 "solid" BEIGE)))))
(define belly (place-images
               (list crescent
                     crescent
                     crescent
                     (scale 0.8 crescent)
                     (scale 0.8 crescent)
                     (scale 0.8 crescent)
                     (scale 0.8 crescent))
               (list (make-posn 110 43)
                     (make-posn 65 43)
                     (make-posn 155 43)
                     (make-posn 85 70)
                     (make-posn 130 70)
                     (make-posn 45 70)
                     (make-posn 170 70))
               (ellipse 220 190 "solid" BEIGE)))

(define totoro (place-images
                (list eyes
                      (scale/xy 0.7 0.65 nose)
                      (scale/xy 0.6 0.8 mouth)
                      whiskers
                      belly)
                (list (make-posn 150 108)
                      (make-posn 150 116)
                      (make-posn 150 150)
                      (make-posn 150 118)
                      (make-posn 147 265))
                body-whole))


totoro
