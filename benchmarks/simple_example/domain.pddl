;Header and description

(define (domain logistics)

    (:requirements :strips :typing)

    (:types
        robot location
    )

    (:predicates ;todo: define predicates here
        (at ?r - robot ?l - location) ; Robot is at location
        (adjacent ?l1 ?l2 - location) ; location ?l1 is adjacent ot ?l2
    )

    (:action move
        :parameters (?r - robot ?loc_from - location ?loc_to - location)
        :precondition (and (at ?r ?loc_from) (adjacent ?loc_from ?loc_to))
        :effect (and (not (at ?r ?loc_from)) (at ?r ?loc_to))
    )

)