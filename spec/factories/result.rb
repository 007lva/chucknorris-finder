FactoryBot.define do
  factory :result, class: 'Result' do
    query { 'seed' }
    icon_url { 'https://assets.chucknorris.host/img/avatar/chuck-norris.png' }
    api_id { 'N5AdYR2lTWiwf_Bz7oGGZA' }
    url { 'https://api.chucknorris.io/jokes/N5AdYR2lTWiwf_Bz7oGGZA' }
    value { 'Chuck Norris has sesame flavored seed.' }
  end
end
