(define (problem julian)
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
        loc_2_1 - location
        loc_2_2 - location
        loc_2_3 - location
        loc_3_1 - location
        loc_3_2 - location
        loc_3_3 - location
        loc_3_4 - location
        loc_4_2 - location
        loc_4_4 - location
        loc_5_1 - location
        loc_5_2 - location
        loc_5_3 - location
        loc_5_4 - location
        loc_6_1 - location
        loc_6_2 - location
        loc_6_3 - location
        loc_6_4 - location
        loc_7_1 - location
        loc_7_2 - location
        loc_7_3 - location
        loc_7_4 - location
        loc_8_2 - location
        loc_8_4 - location
        loc_9_1 - location
        loc_9_2 - location
        loc_9_3 - location
        loc_9_4 - location
        loc_10_1 - location
        loc_10_2 - location
        loc_10_3 - location
        loc_11_1 - location
        loc_11_2 - location
        loc_11_3 - location
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
        (next loc_3_1 loc_2_1 left)
        (next loc_3_1 loc_3_2 up)
        (next loc_3_2 loc_4_2 right)
        (next loc_3_2 loc_2_2 left)
        (next loc_3_2 loc_3_3 up)
        (next loc_3_2 loc_3_1 down)
        (next loc_3_3 loc_2_3 left)
        (next loc_3_3 loc_3_4 up)
        (next loc_3_3 loc_3_2 down)
        (next loc_3_4 loc_4_4 right)
        (next loc_3_4 loc_3_3 down)
        (next loc_4_2 loc_5_2 right)
        (next loc_4_2 loc_3_2 left)
        (next loc_4_4 loc_5_4 right)
        (next loc_4_4 loc_3_4 left)
        (next loc_5_1 loc_6_1 right)
        (next loc_5_1 loc_5_2 up)
        (next loc_5_2 loc_6_2 right)
        (next loc_5_2 loc_4_2 left)
        (next loc_5_2 loc_5_3 up)
        (next loc_5_2 loc_5_1 down)
        (next loc_5_3 loc_6_3 right)
        (next loc_5_3 loc_5_4 up)
        (next loc_5_3 loc_5_2 down)
        (next loc_5_4 loc_6_4 right)
        (next loc_5_4 loc_4_4 left)
        (next loc_5_4 loc_5_3 down)
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
        (next loc_6_4 loc_6_3 down)
        (next loc_7_1 loc_6_1 left)
        (next loc_7_1 loc_7_2 up)
        (next loc_7_2 loc_8_2 right)
        (next loc_7_2 loc_6_2 left)
        (next loc_7_2 loc_7_3 up)
        (next loc_7_2 loc_7_1 down)
        (next loc_7_3 loc_6_3 left)
        (next loc_7_3 loc_7_4 up)
        (next loc_7_3 loc_7_2 down)
        (next loc_7_4 loc_8_4 right)
        (next loc_7_4 loc_6_4 left)
        (next loc_7_4 loc_7_3 down)
        (next loc_8_2 loc_9_2 right)
        (next loc_8_2 loc_7_2 left)
        (next loc_8_4 loc_9_4 right)
        (next loc_8_4 loc_7_4 left)
        (next loc_9_1 loc_10_1 right)
        (next loc_9_1 loc_9_2 up)
        (next loc_9_2 loc_10_2 right)
        (next loc_9_2 loc_8_2 left)
        (next loc_9_2 loc_9_3 up)
        (next loc_9_2 loc_9_1 down)
        (next loc_9_3 loc_10_3 right)
        (next loc_9_3 loc_9_4 up)
        (next loc_9_3 loc_9_2 down)
        (next loc_9_4 loc_8_4 left)
        (next loc_9_4 loc_9_3 down)
        (next loc_10_1 loc_11_1 right)
        (next loc_10_1 loc_9_1 left)
        (next loc_10_1 loc_10_2 up)
        (next loc_10_2 loc_11_2 right)
        (next loc_10_2 loc_9_2 left)
        (next loc_10_2 loc_10_3 up)
        (next loc_10_2 loc_10_1 down)
        (next loc_10_3 loc_11_3 right)
        (next loc_10_3 loc_9_3 left)
        (next loc_10_3 loc_10_2 down)
        (next loc_11_1 loc_10_1 left)
        (next loc_11_1 loc_11_2 up)
        (next loc_11_2 loc_10_2 left)
        (next loc_11_2 loc_11_3 up)
        (next loc_11_2 loc_11_1 down)
        (next loc_11_3 loc_10_3 left)
        (next loc_11_3 loc_11_2 down)
        (character_at loc_6_2)
        (ball_at ball_0 loc_3_2)

        (= (ball_size ball_0) 1)
        (ball_at ball_1 loc_6_4)

        (= (ball_size ball_1) 1)
        (ball_at ball_2 loc_9_2)

        (= (ball_size ball_2) 1)
        (snow loc_1_1)
        (snow loc_1_2)
        (snow loc_1_3)
        (snow loc_2_1)
        (snow loc_2_2)
        (snow loc_2_3)
        (snow loc_3_1)
        (snow loc_3_3)
        (snow loc_3_4)
        (snow loc_4_2)
        (snow loc_4_4)
        (snow loc_5_1)
        (snow loc_5_2)
        (snow loc_5_3)
        (snow loc_5_4)
        (snow loc_6_1)
        (snow loc_6_2)
        (snow loc_6_3)
        (snow loc_7_1)
        (snow loc_7_2)
        (snow loc_7_3)
        (snow loc_7_4)
        (snow loc_8_2)
        (snow loc_8_4)
        (snow loc_9_1)
        (snow loc_9_3)
        (snow loc_9_4)
        (snow loc_10_1)
        (snow loc_10_2)
        (snow loc_10_3)
        (snow loc_11_1)
        (snow loc_11_2)
        (snow loc_11_3)

        (= (smallest_ball_at loc_3_4) 4)
        (= (biggest_ball_at loc_3_4) 4)
        (= (balls_in_location loc_3_4) 0)

        (= (smallest_ball_at loc_6_1) 4)
        (= (biggest_ball_at loc_6_1) 4)
        (= (balls_in_location loc_6_1) 0)

        (= (smallest_ball_at loc_9_4) 4)
        (= (biggest_ball_at loc_9_4) 4)
        (= (balls_in_location loc_9_4) 0)

        (= (smallest_ball_at loc_4_4) 4)
        (= (biggest_ball_at loc_4_4) 4)
        (= (balls_in_location loc_4_4) 0)

        (= (smallest_ball_at loc_5_1) 4)
        (= (biggest_ball_at loc_5_1) 4)
        (= (balls_in_location loc_5_1) 0)

        (= (smallest_ball_at loc_7_4) 4)
        (= (biggest_ball_at loc_7_4) 4)
        (= (balls_in_location loc_7_4) 0)

        (= (smallest_ball_at loc_2_1) 4)
        (= (biggest_ball_at loc_2_1) 4)
        (= (balls_in_location loc_2_1) 0)

        (= (smallest_ball_at loc_9_1) 4)
        (= (biggest_ball_at loc_9_1) 4)
        (= (balls_in_location loc_9_1) 0)

        (= (smallest_ball_at loc_6_4) 1)
        (= (biggest_ball_at loc_6_4) 1)
        (= (balls_in_location loc_6_4) 1)

        (= (smallest_ball_at loc_3_1) 4)
        (= (biggest_ball_at loc_3_1) 4)
        (= (balls_in_location loc_3_1) 0)

        (= (smallest_ball_at loc_5_4) 4)
        (= (biggest_ball_at loc_5_4) 4)
        (= (balls_in_location loc_5_4) 0)

        (= (smallest_ball_at loc_10_1) 4)
        (= (biggest_ball_at loc_10_1) 4)
        (= (balls_in_location loc_10_1) 0)

        (= (smallest_ball_at loc_11_3) 4)
        (= (biggest_ball_at loc_11_3) 4)
        (= (balls_in_location loc_11_3) 0)

        (= (smallest_ball_at loc_7_1) 4)
        (= (biggest_ball_at loc_7_1) 4)
        (= (balls_in_location loc_7_1) 0)

        (= (smallest_ball_at loc_10_2) 4)
        (= (biggest_ball_at loc_10_2) 4)
        (= (balls_in_location loc_10_2) 0)

        (= (smallest_ball_at loc_1_1) 4)
        (= (biggest_ball_at loc_1_1) 4)
        (= (balls_in_location loc_1_1) 0)

        (= (smallest_ball_at loc_8_2) 4)
        (= (biggest_ball_at loc_8_2) 4)
        (= (balls_in_location loc_8_2) 0)

        (= (smallest_ball_at loc_7_2) 4)
        (= (biggest_ball_at loc_7_2) 4)
        (= (balls_in_location loc_7_2) 0)

        (= (smallest_ball_at loc_1_3) 4)
        (= (biggest_ball_at loc_1_3) 4)
        (= (balls_in_location loc_1_3) 0)

        (= (smallest_ball_at loc_11_1) 4)
        (= (biggest_ball_at loc_11_1) 4)
        (= (balls_in_location loc_11_1) 0)

        (= (smallest_ball_at loc_1_2) 4)
        (= (biggest_ball_at loc_1_2) 4)
        (= (balls_in_location loc_1_2) 0)

        (= (smallest_ball_at loc_7_3) 4)
        (= (biggest_ball_at loc_7_3) 4)
        (= (balls_in_location loc_7_3) 0)

        (= (smallest_ball_at loc_10_3) 4)
        (= (biggest_ball_at loc_10_3) 4)
        (= (balls_in_location loc_10_3) 0)

        (= (smallest_ball_at loc_3_2) 1)
        (= (biggest_ball_at loc_3_2) 1)
        (= (balls_in_location loc_3_2) 1)

        (= (smallest_ball_at loc_9_2) 1)
        (= (biggest_ball_at loc_9_2) 1)
        (= (balls_in_location loc_9_2) 1)

        (= (smallest_ball_at loc_11_2) 4)
        (= (biggest_ball_at loc_11_2) 4)
        (= (balls_in_location loc_11_2) 0)

        (= (smallest_ball_at loc_9_3) 4)
        (= (biggest_ball_at loc_9_3) 4)
        (= (balls_in_location loc_9_3) 0)

        (= (smallest_ball_at loc_4_2) 4)
        (= (biggest_ball_at loc_4_2) 4)
        (= (balls_in_location loc_4_2) 0)

        (= (smallest_ball_at loc_3_3) 4)
        (= (biggest_ball_at loc_3_3) 4)
        (= (balls_in_location loc_3_3) 0)

        (= (smallest_ball_at loc_2_3) 4)
        (= (biggest_ball_at loc_2_3) 4)
        (= (balls_in_location loc_2_3) 0)

        (= (smallest_ball_at loc_2_2) 4)
        (= (biggest_ball_at loc_2_2) 4)
        (= (balls_in_location loc_2_2) 0)

        (= (smallest_ball_at loc_8_4) 4)
        (= (biggest_ball_at loc_8_4) 4)
        (= (balls_in_location loc_8_4) 0)

        (= (smallest_ball_at loc_6_2) 4)
        (= (biggest_ball_at loc_6_2) 4)
        (= (balls_in_location loc_6_2) 0)

        (= (smallest_ball_at loc_5_3) 4)
        (= (biggest_ball_at loc_5_3) 4)
        (= (balls_in_location loc_5_3) 0)

        (= (smallest_ball_at loc_5_2) 4)
        (= (biggest_ball_at loc_5_2) 4)
        (= (balls_in_location loc_5_2) 0)

        (= (smallest_ball_at loc_6_3) 4)
        (= (biggest_ball_at loc_6_3) 4)
        (= (balls_in_location loc_6_3) 0)

        (= (completed_snowmen) 0)
     )

    (:goal (and (= (completed_snowmen) 1)))

    (:metric minimize (total-cost))
)
