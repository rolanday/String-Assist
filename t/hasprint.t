#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(hasprint iswhitespace);
use Test::Simple tests => 18;

# Following calls should return 1
ok(hasprint('   a    '));
ok(hasprint("a"));

# Following calls should return 0
ok(!hasprint(''));
ok(!hasprint(' '));
ok(!hasprint('           '));
ok(!hasprint("     \n      "));
ok(!hasprint("\a"));
ok(!hasprint("\b"));
ok(!hasprint("\e"));
ok(!hasprint("\t"));
ok(!hasprint("\n"));
ok(!hasprint("\r\n"));
ok(!hasprint());
ok(!hasprint(undef));

# Sanity check the inverse iswhitespace method
ok(iswhitespace());
ok(iswhitespace(''));
ok(iswhitespace("   \n"));
ok(!iswhitespace("a"));
