#!/usr/bin/perl -w
use strict;
use warnings;
use String::Assist qw(trim safetrim);
use Test::Simple tests => 8;

# Test left / right
ok(trim('  abc    ', 'left') eq 'abc    ');
ok(trim('  abc    ', '  right') eq '  abc');
ok(trim('  abc    ', '  rIGht') eq '  abc'); # Verify case insensitve
ok(safetrim('  abc    ', '  right') eq '  abc');
ok(safetrim(undef, '  right') eq '');

# Default behavior is 'both'.
ok(trim('  abc    ', 'both') eq 'abc'); # Explicit
ok(trim('  abc    ') eq 'abc'); # Implicit
ok(safetrim(undef) eq '');
