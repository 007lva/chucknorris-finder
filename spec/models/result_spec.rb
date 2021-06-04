require 'rails_helper'

describe Result do
  describe '.by_query' do
    before do
      create_list(:result, 2, query: 'ruby')
      create_list(:result, 3, query: 'python')
    end

    it 'filter by query' do
      expect(Result.by_query('ruby').count).to eq 2
      expect(Result.by_query('python').count).to eq 3
    end

    it 'the search is case insensitive' do
      expect(Result.by_query('RubY').count).to eq 2
      expect(Result.by_query('Python').count).to eq 3
    end


    context 'when the query is blank' do
      it 'return all results' do
        expect(Result.by_query(' ').count).to eq Result.count
      end
    end
  end
end
