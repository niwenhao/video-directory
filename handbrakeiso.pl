#!/usr/bin/perl

$SRC_DIR=$ARGV[0];
$DEST_DIR=$ARGV[1];

die "Error parameters" unless -d $SRC_DIR && -d $DEST_DIR;

sub conviso {
    my $file = shift;

    my $fpath = "$SRC_DIR/$file";
    my $tpath = "$DEST_DIR/$file";
    $tpath =~ s/\.iso$/.m4v/g;

    unless ( -f $tpath ) {
        print "$fpath => $tpath\n";
        my $tdir = $tpath;
        $tdir =~ s/\/[^\/]+$//g;
        system "mkdir -p $tdir";
        system "HandBrakeCLI -f mp4 -O -e x264 --x264-preset faster -i '$fpath' -o /tmp/v.m4v 2>/dev/null";
        if ($? == 0) {
            system "mv /tmp/v.m4v '$tpath'";
        }
    }
}

my @flist = `cd $SRC_DIR && find * -name '*.iso'`;

for (@flist) {
    chop;
    conviso($_);
}
