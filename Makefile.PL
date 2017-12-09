use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 7.24;

my %WriteMakefileArgs = (
  "ABSTRACT" => "String test and manipulation methods",
  "AUTHOR" => "Roland Ayala <rolanday\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "7.30"
  },
  "DISTNAME" => "String-Assist",
  "LICENSE" => "mit",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "String::Assist",
  "PREREQ_PM" => {
    "Carp" => 0,
    "if" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "Test::Simple" => 0,
    "lib" => 0,
    "open" => 0
  },
  "VERSION" => "1.00",
  "test" => {
    "TESTS" => "t/*.t"
  }
);

WriteMakefile(%WriteMakefileArgs);
