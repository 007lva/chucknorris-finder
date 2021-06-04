require 'rails_helper'

describe GetNewResults do
  describe '#call' do
    let(:results_with_seed) do
      {
        'total' => 4,
        'result' => [
          {
            'categories' => [],
            'created_at' => '2020-01-05 13:42:21.795084',
            'icon_url' => 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
            'id' => 'N5AdYR2lTWiwf_Bz7oGGZA',
            'updated_at' => '2020-01-05 13:42:21.795084',
            'url' => 'https://api.chucknorris.io/jokes/N5AdYR2lTWiwf_Bz7oGGZA',
            'value' => 'Chuck Norris has sesame flavored seed.'
          },
          {
            'categories' => [],
            'created_at' => '2020-01-05 13:42:21.795084',
            'icon_url' => 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
            'id' => 'm0crgm8LR8WIAdeXslUABw',
            'updated_at' => '2020-01-05 13:42:21.795084',
            'url' => 'https://api.chucknorris.io/jokes/m0crgm8LR8WIAdeXslUABw',
            'value' => 'When playing Minecraft, make a new world with the name and seed both being \"Chuck Norris\". Even on peaceful, you will be surrounded by 1,000,000 endermen when at the spawn.'
          },
          {
            'categories' => [],
            'created_at' => '2020-01-05 13:42:26.447675',
            'icon_url' => 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
            'id' => 'JcVKFFvzTDevZp4YM2uGLA',
            'updated_at' => '2020-01-05 13:42:26.447675',
            'url' => 'https://api.chucknorris.io/jokes/JcVKFFvzTDevZp4YM2uGLA',
            'value' => 'King Solomon suggested cutting the baby in half. Chuck Norris ACTUALLY cut the baby in half, ate it, and proceeded to impregnate both women while bellowing \" The essence of this baby will live on through the gift of my mighty seed!\"'
          },
          {
            'categories' => [],
            'created_at' => '2020-01-05 13:42:29.569033',
            'icon_url' => 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
            'id' => 'RC23JDP3QiOtdxOempfedg',
            'updated_at' => '2020-01-05 13:42:29.569033',
            'url' => 'https://api.chucknorris.io/jokes/RC23JDP3QiOtdxOempfedg',
            'value' => 'The active ingredient in Viagra, Cialis and Levitra comes from the seed of Chuck Norris.'
          }
        ]
      }
    end

    it 'save 4 results from API into the table results' do
      allow_any_instance_of(BringResultsFromApi).to receive(:call).and_return(results_with_seed)
      expect { subject.call('seed') }.to change { Result.count }.by(4)
    end

    it 'returns the new records' do
      allow_any_instance_of(BringResultsFromApi).to receive(:call).and_return(results_with_seed)
      ids_from_api = %w[N5AdYR2lTWiwf_Bz7oGGZA m0crgm8LR8WIAdeXslUABw JcVKFFvzTDevZp4YM2uGLA RC23JDP3QiOtdxOempfedg]
      expect(subject.call('seed').pluck(:api_id)).to match_array ids_from_api
    end

    context 'when the API gives no results' do
      before do
        no_results = { 'total' => 0, 'result' => [] }
        allow_any_instance_of(BringResultsFromApi).to receive(:call).and_return(no_results)
      end

      it 'does not create new records' do
        expect { subject.call('seed') }.to change { Result.count }.by(0)
      end

      it 'retunrs a empty relation' do
        expect(subject.call('seed')).to eq Result.none
      end
    end
  end
end
