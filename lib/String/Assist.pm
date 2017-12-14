use 5.008001;
use strict;
use warnings;
our $VERSION = '1.00';
$VERSION = eval $VERSION;

# Please see POD after __END__
package String::Assist;

# Required modules
use Carp;

# Exporting business
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = ();
our %EXPORT_TAGS = (
  # all public non-object-oriented functions:
  Public => [qw(
  has_print
  is_integer
  is_whitespace
  replace_char
  replace_chars
  safe_trim
  squeeze
  trim
  )],
);
Exporter::export_ok_tags(keys %EXPORT_TAGS);

sub has_print {
  my $str = shift;
  return defined $str ? $str =~ /[!-~]/g : 0;
}

sub is_integer {
  my $str = shift;
  if (is_whitespace($str)) {
    croak 'invalid arg[$str]';
  }

  return ($str eq '0' || $str =~ m/^[1-9]\d*$/g);
}

sub is_whitespace {
  return !has_print(shift);
}

sub safe_trim {
  my $str = shift;
  if (! defined $str) {
    $str = '';
  }
  return trim($str, shift);
}

sub trim {
  my ($str, $mode) = @_;
  if (! defined $str) {
    croak 'invalid arg[$str]';
  }

  if (defined $mode) {
    $mode =~ s/^\s+|\s+$//g;
    $mode = lc $mode;
  } else {
    $mode = 'both'; #default
  }

  if ($mode eq 'left') {
    $str =~ s/^\s+//;
  } elsif ($mode eq 'right') {
    $str =~ s/\s+$//;
  } elsif ($mode eq 'both') {
    $str =~ s/^\s+|\s+$//g
  } else {
      croak 'invalid arg<$mode>';
  }

  return $str;
}

sub squeeze {
  my $str = shift;
  return replace_char($str, ' ', '');
}

sub replace_char {
  my ($str, $old, $replacement) = @_;
  my @chars = ($old);
  return replace_chars($str, \@chars, $replacement);
}

sub replace_chars {

  my ($str, $chars_ref, $replacement) = @_;
  if (! defined $str) {
    croak 'invalid arg[$str]';
  }

  if (! defined $chars_ref || ref($chars_ref) ne 'ARRAY') {
    croak 'invalid arg[$chars_ref]';
  }
  my @chars = @ {$chars_ref};

  if (! defined $replacement || length $replacement > 1) {
    croak 'invalid arg[$replacement]';
  }

  my $pattern = "";
  foreach my $c (@chars) {
    if (length $c != 1) {
      croak 'Invalid arg[1]';
    }
    $pattern = join('|',$pattern, quotemeta $c);
  }

  # Trim the leading pipe (|) char
  $pattern =~ s/^.//s;
  $str =~ s/$pattern/$replacement/g;
  return $str;
}

1;

__END__

=pod

=head1 NAME

String::Assist - String helper methods.

=head1 SYNOPSIS

 use String::Assist ':Public';
 
 print trim('   foobar   ')."\n";

 __END__
 Prints 'foobar' to console.


=head1 Methods

=over 3

=item B<has_print($str)>

Returns 1 if $str contains printable characters, else returns 0.

=item B<is_whitespace($str)>

Returns 1 if $str contains all whitespace (i.e., no printable characters),
else returns 0.

=item B<safe_trim($str, $mode)>

Identical to C<trim>, except that caller can safely pass undefined value
C<undef>. If C<undef> is passed, empty string ('') is returned.

See C<trim> for additional details.

=item B<trim($str, $mode)>

Removes leading and / or trailing spaces from string. C<$mode> specifies the
specific behavior:

=over 2

=item *

B<left:>  Removes leading space.

=item *

B<right:> Removes trailing space.

=item *

B<both:>  Removes leading and trailing space.

=back

The default mode is C<both>, and is used if C<$mode> is not passed or is
undefined.

=item B<squeeze($str)>

Squeezes out the space from string. Similar to C<trim($str, 'both')> except
also removes any space inside the string.

=item B<replace_char($str,  $char, $replace_char)>

Replaces all occurrences of *$char* in *$str* with *$replace_char value*.

B<Note:> $replace_char must be single character or '', else the method will
fail.

=item B<replace_chars($str, \@chars, $replace_char)>

Identical to C<replace_char>, except caller can pass an array of characters to
be replaced by C<$replace_char>. C<@chars> must be passed by reference.

B<Note:> Each value in @chars must be single character, else the method will
fail.

=back

=cut
