class Api::V1::ItemsController < ApiBaseController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: (params["id"]).to_i)
  end

  def destroy
    Item.find(params["id"]).delete
    render :nothing => true, :status => 204
  end

  def create
    @item = Item.create(item_params)
    render :status => 201
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
