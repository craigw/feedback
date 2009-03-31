$:.unshift(File.dirname(__FILE__) + '/lib')
require 'feedback'

if defined?(ActionView::Base)
  ActionView::Base.class_eval do
    include Feedback::Flash
  end
end