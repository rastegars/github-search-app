class RepositoriesController < ApplicationController
  def index
    search_service = SearchService.new(search_params)
    result = search_service.call
    @repos = result['items']
    @total_count = result['total_count']
  end

  private

  def search_params
    params.require(:repositories).permit(:q)
  end
end
