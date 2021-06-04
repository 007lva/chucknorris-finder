class GetNewResults
  def call(query)
    json_results = BringResultsFromApi.new.call(query)['result']

    return Result.none if json_results.empty?

    new_results = json_results.map do |json_result|
      # TODO: move to a serializer
      { query: query, icon_url: json_result['icon_url'], api_id: json_result['id'], url: json_result['url'],
        value: json_result['value'], created_at: Time.current, updated_at: Time.current }
    end

    Result.insert_all(new_results)
    Result.by_query(query)
  end
end
