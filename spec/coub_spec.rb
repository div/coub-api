require 'helper'

describe Coub do
  after do
    Coub.reset
  end

  describe "when delegating to a client" do

     before do
       @get = stub_get("search.json").
         to_return(:body => fixture("search.json"), :headers => {:content_type => "application/json; charset=utf-8"})
     end

     it "should get the correct resource" do
       Coub.search
       assert_requested @get
     end

     it "should return the same results as a client" do
       Coub.search.must_equal Coub::Client.new.search
     end

  end

  describe ".client" do
    it "should be a Coub::Client" do
      Coub.client.must_be_instance_of Coub::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      Coub.adapter.must_equal Coub::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Coub.adapter = :typhoeus
      Coub.adapter.must_equal :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      Coub.endpoint.must_equal Coub::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Coub.endpoint = 'http://tumblr.com'
      Coub.endpoint.must_equal 'http://tumblr.com'
    end
  end

  describe ".format" do
    it "should return the default format" do
      Coub.format.must_equal Coub::Configuration::DEFAULT_FORMAT
    end
  end

  describe ".format=" do
    it "should set the format" do
      Coub.format = 'xml'
      Coub.format.must_equal 'xml'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      Coub.user_agent.must_equal Coub::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Coub.user_agent = 'Custom User Agent'
      Coub.user_agent.must_equal 'Custom User Agent'
    end
  end

  describe ".verson" do
    it 'should have a version' do
      Coub::VERSION.wont_be_nil
    end
  end

  describe ".configure" do

    Coub::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        Coub.configure do |config|
          config.send("#{key}=", key)
          Coub.send(key).must_equal key
        end
      end
    end
  end
end
