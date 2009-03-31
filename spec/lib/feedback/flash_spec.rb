require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Feedback::Flash, :type => :controller do
  before(:each) do
    @helper = Class.new do
      include ActionView::Helpers::TagHelper
      include Feedback::Flash
    end.new
  end

  it "should provide a flash_messages method to get the flash messages" do
    @helper.should respond_to(:flash_messages)
  end
  
  describe "when no flash messages have been set" do
    before(:each) do
      @helper.stubs(:flash).returns({})
    end

    it "should return nothing" do
      @helper.flash_messages.should be_nil
    end
  end
  
  describe "when one flash message has been set" do
    before(:each) do
      @helper.stubs(:flash).returns(:confirmation => "Your change has been saved")
    end

    it "should return the message in a paragraph tagged with the correct class and id" do
      @helper.flash_messages.should have_tag("div\#messages.flash") do
        with_tag("p#confirmation_message.confirmation", /Your change has been saved/)
      end
    end
  end
  
  describe "when several flash messages has been set" do
    before(:each) do
      @helper.stubs(:flash).returns({
        :confirmation => "Your change has been saved",
        :info => "You now have 7 ponies"
      })
    end

    it "should return the messages in paragraphs tagged with the correct class and id" do
      @helper.flash_messages.should have_tag("div\#messages.flash") do
        with_tag("p#confirmation_message.confirmation", /Your change has been saved/)
        with_tag("p#info_message.info", /You now have 7 ponies/)
      end
    end

    it "should order the messages by type" do
      @helper.flash_messages.should have_tag("div\#messages.flash > p#confirmation_message.confirmation + p#info_message.info")
    end
  end

  after(:each) do
    @helper = nil
  end
end