class SearchController < ApplicationController
  def index
    @stores = Store.fetch_stores_by_zip(params[:search]).paginate(:page => params[:page], :per_page => 10)
    @total_count = Store.fetch_total_count(params[:search])
  end
end
