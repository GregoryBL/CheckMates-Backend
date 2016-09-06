class BillsController < ApplicationController
  def show
    @bill = Bill.find(params[:bill_id])
    @user_id = params[:user_id]
  end

  def update
    "update"
  end

  def create
    bill = Bill.find_or_initialize_by(bill_params)
    success = bill.save
    render json: { success: success, bill: bill }
  end

  def bill_params
    params.require(:bill).permit(:items, :initiator_id)
  end
end