module Feedback
  module Flash
    def flash_messages
      messages = flash.sort_by{ |k,v| k.to_s }.collect do |level, message|
        content_tag(:p, message, :class => level, :id => "#{level}_message")
      end

      if messages.any?
        content_tag(:div, messages.join, :class => "flash", :id => "messages")
      end
    end
  end
end