
use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR              => 'Kang-min Liu (gugod@gugod.org)',
    ABSTRACT            => 'Parse ExCtags tags file',
    NAME                => 'Parse::ExCtags',
    VERSION		=> '0.01',
    DISTNAME            => 'Parse-ExCtags',
    PREREQ_PM           => {
    	'IO::All'	=> 0,
    	'Spiffy'	=> 0,
    },
    dist                => {
        COMPRESS        => 'gzip -9',
        SUFFIX          => '.gz',
    },
);

