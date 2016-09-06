class BillsController < ApplicationController
  def show
    @bill = Bill.find(params[:bill_id])
    @user_id = params[:id]
    p @user_id
  end

  def update
    if params[:bill][:items]
      params[:bill][:items].each do |item_id, user_id_hash|
        item = Item.find(item_id)
        p user_id_hash[:user_id]
        item.user_id = user_id_hash[:user_id][:value]
        item.save
      end
    end
  end

  def create
    bill = Bill.find_or_initialize_by(bill_params)
    success = bill.save
    render json: { success: success, bill: bill }
  end

  def bill_params
    params.require(:bill).permit(:items, :initiator_id)
  end

  def item_params
    params.permit(:user_id)
  end
end