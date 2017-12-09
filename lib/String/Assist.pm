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
our @EXPORT_OK = qw(
  hasprint
  iswhitespace
  replacechar
  replacechars
  safetrim
  squeeze
  trim
  );
our %EXPORT_TAGS = (all => [@EXPORT_OK]);

sub hasprint {
  my $str = shift;
  return defined $str ? $str =~ /[!-~]/g : 0;
}

sub iswhitespace {
  return !hasprint(shift);
}

sub safetrim {
  my $str = shift;
  if (! defined $str) {
    $str = '';
  }
  return trim($str, shift);
}

sub trim {
  my ($str, $mode) = @_;
  if (! defined $str) {
    croak "Invalid argument";
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
      croak "Invalid arg[1]: Illegal mode";
  }

  return $str;
}

sub squeeze {
  my $str = shift;
  return replacechar($str, ' ', '');
}

sub replacechar {
  my ($str, $old, $replacement) = @_;
  my @chars = ($old);
  return replacechars($str, \@chars, $replacement);
}

sub replacechars {

  my ($str, $chars_ref, $replacement) = @_;
  if (! defined $str) {
    croak 'Invalid arg[0]';
  }

  if (! defined $chars_ref || ref($chars_ref) ne 'ARRAY') {
    croak 'Invalid arg[1]: Must be array passed by ref.';
  }
  my @chars = @ {$chars_ref};

  if (! defined $replacement || length $replacement > 1) {
    croak 'Invalid arg[2]';
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

=head1 Methods

=over 3

=item B<hasprint($str)>

Returns 1 if $str contains printable characters, else returns 0.

=item B<iswhitespace($str)>

Returns 1 if $str contains all whitespace (i.e., no printable characters),
else returns 0.

=item B<safetrim($str, $mode)>

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

=item B<replacechar($str,  $char, $replace_char)>

Replaces all occurrences of *$char* in *$str* with *$replace_char value*.

B<Note:> $replace_char must be single character or '', else the method will
fail.

=item B<replacechars($str, \@chars, $replace_char)>

Identical to C<replacechar>, except caller can pass an array of characters to
be replaced by C<$replace_char>. C<@chars> must be passed by reference.

B<Note:> Each value in @chars must be single character, else the method will
fail.

=back

=cut
