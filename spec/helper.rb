require 'coub'
require "minitest/autorun"
require "minitest/spec"
require 'webmock/minitest'

def a_delete(path)
  a_request(:delete, Coub.endpoint + path)
end

def a_get(path)
  a_request(:get, Coub.endpoint + path)
end

def a_post(path)
  a_request(:post, Coub.endpoint + path)
end

def a_put(path)
  a_request(:put, Coub.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, Coub.endpoint + path)
end

def stub_get(path)
  stub_request(:get, Coub.endpoint + path)
end

def stub_post(path)
  stub_request(:post, Coub.endpoint + path)
end

def stub_put(path)
  stub_request(:put, Coub.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
