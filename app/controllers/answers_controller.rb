class AnswersController < ApplicationController
	def submit
		@query = params[:answer]
		@players = Players.find_by_sql(@query)

		@players.each do |player|
			if player.last_name == "East"
				@correct = true
			end
		end 
	end
end
