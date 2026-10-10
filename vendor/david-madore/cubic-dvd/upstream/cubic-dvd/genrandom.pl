#! /usr/local/bin/perl -w

use strict;

sub pseudogaussian {
    my $x = 0;
    my $i;
    for ( $i=0 ; $i<100 ; $i++ ) {
	$x += rand;
    }
    $x -= 0.5*$i;
    $x /= sqrt($i);
    $x *= sqrt(12.);
}

my @coefs1;
my @coefs2;

for ( my $i=0 ; $i<20 ; $i++ ) {
    push @coefs1, pseudogaussian;
    push @coefs2, pseudogaussian;
}

print "  cubic {\n    \<";
for ( my $i=0 ; $i<20 ; $i++ ) {
    printf "(%.4f)\*cos(pi\*clock)+(%.4f)\*sin(pi\*clock)", $coefs1[$i], $coefs2[$i];
    if ( $i+1<20 ) {
	print ", ";
    } else {
	print "-0.0001";
    }
}
print "\>\n  }\n";

print "  cubic {\n    \<";
for ( my $i=0 ; $i<20 ; $i++ ) {
    printf "(%.4f)\*cos(pi\*clock)+(%.4f)\*sin(pi\*clock)", -$coefs1[$i], -$coefs2[$i];
    if ( $i+1<20 ) {
	print ", ";
    } else {
	print "-0.0001";
    }
}
print "\>\n  }\n";
