#!/usr/bin/perl

if(scalar @ARGV != 1){ print("Only one argument required"); die;}
my $file = shift;
my $fh ;
my $output = "";

my %locations_balls;
my %balls_locations;
my %location_max_ball;
my %location_min_ball;
my %location_num_ball;

open($fh, "<", $file) || die("File not found!") ;
my $init = 0;
my $goal = 0;
my %ball_name_size;
my $num_balls = 0;
my $prev_location = "no_location";
while(<$fh>){
    chomp($_);
    #change domain name
    if($_ =~ /snowman_basic_adl/){
        $_ = "    (:domain numeric_basic)";
    }
    #change goal
    if($_ =~ /:goal/){
        $goal = 1;
        $_ = ""
    }

    if($goal and $_ =~ /\(\s*goal/){
        $_ = ""
    }

    if($_ =~ m/^\s*\)\s*$/ and $goal){
        $num_balls = $num_balls / 3;
        $_ = "\n    (:goal (and (= (completed_snowmen) $num_balls)))\n";
        $goal = 0
    }
    if($init == 0 and $_ =~ m/^\s+(loc\_\d+\_\d+)\s+\-\s+location/){
        $locations_balls{$1} = "0";
        $location_max_ball{$1} = 4;
        $location_min_ball{$1} = 4;
        $location_num_ball{$1} = 0;
    }

    if($_ =~ m/\:init/){
            $init=1;
    }
    if($init == 1){
        if($_ =~ m/(occupancy)/){
            $_="";
        }
        if($_ =~ m/^\s+.ball\_at\s+(ball\_\d+)\s+(loc\_\d+\_\d+)\s*/){
            $locations_balls{$2} = $1;
            $balls_locations{$1} = $2;
            $prev_location = $2;
            $location_num_ball{$2}+=1;
        }
        elsif($_ =~ /ball_size.*?(ball\_\d+)/){
            my $ball_name = $1;
            my $ball_size; 
            if($_ =~ /ball_size_small/){
                $ball_size = 1;
            }
            elsif($_ =~ /ball_size_medium/){
                $ball_size = 2;
            }
            elsif($_ =~ /ball_size_large/){
                $ball_size = 3;
            }
            
            $_="";
            #$ball_size = $ball_name_size{$ball_name};
            $ball_location = $balls_locations{$ball_name};
            
            $_.= "\n        (= (ball_size $ball_name) $ball_size)";
            # $_.= "\n        (= (smallest_ball_at $ball_location) $ball_size)";
            # $_.= "\n        (= (biggest_ball_at $ball_location) $ball_size)";
            # $_.= "\n        (= (balls_in_location $ball_location) 1)\n";
            $num_balls = $num_balls + 1;
            if ($location_max_ball{$prev_location} == 4 || $location_max_ball{$prev_location} < $ball_size){
                $location_max_ball{$prev_location} = $ball_size;
            }
            if ($location_min_ball{$prev_location} == 4 || $location_min_ball{$prev_location} > $ball_size){
                $location_min_ball{$prev_location} = $ball_size;
            }

        }
        
        if($_ =~ m/^\s*\)\s*$/){
            $line = "";
            foreach $key (keys %locations_balls){
                $smallest_ball = $location_min_ball{$key};
                $biggest_ball = $location_max_ball{$key};
                $num_balls_loc = $location_num_ball{$key};
                $line.= "\n        (= (smallest_ball_at $key) $smallest_ball)";
                $line.= "\n        (= (biggest_ball_at $key) $biggest_ball)";
                $line.= "\n        (= (balls_in_location $key) $num_balls_loc)\n";
            }
            $line.="\n        (= (completed_snowmen) 0)";
            $line.="\n ".$_;
            $_=$line;
            $init=0;
        }
    }
    if($_ ne ""){
        $output .= $_."\n";
    }

}
print($output);
close($fh);