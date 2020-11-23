class Api::ItemsController < ApplicationController

  def index
    @items = Item.all
    raise ActiveRecord::RecordNotFound if @items.blank?
    render json: @items
  end
end
