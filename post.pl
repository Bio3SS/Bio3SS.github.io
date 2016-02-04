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

while(<>){
	last if /^---/;
	chomp;
	if (my($tag, $text) = /(.*):\s*(.*)/){
		$att{$tag}=$text;
	}
}

$att{slug} =~ s/ /-/g;

say "cp $fn _posts/$att{date}-$att{slug}.$ext";
