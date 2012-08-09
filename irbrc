# Enable auto-complete and readline history in IRB
# http://quotedprintable.com/2007/6/9/irb-history-and-completion
require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
