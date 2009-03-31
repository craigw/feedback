plugin_root = File.expand_path(File.dirname(__FILE__) + '/..')

require plugin_root + '/init'
require 'rubygems'
require 'hpricot'
require 'action_view'
require 'feedback'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

class String
  def has_tag?(selector, content_check = nil)
    elements = (Hpricot(self) / selector).to_a
    if content_check
      elements.any? { |element| (element / "text()").to_s =~ content_check }
    else
      elements.any?
    end
  end
end