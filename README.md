# Sucros - A ChromeOS daemon that allows running sudo commands in crosh shell.

<br>

### How to install:

<br>

- Press `ctrl-alt-t`, open a crosh `shell` and paste:

<pre>bash <(curl -s "https://raw.githubusercontent.com/shadowed1/sucros/main/bin/sucros_downloader.sh?$(date +%s)")</pre>

<br>

### How to use:

- After installing, open VT-2 (ctrl-alt-refresh), log in as chronos, and run:
`sudo sucros-daemon`

- Leave VT-2 (ctrl-alt-back) and prepend `sucros` to the command of your choice in crosh `shell`. 

### How does this work? 

- Uses `fifo` for bidirectional communication between crosh shell and VT-2 when prepending `sucros` to command. 
- The daemon uses `read` to passively wait for use of its fifo before it replies back.
- Fully atomic and ephemeral without any buffer. 
