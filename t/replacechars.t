#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(replacechar replacechars squeeze);
use Test::Simple tests => 7;

ok(squeeze('   ab c defg   ') eq 'abcdefg');
ok(squeeze('abcdefg') eq 'abcdefg');
ok(replacechar('abcdefg', 'd', 'x') eq 'abcxefg');
ok(replacechar('abcdefg', 'd', ' ') eq 'abc efg');
ok(replacechar('abcdefg', 'd', '') eq 'abcefg');

my @chars = qw(d);
ok(replacechars('abcdefg', \@chars, ' ') eq 'abc efg');

@chars = qw(b d f);
ok(replacechars('abc defg', \@chars, 'x') eq 'axc xexg');
