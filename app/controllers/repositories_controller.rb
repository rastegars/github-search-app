class RepositoriesController < ApplicationController
  def index
    search_service = SearchService.new(search_params)
    @results = search_service.call
    puts results
  end

  private

  def search_params
    params.require(:repositories).permit(:q)
  end
end
