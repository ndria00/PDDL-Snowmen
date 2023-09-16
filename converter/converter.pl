#!/usr/bin/perl

if(scalar @ARGV != 1){ print("Only one argument required"); die;}
my $file = shift;
my $fh ;
my $output = "";

my %locations;

open($fh, "<", $file) || die("File not found!") ;
my $init = 0;
while(<$fh>){
    chomp($_);
    if($_ =~ m/\:init/){
            $init=1;
    }
    if($init == 1){
        if($_ =~ m/(ball\_size|occupancy)/){
            $_="";
        }
        elsif($_ =~ m/^\s+(loc\_\d+\_\d+)\s+\-\s+location/){
            $locations{$1} = 0; 
        }
        elsif($_ =~ m/^\s+.ball\_at\s+(ball\_\d+)\s+(loc\_\d+\_\d+)\s*/){
            $locations{$2} = $1; 
            $_.= "\n        (= (ball_size $1) 1)";
            $_.= "\n        (= (smallest_ball_at $2) 1)";
            $_.= "\n        (= (biggest_ball_at $2) 1)";
            $_.= "\n        (= (balls_in_location $2) 1)\n";
        }
        if($_ =~ m/^\s*\)\s*$/){
            $line = "";
            foreach $key (keys %locations){
                if($locations{$key} == 0){
                    $line.= "\n        (= (smallest_ball_at $key) 4)";
                    $line.= "\n        (= (biggest_ball_at $key) 4)";
                    $line.= "\n        (= (balls_in_location $key) 0)\n";
                }
            }
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