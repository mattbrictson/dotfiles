# mattbrictson’s dotfiles

This project contains the dotfiles and custom shell scripts that I use on my Mac.

Why keep them at GitHub? It’s a way to share advanced shell tips with other developers, and more practically, a way to back up my configuration. When I get a new Mac or (knock on wood) need to recover from lost data or a corrupt OS, I can simply clone this repository and immediately be back in business.

Thank you [Ryan Bates](https://github.com/ryanb/dotfiles), [thoughtbot](http://github.com/thoughtbot/dotfiles) and [Tom Ryder](https://github.com/tejr/dotfiles) for the inspiration.

## Requirements

Before using these dotfiles there are a few things you'll need to install manually:

1. Your Mac needs git and Apple’s command-line developer tools.
2. Homebrew.

My blog post here has a walkthrough: https://mattbrictson.com/rails-osx-setup-guide

## Installation

Choose a place to store the dotfiles, like `~/Code/dotfiles`.

```
git clone git://github.com/mattbrictson/dotfiles ~/Code/dotfiles
cd ~/Code/dotfiles
```

Run one of the three installation options:

```
rake install:dotfiles # Install the dotfiles and scripts
rake install:packages # Install homebrew packages and Mac defaults
rake install          # Install all of the above (recommended)
```

### Changing your bash version

Some features of the dotfiles only work with bash version 4.2. After installing bash via homebrew (which `rake install:packages` does for you), enable it as your shell as follows:

1. Add `/usr/local/bin/bash` to `/etc/shells`
2. Change your shell to `/usr/local/bin/bash` by running `chsh`

### Package Control

The Sublime Text packages included in these dotfiles will automatically install themselves the next time you launch Sublime Text, but you need to manually install [Package Control](https://packagecontrol.io) first:

1. Press <kbd>SHIFT</kbd> <kbd>CMD</kbd> <kbd>P</kbd> to bring up the command palette
2. Type `install`
3. Select the option to install Package Control

## What’s included?

### Sublime Text 3 settings and packages

For consistency with dotfiles for other apps, I put my Sublime Text 3 configuration in `~/.sublime`. To ensure that Sublime Text can find this directory, I symlink `~/Library/Application Support/Sublime Text 3/Packages/User` to it. The installation rake task (see below) takes care of setting this up for you. Here's what my dotfiles specify for Sublime:

- Settings optimized for Rails development
- Better auto-complete behavior
- Custom key bindings

#### Color scheme

- ayu (dark, customized)

#### Packages

- A File Icon
- AdvancedNewFile
- All Autocomplete
- ApplySyntax
- AutoFileName
- Case Conversion
- CloseOtherWindows
- Color Highlighter
- DashDoc
- DocBlockr
- EditorConfig
- Emmet
- Gem Browser
- GitGutter
- Hasher
- Indent XML
- JSPrettier
- Markdown Preview
- Marked App Menu
- PackageResourceViewer
- Pretty JSON
- ScopeAlways
- SublimeLinter
- SublimeLinter-annotations
- SublimeLinter-eslint
- SublimeLinter-json
- SublimeLinter-rubocop
- SublimeLinter-ruby
- SublimeLinter-stylelint
- Terminal

#### Syntax highlighting

- Babel
- Better CoffeeScript
- Cucumber
- Dockerfile Syntax Highlighting
- eco (Embedded CoffeeScript)
- Git
- Gradle_Language
- Handlebars
- Kotlin
- nginx
- Protobuf Syntax Hightlighting
- Ruby Slim
- Sass
- SSH Config
- Swift

### Handy scripts

These scripts will be installed to `~/.bin` and added to your `$PATH`:

- `brew-install` installs and updates my standard suite of homebrew recipes. Run it on a new machine after installing homebrew to get all the recipes needed for Rails development, node, PostgreSQL, etc.
- `bucket` is a simple command-line interface for Bitbucket, most notably providing a way to create pull requests. Run `bucket --help` for details.
- `defaults-install` uses `defaults write` on OS X to change system default behavior to my liking: e.g. don't include drop-shadows on screenshots.
- `git-pluck` adds the `pluck` command to git, which is a trick for cherry-picking a commit from another repository into the current one: `git pluck ../other-repo SHA`.
- `git-reap` adds the `reap` command to git, which deletes local and remote branches that have already been merged with the master branch and thus are no longer needed.
- `node-install` is a convenient wrapper around `nodenv install` that does some easy-to-forget housekeeping before and after installation. Usage: `node-install 12.14.0`.
- `ruby-install` is a convenient wrapper around `rbenv install` that does some easy-to-forget housekeeping before and after installation. Usage: `ruby-install 2.1.2`.
- `sup` uses SSH to update packages on one or more Ubuntu servers (assuming you have root access to them). In other words, `sup SERVER1 SERVER2` will SSH as root into both servers and run the appropriate `aptitude` commands to safely update all packages. It will also report whether any daemons need to be restarted for the updates to take effect.

### Shell enhancements (bash)

- Customizes the shell prompt with current directory and git status: e.g. `~/Work/dotfiles (master *%)$`.
- Replaces `diff` with `colordiff`.
- Prettifies `ls` output and adds `l`, `la`, and `ll` shortcuts.
- Improves default `top` settings.
- Allows bash command history to be navigated with up and down arrow keys.
- Makes bash auto-completion case-insensitive.
- Sets up necessary homebrew, rbenv, and python virtualenv shell variables.
- Specifies `less` as the default pager and Sublime Text (`subl`) as the default editor.
- Sets better defaults for the `psql` command.

### Git configuration

- Sets up a reasonable global gitignore file to ignore things like `.DS_Store`, `Icon?`, and `*sublime-project`.
- Enables color output and line-ending checks.
- Shortens common commands: `di`, `co`, `ci`, `br`, `l`, `sw`.
- Defines somes useful aliases:
  - `git hist`
  - `git ignored-files`
  - `git untracked-files`
  - `git unstage`

In addition, during installation (see below), you will be prompted for your full name and email address, which are automatically added to the git config file.

### Ruby/rails stuff

- Adds an `r` command that serves as a shortcut for running `bin/rake` or `bin/rails`. It's pretty smart, so `r s` will expand to `bin/rails server`, and `r db` will expand to `bin/rake db:console`. No more mistakes of typing `rails` vs `rake`!
- Disables gem documentation generation so that `gem install` runs much faster.
- Uses my [rails-template](https://github.com/mattbrictson/rails-template) when running `rails new`.
- Configures the `xray` gem to use Sublime Text.
- Enables command history (use up and down arrows) in `irb`.
- Defines a list of useful gems that are installed by default whenever a new version of ruby is installed via `rbenv install`.
