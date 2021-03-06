require 'spec_helper'

describe ShotApiGem do
  it 'has a version number' do
    expect(ShotApiGem::VERSION).not_to be nil
  end

  #tests require internet connection
  describe ShotApiGem::Consumer do
    let(:token) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.6Zw1v9APD2mmr2eXeOi3oiI7SoC-WJg4A2WnoFDZL9k' }
    let(:consumer) { ShotApiGem::Consumer.new(token) }
    let(:cons) { consumer.create({url: Faker::Internet.url, slug: Faker::Internet.slug }) }

    describe 'instance methods' do

      describe '#fetch_all' do
        let(:response) { consumer.fetch_all }

        it 'returns an array of links' do
          expect(response).to be_an_instance_of Array
          expect(response.first).to be_an_instance_of ShotApiGem::Link
        end
      end

      describe '#fetch' do
        let(:response) { consumer.fetch(cons.id) }

        it 'should return a link' do
          expect(response).to be_an_instance_of ShotApiGem::Link
        end
      end

      describe '#create' do
        let!(:data) { { url: Faker::Internet.url, slug: Faker::Internet.slug } }
        let(:response) { consumer.create(data) }

        it 'creates a link and returns the same link' do
          expect(response.url).to eq data[:url]
          expect(response.slug).to eq data[:slug]
        end
      end

      describe '#update' do
        let(:data) { { url: Faker::Internet.url, slug: Faker::Internet.slug } }
        let(:response) { consumer.update(cons.id, data) }

        it 'updates the link and returns the updated link' do
          expect(response.url).to eq data[:url]
          expect(response.slug).to eq data[:slug]
        end
      end

      describe '#delete' do
        let(:response) { consumer.delete(cons.id) }
        it 'deletes and returns no content' do
          expect(response).to eq 204
        end
      end
    end
  end

  describe ShotApiGem::Link do
    let(:params) { {} }

    subject { ShotApiGem::Link.new(params) }

    describe 'instance methods' do
      it { is_expected.to respond_to :id }
      it { is_expected.to respond_to :url }
      it { is_expected.to respond_to :slug }
      it { is_expected.to respond_to :active }
      it { is_expected.to respond_to :clicks }
      it { is_expected.to respond_to :title }
      it { is_expected.to respond_to :date_created }
      it { is_expected.to respond_to :date_updated }
    end
  end
end
