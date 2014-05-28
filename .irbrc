require 'rubygems' rescue nil
begin
  require 'wirble' #Colors
  Wirble.init
  Wirble.colorize
rescue LoadError
end

require 'pp' # Pretty Print
begin
  require 'ap' # Awesome Print
rescue LoadError
end
require 'irb/completion'
IRB.conf[:AUTO_INDENT]=true

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"


#Add local methods
class Object
  # Return a list of methods defined locally for a particular object.  Useful
  # for seeing what it does whilst losing all the guff that's implemented
  # by its parents (eg Object).
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end
