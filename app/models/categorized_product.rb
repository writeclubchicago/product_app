class CategorizedProduct < ActiveRecord::Base
		belongs_to :products #always PLURAL
		belongs_to :categories #always PLURAL
		
end
