(define (problem hard_harder_hardest)
    (:domain numeric_basic)
    (:objects
        right - direction
        left - direction
        up - direction
        down - direction
        ball_0 - ball
        ball_1 - ball
        ball_2 - ball
        ball_3 - ball
        ball_4 - ball
        ball_5 - ball
        ball_6 - ball
        ball_7 - ball
        ball_8 - ball
        loc_1_2 - location
        loc_1_3 - location
        loc_1_4 - location
        loc_2_2 - location
        loc_2_3 - location
        loc_2_4 - location
        loc_3_2 - location
        loc_3_4 - location
        loc_4_1 - location
        loc_4_2 - location
        loc_4_3 - location
        loc_4_4 - location
        loc_4_5 - location
        loc_5_1 - location
        loc_5_2 - location
        loc_5_3 - location
        loc_5_4 - location
        loc_5_5 - location
        loc_6_1 - location
        loc_6_2 - location
        loc_6_3 - location
        loc_6_4 - location
        loc_6_5 - location
        loc_7_1 - location
        loc_7_2 - location
        loc_7_3 - location
        loc_7_4 - location
        loc_7_5 - location
        loc_8_1 - location
        loc_8_2 - location
        loc_8_3 - location
        loc_8_4 - location
        loc_8_5 - location
    )
    (:init
        (= (total-cost) 0)
        (next loc_1_2 loc_2_2 right)
        (next loc_1_2 loc_1_3 up)
        (next loc_1_3 loc_2_3 right)
        (next loc_1_3 loc_1_4 up)
        (next loc_1_3 loc_1_2 down)
        (next loc_1_4 loc_2_4 right)
        (next loc_1_4 loc_1_3 down)
        (next loc_2_2 loc_3_2 right)
        (next loc_2_2 loc_1_2 left)
        (next loc_2_2 loc_2_3 up)
        (next loc_2_3 loc_1_3 left)
        (next loc_2_3 loc_2_4 up)
        (next loc_2_3 loc_2_2 down)
        (next loc_2_4 loc_3_4 right)
        (next loc_2_4 loc_1_4 left)
        (next loc_2_4 loc_2_3 down)
        (next loc_3_2 loc_4_2 right)
        (next loc_3_2 loc_2_2 left)
        (next loc_3_4 loc_4_4 right)
        (next loc_3_4 loc_2_4 left)
        (next loc_4_1 loc_5_1 right)
        (next loc_4_1 loc_4_2 up)
        (next loc_4_2 loc_5_2 right)
        (next loc_4_2 loc_3_2 left)
        (next loc_4_2 loc_4_3 up)
        (next loc_4_2 loc_4_1 down)
        (next loc_4_3 loc_5_3 right)
        (next loc_4_3 loc_4_4 up)
        (next loc_4_3 loc_4_2 down)
        (next loc_4_4 loc_5_4 right)
        (next loc_4_4 loc_3_4 left)
        (next loc_4_4 loc_4_5 up)
        (next loc_4_4 loc_4_3 down)
        (next loc_4_5 loc_5_5 right)
        (next loc_4_5 loc_4_4 down)
        (next loc_5_1 loc_6_1 right)
        (next loc_5_1 loc_4_1 left)
        (next loc_5_1 loc_5_2 up)
        (next loc_5_2 loc_6_2 right)
        (next loc_5_2 loc_4_2 left)
        (next loc_5_2 loc_5_3 up)
        (next loc_5_2 loc_5_1 down)
        (next loc_5_3 loc_6_3 right)
        (next loc_5_3 loc_4_3 left)
        (next loc_5_3 loc_5_4 up)
        (next loc_5_3 loc_5_2 down)
        (next loc_5_4 loc_6_4 right)
        (next loc_5_4 loc_4_4 left)
        (next loc_5_4 loc_5_5 up)
        (next loc_5_4 loc_5_3 down)
        (next loc_5_5 loc_6_5 right)
        (next loc_5_5 loc_4_5 left)
        (next loc_5_5 loc_5_4 down)
        (next loc_6_1 loc_7_1 right)
        (next loc_6_1 loc_5_1 left)
        (next loc_6_1 loc_6_2 up)
        (next loc_6_2 loc_7_2 right)
        (next loc_6_2 loc_5_2 left)
        (next loc_6_2 loc_6_3 up)
        (next loc_6_2 loc_6_1 down)
        (next loc_6_3 loc_7_3 right)
        (next loc_6_3 loc_5_3 left)
        (next loc_6_3 loc_6_4 up)
        (next loc_6_3 loc_6_2 down)
        (next loc_6_4 loc_7_4 right)
        (next loc_6_4 loc_5_4 left)
        (next loc_6_4 loc_6_5 up)
        (next loc_6_4 loc_6_3 down)
        (next loc_6_5 loc_7_5 right)
        (next loc_6_5 loc_5_5 left)
        (next loc_6_5 loc_6_4 down)
        (next loc_7_1 loc_8_1 right)
        (next loc_7_1 loc_6_1 left)
        (next loc_7_1 loc_7_2 up)
        (next loc_7_2 loc_8_2 right)
        (next loc_7_2 loc_6_2 left)
        (next loc_7_2 loc_7_3 up)
        (next loc_7_2 loc_7_1 down)
        (next loc_7_3 loc_8_3 right)
        (next loc_7_3 loc_6_3 left)
        (next loc_7_3 loc_7_4 up)
        (next loc_7_3 loc_7_2 down)
        (next loc_7_4 loc_8_4 right)
        (next loc_7_4 loc_6_4 left)
        (next loc_7_4 loc_7_5 up)
        (next loc_7_4 loc_7_3 down)
        (next loc_7_5 loc_8_5 right)
        (next loc_7_5 loc_6_5 left)
        (next loc_7_5 loc_7_4 down)
        (next loc_8_1 loc_7_1 left)
        (next loc_8_1 loc_8_2 up)
        (next loc_8_2 loc_7_2 left)
        (next loc_8_2 loc_8_3 up)
        (next loc_8_2 loc_8_1 down)
        (next loc_8_3 loc_7_3 left)
        (next loc_8_3 loc_8_4 up)
        (next loc_8_3 loc_8_2 down)
        (next loc_8_4 loc_7_4 left)
        (next loc_8_4 loc_8_5 up)
        (next loc_8_4 loc_8_3 down)
        (next loc_8_5 loc_7_5 left)
        (next loc_8_5 loc_8_4 down)
        (character_at loc_7_3)
        (ball_at ball_0 loc_2_3)

        (= (ball_size ball_0) 1)
        (ball_at ball_1 loc_4_2)

        (= (ball_size ball_1) 2)
        (ball_at ball_2 loc_4_3)

        (= (ball_size ball_2) 2)
        (ball_at ball_3 loc_4_4)

        (= (ball_size ball_3) 2)
        (ball_at ball_4 loc_5_3)

        (= (ball_size ball_4) 1)
        (ball_at ball_5 loc_6_1)

        (= (ball_size ball_5) 1)
        (ball_at ball_6 loc_6_5)

        (= (ball_size ball_6) 1)
        (ball_at ball_7 loc_7_2)

        (= (ball_size ball_7) 1)
        (ball_at ball_8 loc_7_4)

        (= (ball_size ball_8) 1)
        (snow loc_1_2)
        (snow loc_1_3)
        (snow loc_1_4)
        (snow loc_2_2)
        (snow loc_2_4)
        (snow loc_3_2)
        (snow loc_3_4)
        (snow loc_4_1)
        (snow loc_4_5)
        (snow loc_5_1)
        (snow loc_5_2)
        (snow loc_5_4)
        (snow loc_5_5)
        (snow loc_6_2)
        (snow loc_6_3)
        (snow loc_6_4)
        (snow loc_7_1)
        (snow loc_7_3)
        (snow loc_7_5)
        (snow loc_8_1)
        (snow loc_8_2)
        (snow loc_8_3)
        (snow loc_8_4)
        (snow loc_8_5)

        (= (smallest_ball_at loc_1_4) 4)
        (= (biggest_ball_at loc_1_4) 4)
        (= (balls_in_location loc_1_4) 0)

        (= (smallest_ball_at loc_7_5) 4)
        (= (biggest_ball_at loc_7_5) 4)
        (= (balls_in_location loc_7_5) 0)

        (= (smallest_ball_at loc_5_5) 4)
        (= (biggest_ball_at loc_5_5) 4)
        (= (balls_in_location loc_5_5) 0)

        (= (smallest_ball_at loc_7_2) 1)
        (= (biggest_ball_at loc_7_2) 1)
        (= (balls_in_location loc_7_2) 1)

        (= (smallest_ball_at loc_5_2) 4)
        (= (biggest_ball_at loc_5_2) 4)
        (= (balls_in_location loc_5_2) 0)

        (= (smallest_ball_at loc_6_1) 1)
        (= (biggest_ball_at loc_6_1) 1)
        (= (balls_in_location loc_6_1) 1)

        (= (smallest_ball_at loc_2_4) 4)
        (= (biggest_ball_at loc_2_4) 4)
        (= (balls_in_location loc_2_4) 0)

        (= (smallest_ball_at loc_8_4) 4)
        (= (biggest_ball_at loc_8_4) 4)
        (= (balls_in_location loc_8_4) 0)

        (= (smallest_ball_at loc_5_3) 1)
        (= (biggest_ball_at loc_5_3) 1)
        (= (balls_in_location loc_5_3) 1)

        (= (smallest_ball_at loc_7_3) 4)
        (= (biggest_ball_at loc_7_3) 4)
        (= (balls_in_location loc_7_3) 0)

        (= (smallest_ball_at loc_4_3) 2)
        (= (biggest_ball_at loc_4_3) 2)
        (= (balls_in_location loc_4_3) 1)

        (= (smallest_ball_at loc_8_1) 4)
        (= (biggest_ball_at loc_8_1) 4)
        (= (balls_in_location loc_8_1) 0)

        (= (smallest_ball_at loc_4_2) 2)
        (= (biggest_ball_at loc_4_2) 2)
        (= (balls_in_location loc_4_2) 1)

        (= (smallest_ball_at loc_6_4) 4)
        (= (biggest_ball_at loc_6_4) 4)
        (= (balls_in_location loc_6_4) 0)

        (= (smallest_ball_at loc_4_5) 4)
        (= (biggest_ball_at loc_4_5) 4)
        (= (balls_in_location loc_4_5) 0)

        (= (smallest_ball_at loc_3_4) 4)
        (= (biggest_ball_at loc_3_4) 4)
        (= (balls_in_location loc_3_4) 0)

        (= (smallest_ball_at loc_1_2) 4)
        (= (biggest_ball_at loc_1_2) 4)
        (= (balls_in_location loc_1_2) 0)

        (= (smallest_ball_at loc_8_5) 4)
        (= (biggest_ball_at loc_8_5) 4)
        (= (balls_in_location loc_8_5) 0)

        (= (smallest_ball_at loc_1_3) 4)
        (= (biggest_ball_at loc_1_3) 4)
        (= (balls_in_location loc_1_3) 0)

        (= (smallest_ball_at loc_4_1) 4)
        (= (biggest_ball_at loc_4_1) 4)
        (= (balls_in_location loc_4_1) 0)

        (= (smallest_ball_at loc_8_3) 4)
        (= (biggest_ball_at loc_8_3) 4)
        (= (balls_in_location loc_8_3) 0)

        (= (smallest_ball_at loc_5_4) 4)
        (= (biggest_ball_at loc_5_4) 4)
        (= (balls_in_location loc_5_4) 0)

        (= (smallest_ball_at loc_7_4) 1)
        (= (biggest_ball_at loc_7_4) 1)
        (= (balls_in_location loc_7_4) 1)

        (= (smallest_ball_at loc_2_2) 4)
        (= (biggest_ball_at loc_2_2) 4)
        (= (balls_in_location loc_2_2) 0)

        (= (smallest_ball_at loc_2_3) 1)
        (= (biggest_ball_at loc_2_3) 1)
        (= (balls_in_location loc_2_3) 1)

        (= (smallest_ball_at loc_8_2) 4)
        (= (biggest_ball_at loc_8_2) 4)
        (= (balls_in_location loc_8_2) 0)

        (= (smallest_ball_at loc_6_3) 4)
        (= (biggest_ball_at loc_6_3) 4)
        (= (balls_in_location loc_6_3) 0)

        (= (smallest_ball_at loc_4_4) 2)
        (= (biggest_ball_at loc_4_4) 2)
        (= (balls_in_location loc_4_4) 1)

        (= (smallest_ball_at loc_6_2) 4)
        (= (biggest_ball_at loc_6_2) 4)
        (= (balls_in_location loc_6_2) 0)

        (= (smallest_ball_at loc_7_1) 4)
        (= (biggest_ball_at loc_7_1) 4)
        (= (balls_in_location loc_7_1) 0)

        (= (smallest_ball_at loc_5_1) 4)
        (= (biggest_ball_at loc_5_1) 4)
        (= (balls_in_location loc_5_1) 0)

        (= (smallest_ball_at loc_3_2) 4)
        (= (biggest_ball_at loc_3_2) 4)
        (= (balls_in_location loc_3_2) 0)

        (= (smallest_ball_at loc_6_5) 1)
        (= (biggest_ball_at loc_6_5) 1)
        (= (balls_in_location loc_6_5) 1)

        (= (completed_snowmen) 0)
     )

    (:goal (and (= (completed_snowmen) 3)))

    (:metric minimize (total-cost))
)
