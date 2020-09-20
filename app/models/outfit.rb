class Outfit < ApplicationRecord
  belongs_to :user, required: false 
  has_many :outfit_items, dependent: :destroy
  has_many :items, through: :outfit_items
  validates :name, presence: true

  def self.most_items
    #outfit with the most items
    max_num = self.all.map{|o| o.items.count}.max
    self.all.find{|o| o.items.count == max_num}.name 
  end

end
