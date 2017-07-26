class SearchController < ApplicationController
  def index
    @stores = Store.fetch_stores_by_zip(params[:search])
    @total_count = Store.fetch_total_count(params[:search])
  end
end
