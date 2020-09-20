class Category < ApplicationRecord
    has_many :items 

    @@all = Category.all 

    def self.total_items
        @@all.count 
    end

    def self.most_items
        max_num = @@all.map{|c| c.items.count}.max
        @@all.find{|c|c.items.count == max_num}.name 
    end

    def self.fewest_items
        min_num = @@all.map{|c| c.items.count}.min 
        @@all.find{|c| c.items.count == min_num}.name 
    end

    def total_items
        self.items.count 
    end

end
