# Nodistract
Created to help me actually get on with some of my university work, this simple shell script blocks/unblocks a configurable list of sites so you can get on *distraction free*.

## Usage
To install, simply symlink the script into your `/bin/` directory:
```bash
$ sudo ln /path/to/nodistract.sh /usr/bin/nodistract
# Then use by simply running...
$ nodistract
Password:
Blocking those pesky distractions...
...
$ nodistract
Unblocking those beautiful distractions...
```

### Notes
This was intended to be super simple without the clutter of a lot of the GUI based apps that perform the same job. If you have any ideas to improve the code please send me a pull request!