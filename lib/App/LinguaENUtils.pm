package App::LinguaENUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use App::LinguaCommonUtils qw(%arg_words %arg_nums);

our %SPEC;

$SPEC{plural_to_singular} = {
    v => 1.1,
    summary => 'Convert plural noun to singular',
    'x.no_index' => 1,
    args => {
        %arg_words,
    },
    result_naked => 1,
};
sub plural_to_singular {
    require Lingua::EN::PluralToSingular;

    my %args = @_;

    [map {Lingua::EN::PluralToSingular::to_singular($_)} @{ $args{words} }];
}

$SPEC{singular_to_plural} = {
    v => 1.1,
    summary => 'Convert singular noun to plural',
    'x.no_index' => 1,
    args => {
        %arg_words,
    },
    result_naked => 1,
};
sub to_plural {
    require Lingua::EN::Inflect;

    my %args = @_;

    [map {Lingua::EN::Inflect::PL($_)} @{ $args{words} }];
}

$SPEC{num_to_word} = {
    v => 1.1,
    summary => 'Convert number (123) to word ("one hundred twenty three")',
    'x.no_index' => 1,
    args => {
        %arg_nums,
    },
    result_naked => 1,
};
sub num_to_word {
    require Lingua::EN::Nums2Words;

    my %args = @_;

    [map {lc(Lingua::EN::Nums2Words::num2word($_))} @{ $args{nums} }];
}

$SPEC{word_to_num} = {
    v => 1.1,
    summary => 'Convert phrase ("one hundred twenty three") to number (123)',
    'x.no_index' => 1,
    args => {
        %arg_words,
    },
    result_naked => 1,
};
sub word_to_num {
    require Lingua::EN::Words2Nums;

    my %args = @_;

    [map {Lingua::EN::Words2Nums::words2nums($_)} @{ $args{words} }];
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

=for Pod::Coverage .+

=head1 SYNOPSIS

This distribution provides the following command-line utilities:

#INSERT_EXECS_LIST


=head1 DESCRIPTION

This distribution will become a collection of CLI utilities related to English
language. Currently it contains very little and the collection will be expanded
in subsequent releases.


=head1 SEE ALSO

=cut
