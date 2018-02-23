require "query_string_builder/version"

class QueryStringBuilder
  attr_reader :query

  def initialize(query = {})
    @query = query
  end

  def build
    query.map { |key, value|
      if value.is_a?(Array)
        build_array_query(key, value)
      elsif value.is_a?(Hash)
        build_hash_query(key, value)
      else
        "#{key}=#{value}"
      end
    }.join('&')
  end

  private

  def build_array_query(key, values)
    query_key = "#{key}[]"
    values.map { |v| [query_key, v].join('=') }.join('&')
  end

  def build_hash_query(key, values)
    values.map { |h_key, h_value|
      query_key = "#{key}[#{h_key}]"
      if h_value.is_a?(Hash)
        build_hash_query(query_key, h_value)
      elsif h_value.is_a?(Array)
        build_array_query(query_key, h_value)
      else
        [query_key, h_value].join('=')
      end
    }.join('&')
  end
end
