# Enable auto-complete and readline history in IRB
# http://quotedprintable.com/2007/6/9/irb-history-and-completion
require "irb/completion"
require "irb/ext/save-history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# Prefer AmazingPrint, but don't load it if AwesomePrint is already in use
unless defined?(AwesomePrint)
  begin
    require "amazing_print"
    AmazingPrint.irb!
  rescue LoadError
  end
end

# If AmazingPrint isn't available, fall back to AwesomePrint
unless defined?(AmazingPrint)
  begin
    require "awesome_print"
    AwesomePrint.irb!
  rescue LoadError
  end
end
