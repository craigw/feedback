$:.unshift(File.dirname(__FILE__) + '/lib')
require 'feedback'

if defined?(ApplicationHelper)
  ApplicationHelper.class_eval do
    extend Feedback::Flash
  end
end