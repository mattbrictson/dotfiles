# mbrictson's dotfiles

## Installation

Choose a place to store the dotfiles, like `~/Library/dotfiles`.

```
git clone git://github.com/mbrictson/dotfiles ~/Library/dotfiles
cd ~/Library/dotfiles
rake install
```

Some features of the `bashrc` may work only with bash version 4.2, which is not installed by default on the Mac. Consider using these steps to get it:

* `brew install bash`
* Add `/usr/local/bin/bash` to `/etc/shells`
* Change your shell to `/usr/local/bin/bash` by running `chsh`

## Notable features

These dotfiles assume a Mac setup that uses `rbenv` and `brew`, with the `bash-completion` and `git` recipes installed. However, it should degrade gracefully if these aren't present.

An `r` command serves as a shortcut for running `bundle exec rake` or `bundle exec rails`. It's pretty smart, so `r s` will expand to `bundle exec rails server`, and `r db` will expand to `bundle exec rake db:console`. No more fat-finger mistakes of `rails` vs `rake`!

On your local Mac the prompt will be nice and concise. Notice that deep paths are truncated to the last 2 segments:

    ~/.../Application Support/TextMate$

When logged into a remote machine, you'll be reminded with the hostname:

     myserver /opt/local$

Fancy git status is automatically included in the prompt:

    ~/.../mbrictson/dotfiles (master *%)$

## Credits

Inspired by dotfiles from [Ryan Bates](https://github.com/ryanb/dotfiles) and [thoughtbot](http://github.com/thoughtbot/dotfiles).
