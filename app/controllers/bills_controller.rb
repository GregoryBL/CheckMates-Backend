class BillsController < ApplicationController
  def show
    @bill = Bill.find(params[:id])
    render json: @bill.as_json(include: :items)
  end

  def edit
    @bill = Bill.find(params[:bill_id])
    @user_id = params[:id]
  end

  def update
    user_id = params[:user_id]
    bill = Bill.find(params[:bill][:id])
    received_items = params[:bill][:items]
    puts "Received:"

    bill.items.each do |item|
      if received_items && received_items[item.id.to_s] != nil
        item.user_id = user_id if !item.user_id # user added self to item
      else
        item.user_id = nil if item.user_id == user_id # user removed self from that item
      end
      item.save
    end
  end

  def create
    items = []
    itemsArray = params[:bill]
    itemsArray.each do |item|
      itemsArray << Item.create(item)
    end
    bill = Bill.new()
    bill.items = itemsArray
    success = bill.save
    render json: { success: success, bill: bill }
  end

  def bill_params
    params.require(:bill).permit(:items, :initiator_id)
  end
end
