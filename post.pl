use strict;
use 5.10.0;

my $fn = $ARGV[0];

my ($bn, $ext) = $fn =~ m|(.*)[.](.*)|;

my %att;
$att{date} = `date +"%Y-%m-%d"`;
chomp $att{date};

$att{slug} = $bn;

while(<>){
	last if /^---/;
}

## I'm parsing the yaml myself!
while(<>){
	last if /^---/;
	chomp;
	if (my($tag, $text) = /(.*):\s*(.*)/){
		$att{$tag}=$text;
	}
}

## The slug is parsed here, but is also used by Jekyll and can't be just an integer
$att{slug} = "$att{slug}-$att{title}";
$att{slug} =~ s/ /-/g;

say "cp $fn _posts/$att{date}-$att{slug}.$ext";
