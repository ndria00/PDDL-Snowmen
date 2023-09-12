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
    )

    ; considers player moves when no balls are in the destination cell
    (:action move_character
        :parameters 
            (?from ?to - location ?dir - direction)
        :precondition 
            (and 
                (next ?from ?to ?dir)
                (character_at ?from)
                (= (balls_in_location ?to) 0
                )
            )
        :effect 
            (and 
                (character_at ?to)
                (not character_at ?from)
            )
    )

    (:action move_ball
        :parameters 
            (?b - ball ?ppos ?from ?to - location ?dir direction)
        :precondition
           (and 
                (character_at ?ppos)
                (next ?ppos ?from ?dir)
                (next ?from ?to ?dir)
                (ball_at ?b ?from)
                (smallest_ball_at ?b ?from)
                (< (smallest_ball_at ?from) (smallest_ball_at ?to))
            )
        :effect         
            (and
                ; move the ball
                (not (ball_at ?b ?from))
                (ball_at ?b ?to)
                ; increase number of balls in that location
                (increase (balls_in_location ?to) 1)
                ; always remove the snow - if present or not it does not matter
                (not (snow ?to))

                ; increase ball size if needed
                (when (and (snow ?to) ( < (ball_size ?b)) 2) ((increase (ball_size ?b) 1)))
                
                ; decrease the smallest ball size when stacking another ball on top
                (when ( > (balls_in_location ?to ) 0) (assign (smallest_ball_at ?to) (ball_size ?b)))
                
                ; assign default smallest size when moving a ball from a stack of size one 
                (when ( = (balls_in_location ?to ) 1) (assign (smallest_ball_at ?to) 4))
            )  
    )

    ; (:action goal
    ;     :parameters (location ?l1)
    ;     :precondition (and (= (balls_in_location) 3))
    ;     :effect (and goal)
    ; )
    

)