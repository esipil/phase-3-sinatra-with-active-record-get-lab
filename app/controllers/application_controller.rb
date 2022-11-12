class ApplicationController < Sinatra::Base


  set :default_content_type, 'application/json'

  get 'html' do  
    send_file 'text.html'
  end

  get '/bakeries' do 
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id]) 
    bakeries.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
    bakered_goods = BakedGood.all.order(price: :DESC)
    bakered_goods.to_json
  end 
  get '/baked_goods/most_expensive' do 
    baked_goods = BakedGood.all.order(price: :DESC).first
    baked_goods.to_json
  end
end
