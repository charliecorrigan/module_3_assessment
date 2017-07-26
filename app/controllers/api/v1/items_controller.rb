class Api::V1::ItemsController < ApiBaseController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: (params["id"]).to_i)
  end

  def destroy
    Item.find_by(id: (params["id"]).to_i).delete
    render :nothing => true, :status => 204
  end
end
