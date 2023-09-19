#!/usr/bin/perl

my $path_to_adl = "benchmarks/basic_adl";
my $path_to_numeric = "benchmarks/numeric_basic";
my $converter_command = "./converter/converter.pl";

my @all_benchmarks = qx(ls $path_to_adl);

for (@all_benchmarks){
    chomp($_);
    qx($converter_command $path_to_adl/$_/problem.pddl > $path_to_numeric/$_/problem.pddl);

}