class Item < ApplicationRecord
  belongs_to :category, required: false 
  belongs_to :style, required: false 
  has_many :outfit_items
  has_many :outfits, through: :outfit_items 
  
  def self.most_popular
    #most popular item for users 
    user_outfits = User.all.map{|u| u.outfits}.flatten
    user_items = user_outfits.map{|o| o.items}.flatten
    user_items.max_by{|i| user_items.count(i)}.name 
  end

  def self.least_popular
    #least popular item for users
    user_outfits = User.all.map{|u| u.outfits}.flatten
    user_items = user_outfits.map{|o| o.items}.flatten
    user_items.min_by{|i| user_items.count(i)}.name 
  end

  def self.most_sought_after_brand
    user_outfits = User.all.map{|u| u.outfits}.flatten
    user_items = user_outfits.map{|o| o.items}.flatten
    user_brands = user_items.map{|i| i.brand}.flatten
    user_brands.max_by{|b| user_brands.count(b)}
  end

end
