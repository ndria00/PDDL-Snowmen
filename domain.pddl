(define (domain numeric_basic)
    (:requirements :
        :typing
    )

    (:types
        location direction ball
    )

    (:predicates
        ; locations covered by snow
        (snow ?l - location)
        ; cells neighbourhood 
        (next ?from ?to - location ?dir - direction)
        ; character position
        (character_at ?l - location)
        (ball_at ?b -ball ?l - location)
        ; goal reached
        (goal)
    )
    (:functions
        (balls_in_location ?loc - location)
        (ball_size ?b - ball)
        ; how  many snowmen are completed -the idea is to remove the goal
        ; as an action because actions may not be chosen by the solver
        (completed_snowmen)
        ; the domain ranges from 1 to 4. 1 to 3 means that there is a ball
        ; of that size as top-most ball, while 4 means that a specific
        ; location is empty and a ball of whatever size may be stacked on top of it
        (smallest_ball_at ?l)
        (biggest_ball_at ?l)
    )

    ; considers player moves when no balls are in the destination cell
    (:action move_character
        :parameters 
            (?from ?to - location ?dir - direction)
        :precondition 
            (and 
                (next ?from ?to ?dir)
                (character_at ?from)
                (= (balls_in_location ?to) 0)
            )
        :effect 
            (and 
                (character_at ?to)
                (not (character_at ?from))
            )
    )

    (:action move_ball
        :parameters 
            (?b - ball ?ppos ?from ?to - location ?dir - direction)
        :precondition
           (and 
                (character_at ?ppos)
                (next ?ppos ?from ?dir)
                (next ?from ?to ?dir)
                (ball_at ?b ?from)
                (= (smallest_ball_at ?from) (ball_size ?b))
                (< (smallest_ball_at ?from) (smallest_ball_at ?to))
                ; remove the possiblity to unstack a completed snowman 
                ; - check if this is not possible in the real game (it may also be redundant)
                (< (balls_in_location ?from) 3)
            )
        :effect         
            (and
                ; move the ball
                (not (ball_at ?b ?from))
                (ball_at ?b ?to)
                ; increase number of balls in that location
                (increase (balls_in_location ?to) 1)
                (decrease (balls_in_location ?from) 1)
                
                (not (character_at ?ppos))
                (character_at ?from)

                ; always remove the snow - if present or not it does not matter
                (not (snow ?to))
                ; assign the smallest ball size when stacking a ball on top of a (possibly empty) stack
                (assign (smallest_ball_at ?to) (ball_size ?b)) ; <- stack or roll
                
                ; set biggest ball after move when the to location was not occupied and not covered by snow 
                (when (and (= (balls_in_location ?to) 0) (not (snow ?to))) (and (assign (biggest_ball_at ?to) (ball_size ?b))))
                
                ; set biggest ball after move when the to location was not occupied,
                ; it was covered by snow and the moved ball was already of size 3 
                (when (and (= (balls_in_location ?to) 0) (snow ?to) (= (ball_size ?b) 3) ) (and (assign (biggest_ball_at ?to) (ball_size ?b)))) 

                ; increase ball size when the moved ball rolls on a location that contains snow
                ; set biggest ball after move when the to location was not occupied, it was covered by snow and the moved ball was of size <= 2
                (when (and (snow ?to) ( <= (ball_size ?b) 2)) (and (increase (ball_size ?b) 1) (assign (biggest_ball_at ?to) (+ (ball_size ?b) 1) ))) ; <- roll

                ; assign default smallest and biggest size when moving a ball from a stack of size one 
                (when (and ( = (balls_in_location ?from ) 1)) (and (assign (smallest_ball_at ?from) 4)
                                                                (assign (biggest_ball_at ?from) 4))) ; <- roll

                ; unstack from pile of size 2
                (when (and (= (balls_in_location ?from ) 2) ) (and (assign (smallest_ball_at ?from) (biggest_ball_at ?from))))
                
                ; increase number of completed snowmen when stacking the third ball in some location
                (when (and (= (balls_in_location ?to) 2)) (and (increase (completed_snowmen) 1)))
            )  
    ) 

)