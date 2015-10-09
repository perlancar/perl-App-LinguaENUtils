package App::LinguaENUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

my %words_arg = (
    words => {
        'x.name.is_plural' => 1,
        schema => ['array*', of=>'str*', min_len=>1],
        req => 1,
        pos => 0,
        greedy => 1,
    },
);

$SPEC{to_singular} = {
    v => 1.1,
    summary => 'Convert plural noun to singular',
    'x.no_index' => 1,
    args => {
        %words_arg,
    },
    result_naked => 1,
};
sub to_singular {
    require Lingua::EN::PluralToSingular;

    my %args = @_;

    [map {Lingua::EN::PluralToSingular::to_singular($_)} @{ $args{words} }];
}

$SPEC{to_plural} = {
    v => 1.1,
    summary => 'Convert singular noun to plural',
    'x.no_index' => 1,
    args => {
        %words_arg,
    },
};
sub to_plural {
    require Lingua::EN::Inflect;

    my %args = @_;

    [map {Lingua::EN::Inflect::PL($_)} @{ $args{words} }];
}

$SPEC{num_to_word} = {
    v => 1.1,
    summary => 'Convert number (123) to phrase ("one hundred twenty three")',
    'x.no_index' => 1,
};
sub num_to_phrase {
    [501, "Not yet implemented"];
}

$SPEC{word_to_num} = {
    v => 1.1,
    summary => 'Convert phrase ("one hundred twenty three") to number (123)',
    'x.no_index' => 1,
};
sub phrase_to_num {
    [501, "Not yet implemented"];
}

# note: term for converting to_singular & to_plural = inflect (to singular or plural)
# XXX: is_plural (LE:PluralToSingular)
# XXX: stem
# XXX: fathom - measure readability of English text
# XXX: count-syllables (LE:Styllable)
# XXX: namecase - convert johnsmith to JohnSmith
# XXX: prase-verb (LE:VerbTense)
# XXX: split text to sentences (Lingua::EN::Sentence)
# XXX: Identify-EN
# XXX: LE:Segmenter
# XXX: LE:Fractions
# XXX: hyphenate
# XXX: infinitive - define infinitive form of conjugated word, e.g. ?
# XXX: LE:summarize
# XXX: LE:NameParse
# XXX: LE:Conjugate (e.g. verb look + pronoun he + tense perfect_prog + negation = he was not looking)
# XXX: LE:Contraction (e.g. I am not going to explain it, if you cannot' -> I'm not going to explain it, if you can't'
# XXX: LE:FindNumber
# XXX: LE:AddressParse
# XXX: LE:Number:Years (word_to_num_year?)

1;
# ABSTRACT: Command-line utilities related to the English language

=head1 SYNOPSIS

This distribution provides the following command-line utilities:

#INSERT_EXECS_LIST


=head1 SEE ALSO

=cut
