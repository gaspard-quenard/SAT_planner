(define (problem simple_logistic)
    (:domain logistics)
    (:objects
        r1 - robot
        loc1 loc2 loc3 - location
    )

    (:init
        (adjacent loc1 loc2)
        (adjacent loc2 loc1)
        (adjacent loc2 loc3)
        (adjacent loc3 loc2)
        (at r1 loc1)
    )

    (:goal
        (and
            (at r1 loc3)
        )
    )
)