#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(is_integer);
use Test::Simple tests => 8;

ok(is_integer('123'));
ok(is_integer('0'));
ok(is_integer('123456789'));
ok(!is_integer('-1234'));
ok(!is_integer('1.2'));
ok(!is_integer('1a2'));
ok(!is_integer('xyz'));
ok(!is_integer('01234'));
