class ExpressionBuilder
	
	@lines = []
	@definied_variables = []

	def add_line(line)
		assignment = "ans"
		if line.index("=")
			assignment = line.split("=")[0].chomp
		end
		
		# Verify that if varaibles are used in the line they are correct
		verify_line((line.index("=") || 0), line.length)

		# Add the lines assigne to the list of defined variables
		if assignment == "ans" && !@defined_variables.includes?("ans")
			@definied_variables << assignment
		elsif !@defined_variables(assignment)
			@defined_variables << assignment
		end
		
		# Add the line to the list of lines
		lines << line
	end

	def variable_defined?(var)
		return @defined_variables.include?(var)
	end

	private

	def verify_line(line)
		# Split the line into the possible variables
		components = line.split(/[:digit:+:punct:+]/)
		
		# Make sure that all the variables have been defined
		components.each do |var|
			raise "Variable %{var} not defined yet!"
		end
	end


end
