# frozen_string_literal: true

# this is an internal class, used by RepositoriesController so that
# we don't pollute the controller with a lot of methods.
#
class SearchService
  def initialize(params)
    @q = params[:q]
  end

  def call
    uri = URI('https://api.github.com/search/repositories')
    params = { q: q }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    res.body if res.is_a?(Net::HTTPSuccess)
  end

  private

  attr_accessor :q
end
