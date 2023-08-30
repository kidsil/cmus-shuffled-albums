# CMUS Album Shuffler

## Overview

This script automates the process of creating a shuffled playlist of complete albums for the Cmus music player. It groups songs by albums, shuffles the albums, and limits the playlist to a specified number of albums. The script then auto-imports this playlist into Cmus.

## Requirements

- Bash
- Awk
- Sed
- Cmus music player installed and configured

## Features

- Fetches the latest library from Cmus
- Groups songs by albums
- Shuffles albums randomly
- Limits the playlist to a specified number of albums (default is 10)
- Removes empty lines from the playlist
- Imports the shuffled playlist into Cmus

## Usage

1. Clone this repository or download the script.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

    ```bash
    chmod +x your-script-name.sh
    ```

4. Run the script:

    ```bash
    ./your-script-name.sh
    ```

5. Open Cmus to see your new shuffled playlist of complete albums.

## Configuration

You can change the number of albums in the shuffled playlist by modifying the `ALBUM_LIMIT` variable at the top of the script.

```bash
# Album limit
ALBUM_LIMIT=10  # Change this number to your preference
```

## License

This script is released under the MIT License.