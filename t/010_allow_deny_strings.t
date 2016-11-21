#!perl -w
use strict;
use Test::More;

use FormValidator::Simple::Struct;

# test FormValidator::Simple::Struct here

sub HASHREF {'excepted hash ref'};
sub ARRAYREF {'excepted array ref'};
sub REF {'excepted ref'};
sub INVALID{'excepted ' . $_[0]};

my $v = FormValidator::Simple::Struct->new();

ok $v->check({hoge =>  "hoge" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "fuga" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "piyo" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});

ok !$v->check({hoge =>  "foo" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "bar" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "baz" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});

ok !$v->check({hoge =>  "hogefuga" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "fugapiyo" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "piyohoge" },{hoge=> [['ALLOW_STRING' , [qw/hoge fuga piyo/]]]});

ok !$v->check({hoge =>  "hoge" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "fuga" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok !$v->check({hoge =>  "piyo" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});

ok $v->check({hoge =>  "foo" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "bar" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "baz" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});

ok $v->check({hoge =>  "hogefuga" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "fugapiyo" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});
ok $v->check({hoge =>  "piyohoge" },{hoge=> [['DENY_STRING' , [qw/hoge fuga piyo/]]]});

done_testing;
