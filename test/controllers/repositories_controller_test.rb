require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    mock = Minitest::Mock.new
    mock.expect :body, {
      items: ['some item'],
      total_count: 1
    }.to_json

    mock.expect :is_a?, true, [Net::HTTPSuccess]

    Net::HTTP.stub :get_response, mock do
      get repositories_index_url(params: { repositories: { q: 'search key' }})
    end

    assert_response :success
  end

  test "should get failure when nothing found" do
    mock = Minitest::Mock.new
    mock.expect :body, {
      items: [],
      total_count: 1
    }.to_json

    mock.expect :is_a?, true, [Net::HTTPSuccess]

    Net::HTTP.stub :get_response, mock do
      get repositories_index_url(params: { repositories: { q: 'search key' }})
    end

    assert_response 404
  end
end
