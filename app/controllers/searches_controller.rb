class SearchesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js do
        results = Result.paginate(page: params[:page], per_page: 10)
        render(partial: 'list', locals: { results: results }, content_type: 'text/plain')
      end
    end
  end

  def create
  end
end
