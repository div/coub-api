require 'helper'

module Coub
  describe Client do
    Configuration::VALID_FORMATS.each do |format|
      describe ".new(:format => '#{format}')" do
        before do
          @client = Client.new(format: format)
        end

        describe '#oembed' do
          let(:id) { '1mo9evr6' }
          let(:url) { "http://coub.com/view/#{id}" }

          before do
            @stubbed_get = stub_get("oembed.#{format}?url=#{url}").
            to_return(body: fixture("oembed.#{format}"), headers: {content_type: "application/#{format}; charset=utf-8"})
          end

          it "should get the correct resource" do
            @client.oembed(id)
            assert_requested @stubbed_get
          end

          it "should return extended information of a given item" do
            response = @client.oembed(id)
            response.title.must_equal "Beautiful girl"
          end

        end

        describe '#search' do
          let(:q) { 'zhopa' }
          before do
            @get = stub_get("search.#{format}").
              with(query: {q: q}).
              to_return(:body => fixture("search.#{format}"), headers: {content_type: "application/#{format}; charset=utf-8"})
          end

          it "should get the correct resource" do
            @client.search(q: q)
            assert_requested @get
          end

          describe Response do
            let(:search_response){ @client.search(q: q) }

            subject { search_response }

            it { subject.must_be_kind_of Response }
            it { subject.must_respond_to(:pagination) }
            it { subject.must_respond_to(:meta) }

            describe '.pagination' do
              subject { search_response.pagination }

              it { subject.must_be_instance_of Hashie::Mash }
              it { subject.page.must_equal 1 }
              it { subject.total_pages.must_equal 1 }
              it { subject.per_page.must_equal 10 }
            end

            describe '.coubs' do
              subject { search_response.coubs }

              it { subject.must_be_instance_of Array }
              it { subject.count.must_equal 1 }
            end

            describe '.users' do
              subject { search_response.users }

              it { subject.must_be_instance_of Array }
              it { subject.count.must_equal 0 }
            end

            describe '.page' do
              subject { search_response.page }

              it { subject.must_be_instance_of String }
              it { subject.must_equal '1' }
            end

            describe '.total_pages' do
              subject { search_response.total_pages }

              it { subject.must_be_instance_of Fixnum }
              it { subject.must_equal 1 }
            end

            describe '.per_page' do
              subject { search_response.per_page }

              it { subject.must_be_instance_of Fixnum }
              it { subject.must_equal 10 }
            end
          end
        end
      end
    end
  end
end
