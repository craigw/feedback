plugin_root = File.expand_path(File.dirname(__FILE__) + '/..')

require plugin_root + '/init'
require 'rubygems'
require 'hpricot'
require 'action_view'
require 'feedback'


module FakeAssertSelect
  def assert_select(tags, selector, content_check = nil)
    tags.to_s.has_tag?(selector, content_check)
  end
end

Spec::Runner.configure do |config|
  config.mock_with :mocha
  config.include(FakeAssertSelect)
end

class String
  def has_tag?(selector, content_check = nil)
    elements = (Hpricot(self) / selector).to_a
    if content_check
      elements.select! { |element| (element / "text()").to_s =~ content_check }
    end
    elements.any? ? elements.to_s : false
  end
end