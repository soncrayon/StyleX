class User < ApplicationRecord
    has_many :outfits, dependent: :destroy
    has_many :outfit_items, through: :outfits
    has_secure_password
    
    def to_s
        self.first_name + ' ' + self.last_name 
    end

    def formalize
        "Mr. #{self.to_s}"
    end

    def self.most_outfits
        max_num = self.all.map{|u| u.outfits.count}.max
        self.all.find{|u| u.outfits.count == max_num}.formalize
    end

end
