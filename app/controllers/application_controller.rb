class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Items
  get "/items" do
    items = Item.all
    items.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  get "/items/by_price" do
    items = Item.all.order(:price)
    items.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  get "/items/by_priority" do
    items = Item.all.order(:priority)
    items.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  get "/items/:id" do
    item = Item.find(params[:id])
    item.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  post "/items" do
    item = Item.create(
      name: params[:name],
      price: params[:price],
      priority: params[:priority],
      category: params[:category],
      balance_id: params[:balance_id]
    )
    item.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  delete "/items/:id" do
    item = Item.find(params[:id])
    item.destroy
    item.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  patch "/items/:id" do
    item = Item.find(params[:id])
    item.update(
      name: params[:name],
      price: params[:price],
      priority: params[:priority],
      category: params[:category],
      balance_id: params[:balance_id]
    )
    item.to_json(only: [:id, :name, :price, :priority, :category], include: :balance)
  end

  # Balances
  get "/balances" do
    balances = Balance.all.order(:amount)
    balances.to_json
  end

  get "/balances/:id" do
    balance = Balance.find(params[:id])
    balance.to_json
  end

  post "/balances" do
    balances = Balance.create(
      name: params[:name],
      amount: params[:amount]
    )
    balances.to_json
  end

  delete "/balances/:id" do
    balance = Balance.find(params[:id])
    balance.destroy
    balance.to_json
  end

  patch "/balances/:id" do
    balance = Balance.find(params[:id])
    balance.update(
      name: params[:name],
      amount: params[:amount]
    )
    balance.to_json
  end

end
