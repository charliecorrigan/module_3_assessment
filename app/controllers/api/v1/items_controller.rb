class Api::V1::ItemsController < ApiBaseController
  def index
    @items = Item.all
  end

end
