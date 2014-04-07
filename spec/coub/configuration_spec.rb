require 'helper'

module Coub
  describe Configuration do
    let(:api) { Api.new }
    Configuration::VALID_OPTIONS_KEYS.each do |key|
      describe ".#{key}" do
        it 'should return the default value' do
          api.send(key).must_equal Configuration.const_get("DEFAULT_#{key.upcase}")
        end
      end
    end
  end
end
