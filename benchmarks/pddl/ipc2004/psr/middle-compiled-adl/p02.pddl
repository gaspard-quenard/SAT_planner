(define (problem psr-s23-n2-l3-f70)
  (:domain psr)
  (:objects cb1 cb2
            sd1 sd2 sd3 sd4 sd5 sd6 sd7 sd8 sd9 sd10 sd11 - DEVICE
            l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 - LINE
  )
  (:init
    (breaker cb1)
    (breaker cb2)
    (closed cb1)
    (closed cb2)
    (closed sd1)
    (closed sd2)
    (closed sd3)
    (closed sd6)
    (closed sd7)
    (closed sd8)
    (closed sd9)
    (closed sd10)
    (closed sd11)
    (faulty l1)
    (faulty l2)
    (faulty l3)
    (faulty l4)
    (faulty l7)
    (faulty l8)
    (faulty l9)
    (faulty l11)
    (ext l1 sd1 side1)
    (ext l1 cb1 side2)
    (con sd1 side1 cb1 side2)
    (con cb1 side2 sd1 side1)
    (ext l2 sd6 side2)
    (ext l2 sd1 side2)
    (con sd6 side2 sd1 side2)
    (con sd1 side2 sd6 side2)
    (ext l2 sd2 side2)
    (con sd2 side2 sd1 side2)
    (con sd1 side2 sd2 side2)
    (con sd2 side2 sd6 side2)
    (con sd6 side2 sd2 side2)
    (ext l3 sd4 side1)
    (ext l3 sd2 side1)
    (con sd4 side1 sd2 side1)
    (con sd2 side1 sd4 side1)
    (ext l3 sd5 side2)
    (con sd5 side2 sd2 side1)
    (con sd2 side1 sd5 side2)
    (con sd5 side2 sd4 side1)
    (con sd4 side1 sd5 side2)
    (ext l3 sd3 side2)
    (con sd3 side2 sd2 side1)
    (con sd2 side1 sd3 side2)
    (con sd3 side2 sd4 side1)
    (con sd4 side1 sd3 side2)
    (con sd3 side2 sd5 side2)
    (con sd5 side2 sd3 side2)
    (ext l4 sd4 side2)
    (ext l4 sd3 side1)
    (con sd4 side2 sd3 side1)
    (con sd3 side1 sd4 side2)
    (ext l5 sd7 side1)
    (ext l5 cb2 side2)
    (con sd7 side1 cb2 side2)
    (con cb2 side2 sd7 side1)
    (ext l6 sd8 side1)
    (ext l6 sd7 side2)
    (con sd8 side1 sd7 side2)
    (con sd7 side2 sd8 side1)
    (ext l7 sd9 side1)
    (ext l7 sd8 side2)
    (con sd9 side1 sd8 side2)
    (con sd8 side2 sd9 side1)
    (ext l8 sd10 side1)
    (ext l8 sd9 side2)
    (con sd10 side1 sd9 side2)
    (con sd9 side2 sd10 side1)
    (ext l9 sd11 side2)
    (ext l9 sd10 side2)
    (con sd11 side2 sd10 side2)
    (con sd10 side2 sd11 side2)
    (ext l10 sd5 side1)
    (ext l10 sd11 side1)
    (con sd5 side1 sd11 side1)
    (con sd11 side1 sd5 side1)
    (ext l11 earth side2)
    (ext l11 sd6 side1)
    (con earth side2 sd6 side1)
    (con sd6 side1 earth side2)
  )
  (:goal
    (and
      (fixed)
      (forall (?b - DEVICE) (not (affected ?b)))
      (fed l5)
      (fed l6)
    )
  )
)
