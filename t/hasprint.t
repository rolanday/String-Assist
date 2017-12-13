#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(has_print is_whitespace);
use Test::Simple tests => 18;

# Following calls should return 1
ok(has_print('   a    '));
ok(has_print("a"));

# Following calls should return 0
ok(!has_print(''));
ok(!has_print(' '));
ok(!has_print('           '));
ok(!has_print("     \n      "));
ok(!has_print("\a"));
ok(!has_print("\b"));
ok(!has_print("\e"));
ok(!has_print("\t"));
ok(!has_print("\n"));
ok(!has_print("\r\n"));
ok(!has_print());
ok(!has_print(undef));

# Sanity check the inverse is_whitespace method
ok(is_whitespace());
ok(is_whitespace(''));
ok(is_whitespace("   \n"));
ok(!is_whitespace("a"));
