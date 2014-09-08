class Node
	@info
	@left
	@right
	@operator

	def initialize(expression)
		expression = expression.to_s
		expression = expression.strip
		puts "Node: #{expression}"
		@operator = true


		if expression.index('-')
			@info = "-"
			split_expression(expression)

		elsif expression.index('+')
			@info = "+"
			split_expression(expression)

		elsif expression.index('*')
			@info = "*"
			split_expression(expression)

		elsif expression.index('/')
			@info = "/"
			split_expression(expression)

		else
			@info = expression
			@operator = false

		end
	end

	def evaluate
		# If its not a operator then return its value
		return @info.to_f unless @operator
		
		# Peform nodes operator on the result of evaluate on the left
		# and right nodes
		return @left.evaluate / @right.evaluate if @info == "/"
		return @left.evaluate * @right.evaluate if @info == "*"
		return @left.evaluate + @right.evaluate if @info == "+"
		return @left.evaluate - @right.evaluate if @info == "-"

	end

	private

	def split_expression(expression)
		# Splits the expression at the correct operator and then
		# create the two new nodes

		@left = Node.new(expression[0, expression.index(@info)-1])
		@right = Node.new(expression[expression.index(@info)+1, expression.length])
	end

	


end
