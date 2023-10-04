(define (domain numeric_basic)
    (:requirements :
        :typing
        :negative-preconditions
        :equality
        :disjunctive-preconditions
        :conditional-effects
        :action-costs
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
        (total-cost)
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

    (:action move_ball_on_snow
        :parameters 
            (?b - ball ?ppos ?from ?to - location ?dir - direction)
        :precondition
           (and 
                (character_at ?ppos)
                (next ?ppos ?from ?dir)
                (next ?from ?to ?dir)
                (ball_at ?b ?from)
                (= (smallest_ball_at ?from) (ball_size ?b))
                ; (< (smallest_ball_at ?from) (smallest_ball_at ?to))
                (snow ?to)
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
                
                ; move the character only when he is not in front of a partially-completed snowman
                (when (and (< (balls_in_location ?from) 2)) (and (not (character_at ?ppos)) (character_at ?from)))

                ; always remove the snow 
                (not (snow ?to))
                
                ; set biggest ball after move when the to location was not occupied,
                ; it was covered by snow and the moved ball was already of size 3 
                (when (and (= (ball_size ?b) 3)) (and (assign (biggest_ball_at ?to) (ball_size ?b))
                                                      (assign (smallest_ball_at ?to) (ball_size ?b)))) 

                ; increase ball size when the moved ball rolls on a location that contains snow
                ; set biggest ball after move when the to location was not occupied, it was covered by snow and the moved ball was of size <= 2
                ; (when (and ( <= (ball_size ?b) 2)) (and (assign (biggest_ball_at ?to) (+ (ball_size ?b) 1))
                ;                                         (assign (smallest_ball_at ?to) (+ (ball_size ?b) 1))
                ;                                         (increase (ball_size ?b) 1)))

                (assign (biggest_ball_at ?to) (+ (ball_size ?b) 1))
                (assign (smallest_ball_at ?to) (+ (ball_size ?b) 1))
                (increase (ball_size ?b) 1)

                ; assign default smallest and biggest size when moving a ball from a stack of size one 
                (when (and ( = (balls_in_location ?from ) 1)) (and (assign (smallest_ball_at ?from) 4)
                                                                (assign (biggest_ball_at ?from) 4)))
                ; unstack from pile of size 2
                (when (and (= (balls_in_location ?from ) 2)) (and (assign (smallest_ball_at ?from) (biggest_ball_at ?from))))
                
                ; when breaking down a completed snowman the smallest balls in from becomes of size 2 while
                ; the biggest becomes of size 3. Of course the number of completed snomen must be decreased
                ; (when (and (= (balls_in_location ?from ) 3)) (and (assign (completed_snowmen) (- (completed_snowmen) 1))
                ;                                              (assign (smallest_ball_at ?from) 2)
                ;                                              (assign (biggest_ball_at ?from) 3)))
                (increase (total-cost) 1)
            )  
    )

    (:action move_ball_on_snowman
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
                (not (snow ?to))
                (>= (balls_in_location ?to) 1)
                (<= (ball_size ?b) 2)
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
                
                ; move the character only when he is not in front of a partially-completed snowman
                (when (and (< (balls_in_location ?from) 2)) (and (not (character_at ?ppos)) (character_at ?from)))
                
                ; assign the smallest ball size when stacking a ball on top of a (possibly empty) stack
                (assign (smallest_ball_at ?to) (ball_size ?b))
                
                ; set biggest ball after move when the to location was not occupied and not covered by snow 
                ; (when (and (= (balls_in_location ?to) 0)) (and (assign (biggest_ball_at ?to) (ball_size ?b))))
                
                ; assign default smallest and biggest size when moving a ball from a stack of size one 
                ; (when (and ( = (balls_in_location ?from ) 1)) (and (assign (smallest_ball_at ?from) 4)
                ;                                                 (assign (biggest_ball_at ?from) 4)))

                ; unstack from pile of size 2
                (when (and (= (balls_in_location ?from ) 2) ) (and (assign (smallest_ball_at ?from) (biggest_ball_at ?from))))
                
                ; increase number of completed snowmen when stacking the third ball in some location
                (when (and (= (balls_in_location ?to) 2)) (and (increase (completed_snowmen) 1)))
                
                ; when breaking down a completed snowman the smallest balls in from becomes of size 2 while
                ; the biggest becomes of size 3. Of course the number of completed snomen must be decreased
                ; (when (and (= (balls_in_location ?from ) 3)) (and (assign (completed_snowmen) (- (completed_snowmen) 1))
                ;                                              (assign (smallest_ball_at ?from) 2)
                ;                                              (assign (biggest_ball_at ?from) 3)))
                (increase (total-cost) 1)
            )  
    ) 

    (:action move_ball_on_grass
        :parameters 
            (?b - ball ?ppos ?from ?to - location ?dir - direction)
        :precondition
           (and 
                (character_at ?ppos)
                (next ?ppos ?from ?dir)
                (next ?from ?to ?dir)
                (ball_at ?b ?from)
                (= (smallest_ball_at ?from) (ball_size ?b))
                ; (< (smallest_ball_at ?from) (smallest_ball_at ?to))
                (not (snow ?to))
                (= (balls_in_location ?to) 0)
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
                
                ; move the character only when he is not in front of a partially-completed snowman
                (when (and (< (balls_in_location ?from) 2)) (and (not (character_at ?ppos)) (character_at ?from)))
                
                ; assign the smallest and biggest ball size when stacking a ball on top of an empty stack
                (assign (smallest_ball_at ?to) (ball_size ?b))
                (assign (biggest_ball_at ?to) (ball_size ?b))
                
                ; unstack from pile of size 2
                (when (and (= (balls_in_location ?from ) 2) ) (and (assign (smallest_ball_at ?from) (biggest_ball_at ?from))))
                
                ; when breaking down a completed snowman the smallest balls in from becomes of size 2 while
                ; the biggest becomes of size 3. Of course the number of completed snomen must be decreased
                ; (when (and (= (balls_in_location ?from ) 3)) (and (assign (completed_snowmen) (- (completed_snowmen) 1))
                ;                                              (assign (smallest_ball_at ?from) 2)
                ;                                              (assign (biggest_ball_at ?from) 3)))
                (increase (total-cost) 1)
            )  
    ) 

)