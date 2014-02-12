class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /people
  def index
    render json: Item.all
  end

  # GET /people/1
  def show
    render json: @item
  end

  # POST /people
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: [:api, :v1, @item]
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @item.update(item_params)
      render json: @item, status: :ok, location: [:api, :v1, @item]
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @item.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :description)
  end

end
