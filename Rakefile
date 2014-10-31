# Based on https://github.com/ryanb/dotfiles/

require "erb"
require "fileutils"
require "rake"

IGNORE = %w(
  Rakefile README.md LICENSE
  dotfiles.sublime-project dotfiles.sublime-workspace
)

task :default => "install"

desc "Install packages and dotfiles"
task :install => ["install:packages", "install:dotfiles"]

namespace :install do
  desc "Install homebrew, npm, etc. packages"
  task :packages do
    %w(brew defaults npm).each do |type|
      log(:blue, "executing bin/#{type}-install …")
      system("bin/#{type}-install")
    end
  end

  desc "Install dotfiles into user’s home directory"
  task :dotfiles => :link_sublime do
    always_replace = false

    Dotfile.each do |dotfile|
      case dotfile.status
      when :identical
        log(:green, "identical #{dotfile}")
      when :missing
        dotfile.link!
      when :different
        if always_replace
          dotfile.replace!
        elsif (answer = ask(:red, "overwrite? #{dotfile}"))
          always_replace = true if answer == :always
          dotfile.replace!
        else
          log(:gray, "skipping #{dotfile}")
        end
      end
    end
  end

  desc "Symlink the Sublime Packages/User directory"
  task :link_sublime do
    dot_sublime = File.expand_path("~/.sublime")
    user_packages = File.expand_path("~/Library/Application Support/Sublime Text 3/Packages/User")
    if !File.exist?(user_packages)
      log(:magenta, "mkdir Library/Application Support/Sublime Text 3/Packages/User")
      FileUtils.mkdir_p(user_packages)
    end
    if File.directory?(user_packages) && ! File.symlink?(user_packages)
      log(:magenta, "mkdir .sublime")
      FileUtils.mkdir_p(dot_sublime)
      log(:blue, "copy  Library/Application Support/Sublime Text 3/Packages/User/*")
      FileUtils.cp_r(Dir.glob(user_packages.shellescape + "/*"), dot_sublime)
      log(:magenta, "rm    Library/Application Support/Sublime Text 3/Packages/User")
      FileUtils.rm_rf(user_packages)
      log(:blue, "linking Library/Application Support/Sublime Text 3/Packages/User")
      FileUtils.ln_s(dot_sublime, user_packages)
    end
  end
end

def log(color, message, options={})
  require "highline" rescue nil

  first, rest = message.split(" ", 2)
  first = first.ljust(10)

  if defined?(HighLine::String)
    first = HighLine::String.new(first).public_send(color)
  end

  line = [first, rest].join(" ")

  if line.end_with?(" ")
    print(line)
  else
    puts(line)
  end
end

def ask(color, question)
  log(color, "#{question} [ynaq]? ")

  case $stdin.gets.chomp
  when "a"
    :always
  when "y"
    true
  when "q"
    exit
  else
    false
  end
end

class Dotfile
  def self.each(directory=nil, &block)
    Dir[File.join([directory, "*"].compact)].each do |file|
      next if IGNORE.include?(file)

      if File.directory?(file)
        each(file, &block)
      else
        yield(new(file))
      end
    end
  end

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def erb?
    file =~ /\.erb\z/i
  end

  def name
    ".#{file.sub(/\.erb\z/i, "")}"
  end
  alias :to_s :name

  def target
    File.expand_path("~/#{name}")
  end

  def status
    if File.identical?(file, target)
      :identical
    elsif File.exist?(target) || File.symlink?(target)
      :different
    else
      :missing
    end
  end

  def link!
    ensure_target_directory

    if erb?
      log(:yellow, "generating #{self}")
      contents = ERB.new(File.read(file)).result(binding)

      log(:blue, "writing #{self}")
      File.open(target, "w") do |out|
        out << contents
      end
    else
      log(:blue, "linking #{self}")
      FileUtils.ln_s(File.absolute_path(file), target)
    end
  end

  def replace!
    FileUtils.rm_rf(target)
    link!
  end

  def ensure_target_directory
    directory = File.dirname(target)
    return if File.directory?(directory)

    log(:magenta, "mkdir #{File.dirname(name)}")
    FileUtils.mkdir_p(directory)
  end
end
