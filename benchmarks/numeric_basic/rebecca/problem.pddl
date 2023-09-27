(define (problem rebecca)
    (:domain numeric_basic)
    (:objects
        right - direction
        left - direction
        up - direction
        down - direction
        ball_0 - ball
        ball_1 - ball
        ball_2 - ball
        loc_1_1 - location
        loc_1_2 - location
        loc_1_3 - location
        loc_1_6 - location
        loc_2_1 - location
        loc_2_2 - location
        loc_2_3 - location
        loc_2_6 - location
        loc_3_1 - location
        loc_3_2 - location
        loc_3_3 - location
        loc_3_4 - location
        loc_3_5 - location
        loc_3_6 - location
        loc_4_3 - location
        loc_4_4 - location
        loc_4_5 - location
        loc_4_6 - location
    )
    (:init
        (= (total-cost) 0)
        (next loc_1_1 loc_2_1 right)
        (next loc_1_1 loc_1_2 up)
        (next loc_1_2 loc_2_2 right)
        (next loc_1_2 loc_1_3 up)
        (next loc_1_2 loc_1_1 down)
        (next loc_1_3 loc_2_3 right)
        (next loc_1_3 loc_1_2 down)
        (next loc_1_6 loc_2_6 right)
        (next loc_2_1 loc_3_1 right)
        (next loc_2_1 loc_1_1 left)
        (next loc_2_1 loc_2_2 up)
        (next loc_2_2 loc_3_2 right)
        (next loc_2_2 loc_1_2 left)
        (next loc_2_2 loc_2_3 up)
        (next loc_2_2 loc_2_1 down)
        (next loc_2_3 loc_3_3 right)
        (next loc_2_3 loc_1_3 left)
        (next loc_2_3 loc_2_2 down)
        (next loc_2_6 loc_3_6 right)
        (next loc_2_6 loc_1_6 left)
        (next loc_3_1 loc_2_1 left)
        (next loc_3_1 loc_3_2 up)
        (next loc_3_2 loc_2_2 left)
        (next loc_3_2 loc_3_3 up)
        (next loc_3_2 loc_3_1 down)
        (next loc_3_3 loc_4_3 right)
        (next loc_3_3 loc_2_3 left)
        (next loc_3_3 loc_3_4 up)
        (next loc_3_3 loc_3_2 down)
        (next loc_3_4 loc_4_4 right)
        (next loc_3_4 loc_3_5 up)
        (next loc_3_4 loc_3_3 down)
        (next loc_3_5 loc_4_5 right)
        (next loc_3_5 loc_3_6 up)
        (next loc_3_5 loc_3_4 down)
        (next loc_3_6 loc_4_6 right)
        (next loc_3_6 loc_2_6 left)
        (next loc_3_6 loc_3_5 down)
        (next loc_4_3 loc_3_3 left)
        (next loc_4_3 loc_4_4 up)
        (next loc_4_4 loc_3_4 left)
        (next loc_4_4 loc_4_5 up)
        (next loc_4_4 loc_4_3 down)
        (next loc_4_5 loc_3_5 left)
        (next loc_4_5 loc_4_6 up)
        (next loc_4_5 loc_4_4 down)
        (next loc_4_6 loc_3_6 left)
        (next loc_4_6 loc_4_5 down)
        (character_at loc_4_5)
        (ball_at ball_0 loc_2_2)

        (= (ball_size ball_0) 2)
        (ball_at ball_1 loc_2_3)

        (= (ball_size ball_1) 3)
        (ball_at ball_2 loc_3_3)

        (= (ball_size ball_2) 1)

        (= (smallest_ball_at loc_2_6) 4)
        (= (biggest_ball_at loc_2_6) 4)
        (= (balls_in_location loc_2_6) 0)

        (= (smallest_ball_at loc_4_6) 4)
        (= (biggest_ball_at loc_4_6) 4)
        (= (balls_in_location loc_4_6) 0)

        (= (smallest_ball_at loc_4_4) 4)
        (= (biggest_ball_at loc_4_4) 4)
        (= (balls_in_location loc_4_4) 0)

        (= (smallest_ball_at loc_4_5) 4)
        (= (biggest_ball_at loc_4_5) 4)
        (= (balls_in_location loc_4_5) 0)

        (= (smallest_ball_at loc_2_1) 4)
        (= (biggest_ball_at loc_2_1) 4)
        (= (balls_in_location loc_2_1) 0)

        (= (smallest_ball_at loc_2_2) 2)
        (= (biggest_ball_at loc_2_2) 2)
        (= (balls_in_location loc_2_2) 1)

        (= (smallest_ball_at loc_3_3) 1)
        (= (biggest_ball_at loc_3_3) 1)
        (= (balls_in_location loc_3_3) 1)

        (= (smallest_ball_at loc_1_3) 4)
        (= (biggest_ball_at loc_1_3) 4)
        (= (balls_in_location loc_1_3) 0)

        (= (smallest_ball_at loc_2_3) 3)
        (= (biggest_ball_at loc_2_3) 3)
        (= (balls_in_location loc_2_3) 1)

        (= (smallest_ball_at loc_3_5) 4)
        (= (biggest_ball_at loc_3_5) 4)
        (= (balls_in_location loc_3_5) 0)

        (= (smallest_ball_at loc_3_1) 4)
        (= (biggest_ball_at loc_3_1) 4)
        (= (balls_in_location loc_3_1) 0)

        (= (smallest_ball_at loc_3_2) 4)
        (= (biggest_ball_at loc_3_2) 4)
        (= (balls_in_location loc_3_2) 0)

        (= (smallest_ball_at loc_4_3) 4)
        (= (biggest_ball_at loc_4_3) 4)
        (= (balls_in_location loc_4_3) 0)

        (= (smallest_ball_at loc_1_1) 4)
        (= (biggest_ball_at loc_1_1) 4)
        (= (balls_in_location loc_1_1) 0)

        (= (smallest_ball_at loc_1_2) 4)
        (= (biggest_ball_at loc_1_2) 4)
        (= (balls_in_location loc_1_2) 0)

        (= (smallest_ball_at loc_3_4) 4)
        (= (biggest_ball_at loc_3_4) 4)
        (= (balls_in_location loc_3_4) 0)

        (= (smallest_ball_at loc_1_6) 4)
        (= (biggest_ball_at loc_1_6) 4)
        (= (balls_in_location loc_1_6) 0)

        (= (smallest_ball_at loc_3_6) 4)
        (= (biggest_ball_at loc_3_6) 4)
        (= (balls_in_location loc_3_6) 0)

        (= (completed_snowmen) 0)
     )

    (:goal (and (= (completed_snowmen) 1)))

    (:metric minimize (total-cost))
)
