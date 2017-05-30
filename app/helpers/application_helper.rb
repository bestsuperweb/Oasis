module ApplicationHelper
	def final_diagnosis argument
		if argument.nil?
			return '...'
		else
			return argument
		end
	end
end
