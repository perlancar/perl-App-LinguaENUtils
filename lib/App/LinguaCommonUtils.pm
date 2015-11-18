package App::LinguaCommonUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(%arg_words %arg_nums);

our %arg_words = (
    words => {
        'x.name.is_plural' => 1,
        schema => ['array*', of=>'str*', min_len=>1],
        req => 1,
        pos => 0,
        greedy => 1,
    },
);

our %arg_nums = (
    nums => {
        'x.name.is_plural' => 1,
        schema => ['array*', of=>'num*', min_len=>1],
        req => 1,
        pos => 0,
        greedy => 1,
    },
);

1;
# ABSTRACT: Common routines/data structures for App::LinguaXXUtils

=for Pod::Coverage .+

=cut
