#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(replace_char replace_chars squeeze);
use Test::Simple tests => 7;

ok(squeeze('   ab c defg   ') eq 'abcdefg');
ok(squeeze('abcdefg') eq 'abcdefg');
ok(replace_char('abcdefg', 'd', 'x') eq 'abcxefg');
ok(replace_char('abcdefg', 'd', ' ') eq 'abc efg');
ok(replace_char('abcdefg', 'd', '') eq 'abcefg');

my @chars = qw(d);
ok(replace_chars('abcdefg', \@chars, ' ') eq 'abc efg');

@chars = qw(b d f);
ok(replace_chars('abc defg', \@chars, 'x') eq 'axc xexg');
