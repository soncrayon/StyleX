class OutfitsController < ApplicationController
    before_action :authorize!, only:[:new, :edit, :update, :destroy]

    def index
    @outfits = Outfit.all
end
def show
    @outfit = Outfit.find(params[:id])
end
def new
    @outfit = Outfit.new
end

def create
    @outfit = Outfit.new(params.require(:outfit).permit(:name))
    @outfit.user_id = session[:user_id]
    if @outfit.save
        redirect_to outfit_path(@outfit)
    else
        render new_outfit_path
    end
end

def edit
    @outfit = Outfit.find(params[:id])
    @items = Item.all
end

def update
    @outfit = Outfit.find(params[:id])
    @item = Item.find(params[:outfit][:id])
    @outfit.items << @item
    redirect_to outfit_path(@outfit)
end

def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path
end

end
