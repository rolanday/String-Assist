## String::Assist
Collection of handy string helper methods.

## Functions
#### has_print($str)
Returns 1 if $str contains printable characters, else returns 0.

#### is_integer($str)
Returns 1 if $str represents integer numeric value, else returns 0.

#### is_whitespace($str)
Returns 1 if $str contains all whitespace (i.e., no printable characters), else returns 0.

#### safe_trim($str, $mode)
Identical to *trim*, except that caller can safely pass undefined value (undef). If undef is passed, empty string ('') is returned.

See *trim* for additional details.

#### trim($str, $mode)
Removes leading and / or trailing spaces from string. **$mode** specifies the specific behavior:

* **'left':** Removes leading space.
* **'right':** Removes trailing space.
* **'both':** Removes leading and trailing space.   

The default $mode is 'both', and is used if $mode is not passed or is undefined.
```perl
my $result = trim('   abcdefg   ');
say $result; # prints 'abcdefg'

$result = trim('   abcdefg   ', 'left');
say $result; # prints 'abcdefg   '

$result = trim('   abcdefg   ', 'right');
say $result; # prints '   abcdefg'
```

#### squeeze($str)
Squeezes out the space from string. Similar to trim($str, 'both') except also removes any space inside the string.

```perl
my $result = squeeze(' a b c def g    ');
say $result; #prints 'abcdefg'
```

#### replace_char($str, $char, $replace_char)
Replaces all occurrences of *$char* in *$str* with *$replace_char value*.

```perl
my $result = replace_char('abcdefg', 'd', 'x');
say $result; # prints 'abcxefg'
```
**Note:** $replace_char must be single character or '', else the method will fail.

#### replace_chars($str, \@chars, $replace_char)
Identical to *replace_char*, except caller can pass an array of characters to be replaced by $replace_char. *@chars* must be passed by reference.

```perl
my @chars = qw(b d f);
my $result = replace_chars('abcdefg', \@chars, 'x');
say $result; # $prints 'axcxexg'
```
**Note:** Each value in @chars must be single character, else the method will fail.

## Installation
There are two recommended approaches to installing this module.
* CPAN method
* Make

#### CPAN Method
To install via cpanm's git function:

```
cpanm https://github.com/rolanday/String-Assist.git
```
**Note:** This method requires that you have [cpanm](https://www.cpan.org/modules/INSTALL.html) and make installed on your system.

#### Make Method
Download and unpack (or fork) this repository, and then run the following commands from folder root:

```
$ perl Makefile.PL
$ make
$ make install
```

Prior to running 'make install', you optionally run the following command to test the module on your system.

```
$make test
```

**Note:** Windows users should use *dmake* instead of *make*.

## COPYRIGHT

Copyright 2017 - Roland Ayala

## LICENSE

This software is licensed under terms of MIT License.
