class Style < ApplicationRecord
    has_many :items

    @@all = Style.all 

    def self.total_items
        @@all.count 
    end

    def self.most_items
        max_num = @@all.map{|s| s.items.count}.max
        @@all.find{|s|s.items.count == max_num}.name 
    end

    def self.fewest_items
        min_num = @@all.map{|s| s.items.count}.min 
        @@all.find{|s| s.items.count == min_num}.name 
    end

    def total_items
        self.items.count 
    end
end
