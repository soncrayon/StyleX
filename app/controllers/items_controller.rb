class ItemsController < ApplicationController
    helper_method :uniq_users
    
    def index
        @items = Item.all 
    end

    def show
        @item = Item.find(params[:id])
    end

    def uniq_users
        array = [] 
        @item = Item.find(params[:id])
        @item.outfits.each do |o|
          array << o.user.to_s
        end
        array = array.uniq
      end

end
