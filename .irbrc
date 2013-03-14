require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

require 'logger'
if Object.const_defined? 'Rails'
    Rails.logger = Logger.new STDOUT
end
# print SQL to STDOUT
if Object.const_defined? 'ActiveRecord'
  ActiveRecord::Base.logger = Logger.new STDOUT
  ActiveRecord::Base.clear_reloadable_connections!
end
