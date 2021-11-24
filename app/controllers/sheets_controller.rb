class SheetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :move_to_index, only: [:new, :create]

  def index
  end

  def new
    @sheet_item = SheetItem.new
  end

  def create
    @sheet_item = SheetItem.new(sheet_params)
    if @sheet_item.valid?
      @sheet_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sheet_params
    params.require(:sheet_item).permit(:title, :text).merge(user_id: current_user.id)
  end
end
