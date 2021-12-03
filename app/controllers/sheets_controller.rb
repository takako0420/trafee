class SheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :show, :destroy]

  def index
    @sheets = current_user.sheets.order(created_at: :desc)
  end

  def new
    @sheet = Sheet.new
    @sheet.items.build
  end

  def create
    if Sheet.create(sheet_params)
      redirect_to action: :index
      flash[:info] = 'スキルマップを登録しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sheet.update(update_sheet_params)
      redirect_to action: :index
      flash[:info] = 'スキルマップを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @sheet.destroy
      redirect_to sheets_path(current_user.id)
      flash[:info] = 'スキルマップを削除しました。'
    else
      render :index
    end
  end

  def show
  end

  private

  def set_item
    @sheet = current_user.sheets.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if @sheet.user_id != current_user.id
  end

  def sheet_params
    params.require(:sheet).permit(:title,
                                  items_attributes: [
                                    :sheet_id,
                                    :text
                                  ]).merge(user_id: current_user.id)
  end

  def update_sheet_params
    params.require(:sheet).permit(:title,
                                  items_attributes: [
                                    :id,
                                    :sheet_id,
                                    :text,
                                    :_destroy
                                  ]).merge(user_id: current_user.id)
  end
end
