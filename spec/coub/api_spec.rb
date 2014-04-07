require 'helper'

module Coub
  describe Api do
    before do
      @keys = Configuration::VALID_OPTIONS_KEYS
    end

    describe "with module configuration" do

      before do
        Coub.configure do |config|
          @keys.each do |key|
            config.send("#{key}=", key)
          end
        end
      end

      after do
        Coub.reset
      end

      it "should inherit module configuration" do
        api = Api.new
        @keys.each do |key|
          api.send(key).must_equal key
        end
      end

    end

    describe "with class configuration" do

      before do
        @configuration = {
          :client_id => 'CID',
          :client_secret => 'CS',
          :token => 'AT',
          :adapter => :typhoeus,
          :endpoint => 'http://tumblr.com/',
          :format => :xml,
          :user_agent => 'Custom User Agent',
          :cache_prefix => 'prefix'
        }
      end

      describe "during initialization" do

        it "should override module configuration" do
          api = Api.new(@configuration)
          @keys.each do |key|
            api.send(key).must_equal @configuration[key]
          end
        end

      end


      describe "after initilization" do

        it "should override module configuration after initialization" do
          api = Api.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).must_equal @configuration[key]
          end
        end
      end

    end


  end

end
