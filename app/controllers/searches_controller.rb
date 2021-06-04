class SearchesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js do
        results = Result.by_query(params_filter[:query]).paginate(page: params[:page], per_page: 10)
        render(partial: 'list', locals: { results: results }, content_type: 'text/plain')
      end
    end
  end

  def create
  end

  private

  def params_filter
    params.require(:search).permit(:query)
  end
end
