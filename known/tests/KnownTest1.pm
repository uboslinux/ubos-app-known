#!/usr/bin/perl
#
# Simple test for Known
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;
use warnings;

package KnownTest1;

use UBOS::WebAppTest;

# The states and transitions for this test

my $TEST = new UBOS::WebAppTest(
    appToTest        => 'known',
    description      => 'Tests whether known comes up only.',
    fixedTestContext => '',
    checks           => [
            new UBOS::WebAppTest::StateCheck(
                    name  => 'virgin',
                    check => sub {
                        my $c = shift;
                        
                        $c->getMustRedirect( '/', '/begin/', 302 );
                        $c->getMustContain( '/begin/', 'Welcome to Known' );
                        
                        return 1;
                    }
            )
    ]
);

$TEST;
