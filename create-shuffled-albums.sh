#!/bin/bash

# Album limit
ALBUM_LIMIT=10

# Get latest library from cmus
cmus-remote -C "save -l $(pwd)/cmus-library.pl"

# Use awk to group songs by album
awk -F'/' '{
    album = $(NF-1);
    songs[album] = songs[album] $0 "\n"
}
END {
    for (a in songs) {
        print "BEGIN_ALBUM:" a "\n" songs[a] "END_ALBUM"
    }
}' "./cmus-library.pl" > "./grouped-albums.pl"

# Shuffle the albums and limit to $ALBUM_LIMIT
awk -v album_limit="$ALBUM_LIMIT" 'BEGIN {
    srand();
    RS="END_ALBUM";
    ORS=""
}
{
    albums[NR] = $0 "END_ALBUM"
}
END {
    for (i=1; i<=album_limit; i++) {
        rand_idx = int(1 + rand() * NR);
        temp = albums[i];
        albums[i] = albums[rand_idx];
        albums[rand_idx] = temp;
    }
    for (i=1; i<=album_limit; i++) {
        gsub(/BEGIN_ALBUM:[^\n]*\n/, "", albums[i]);
        gsub(/END_ALBUM/, "", albums[i]);
        gsub(/\n+/, "\n", albums[i]);
        print albums[i]
    }
}' "./grouped-albums.pl" > "./shuffled-albums.pl"

# Remove empty lines from the shuffled-albums.pl file
sed -i '/^$/d' "./shuffled-albums.pl"


# Add playlist to cmus
cmus-remote -C "pl-import $(pwd)/shuffled-albums.pl"