class SearchesController < ApplicationController
  def index
    respond_to do |format|
      format.html {}
      format.js do
        render(partial: 'lista', locals: { results: Result.all }, content_type: 'text/plain')
      end
    end
  end

  def create
  end
end
