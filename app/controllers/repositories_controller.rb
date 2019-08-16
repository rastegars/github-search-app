class RepositoriesController < ApplicationController
  def index
    search_service = SearchService.new(search_params)
    result = search_service.call
    @repos = result['items']
    @total_count = result['total_count']
    render_failure unless @repos.any?
  end

  private

  def search_params
    params.require(:repositories).permit(:q)
  end

  def render_failure
    render :index, status: 404
    flash.now.alert = t('.failure')
  end
end
