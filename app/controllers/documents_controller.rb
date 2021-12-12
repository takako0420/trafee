class DocumentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @document = Document.new
    @sheets = current_user.sheets.all
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_path
      flash[:info] = 'スキルマップを登録しました。'
    else
      render :new
    end
  end

  private
  def select_sheet
  end

  def document_params
    params.require(:document).permit(:sheet_id, :chose_one, :chose_two, :chose_three, :chose_four).merge(user_id: current_user.id)
  end
end
