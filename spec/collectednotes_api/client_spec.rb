# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CollectednotesApi::Client do
  let(:email) { '123' }
  let(:token) { '321321321' }
  let(:path) { 'sites' }

  before do
    CollectednotesApi.configure do |config|
      config.email  = email
      config.token  = token
    end
  end

  subject { CollectednotesApi::Client.new }

  describe '#parse_response' do
    context 'with nil response' do
      it { expect(subject.send(:parse_response)).to eq(nil) }
    end

    context 'with json string response' do
      before do
        class String
          def code
            200
          end
        end
      end

      it { expect(subject.send(:parse_response, '{"example": "asdf"}')).to eq({"example" => "asdf"}) }
    end

    context 'with 204 code' do
      before do
        class String
          def code
            204
          end
        end
      end

      it { expect(subject.send(:parse_response, '')).to eq({}) }
    end
  end

  context 'request methods' do
    let(:params) do
      {
        example_key: 'example value',
      }
    end

    it { expect(subject).to respond_to(:get) }
    it { expect(subject).to respond_to(:post) }
    it { expect(subject).to respond_to(:put) }
    it { expect(subject).to respond_to(:delete) }

    describe "#get" do
      context 'without params' do
        it 'has to call Rest Client #get with correct parameters' do
          expect_any_instance_of(RestClient::Resource).to receive(:get).with(params: {})

          subject.get(path)
        end
      end

      context 'with params' do
        it 'has to call Rest Client #get with correct parameters' do
          expect_any_instance_of(RestClient::Resource).to receive(:get).with(params: params)

          subject.get(path, params)
        end
      end
    end

    describe "#post" do
      it 'has to call Rest Client #post with correct parameters' do
        expect_any_instance_of(RestClient::Resource).to receive(:post).with(params.to_json)

        subject.post(path, params)
      end
    end

    describe "#put" do
      it 'has to call Rest Client #put with correct parameters' do
        expect_any_instance_of(RestClient::Resource).to receive(:put).with(params.to_json)

        subject.put(path, params)
      end
    end

    describe "#delete" do
      it 'has to call Rest Client #delete with correct parameters' do
        expect_any_instance_of(RestClient::Resource).to receive(:delete)

        subject.delete(path)
      end
    end
  end
end
