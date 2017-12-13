#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(trim safe_trim);
use Test::Simple tests => 8;

# Test left / right
ok(trim('  abc    ', 'left') eq 'abc    ');
ok(trim('  abc    ', '  right') eq '  abc');
ok(trim('  abc    ', '  rIGht') eq '  abc'); # Verify case insensitve
ok(safe_trim('  abc    ', '  right') eq '  abc');
ok(safe_trim(undef, '  right') eq '');

# Default behavior is 'both'.
ok(trim('  abc    ', 'both') eq 'abc'); # Explicit
ok(trim('  abc    ') eq 'abc'); # Implicit
ok(safe_trim(undef) eq '');
