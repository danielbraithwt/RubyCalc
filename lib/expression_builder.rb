class ExpressionBuilder
	
	@lines = []
	@definied_variables = []

	def add_line(line)
		assignment = "ans"
		if line.index("=")
			assignment = line.split("=")[0].chomp
		end

		if assignment == "ans" && @defined_variables.includes?("ans")
			@definied_variables << assignment
		elsif

	end
end
