require 'node'
require 'utils'
require 'byebug'

class Calculator
	include Utils

	def self.evaluate(expressions)

		assignments = {}
		expressions = expressions.downcase
		
		expressions.split(";").each do |expression|

			# Figure out what variable to assign the variable to
			assignment = "ans"
			if expression.index("=")
				assignment = expression[0,expression.index("=")].strip
				expression = expression[expression.index("=")+1, expression.length].strip
			end

			# Replace variable names with there numbers
			assignments.each do |variable, value|
				expression = expression.gsub(variable, value.to_s)
			end
			
			# Parse various parts of the expression
			expression = parse_functions(expression)
			expression = parse_brackets(expression) if expression.include?("(")
			expression = parse_exponents(expression) if expression.include?("^")

			head = Node.new(expression)
			assignments[assignment] = head.evaluate
			#return head.evaluate
		end

		return assignments["ans"]
	end

	private 

	# Function takes an expression and evaluates the brackets in the 
	# expression
	def self.parse_brackets(expression)
		open = 1
		start = expression.index("(")

		if !start
			head = Node.new(expression.strip)
			return head.evaluate
		end

		index = start
		while index && open != 0 do 

			if expression.index("(", index+1) && (expression.index("(", index+1) < expression.index(")", index+1))
				index = expression.index("(", index+1)
			elsif expression.index(")", index+1)
				index = expression.index(")", index+1)
			else
				raise "Invalid Expression: Check the brackets"	
			end

			if expression[index] == "("
				open = open + 1
			elsif expression[index] == ")" 
				open = open - 1
			end

			if start && open == 0
				parsed = parse_brackets(expression[start+1, index-1].strip)
				beginning = expression[0,start-1] || ""
				ending =  expression[index+1,expression.length] || ""

				expression =  beginning + parsed.to_s + ending

				start = expression.index("(")
				open = open + 1 if start
			end

		end

		return expression
	end

	# Function takes an expression and evaulates the powers
	# in the expression
	def self.parse_exponents(expression)
		pow = expression.index("^")

		while pow do
			expstart = expression.rindex(" ", pow) || 0
			expend = expression.index(" ", pow) || expression.length
			
			# Check to make sure its valid
			raise "Invalid Expression: Check your powers!" if !Utils::is_a_number?(expression[expstart,pow]) || !Utils::is_a_number?(expression[pow+1,expend])

			poweval = expression[expstart, pow].strip.to_i ** expression[pow+1,expend].strip.to_i
			expression = expression[0,expstart] + poweval.to_s + expression[expend,expression.length]

			pow = expression.index("^")
		end
		
		return expression
	end

	def self.parse_functions(expression)
		
		# Replace natural log functions
		while expression.index("ln(") do
			start = expression.index("ln(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.log(expression[start+3, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace log functions
		while expression.index("log(") do
			start = expression.index("log(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.log(expression[start+4, finish].to_f, 10)).to_s + expression[finish+1, expression.length]
		end

		# Replace arcsinh functions
		while expression.index("arcsinh(") do
			start = expression.index("arcsinh(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.asinh(expression[start+8, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace sinh functions
		while expression.index("sinh(") do
			start = expression.index("sinh(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.sinh(expression[start+5, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace arcsin functions
		while expression.index("arcsin(") do
			start = expression.index("arcsin(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.asin(expression[start+7, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace sin functions
		while expression.index("sin(") do
			start = expression.index("sin(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.sin(expression[start+4, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace cosh functions
		while expression.index("cosh(") do
			start = expression.index("cosh(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.cosh(expression[start+5, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace arccos functions
		while expression.index("arccos(") do
			start = expression.index("arccos(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.acos(expression[start+7, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace cos functions
		while expression.index("cos(") do
			start = expression.index("cos(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.cos(expression[start+4, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace arctanh functions
		while expression.index("arctanh(") do
			start = expression.index("arctanh(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.atanh(expression[start+8, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace tanh functions
		while expression.index("tanh(") do
			start = expression.index("tanh(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.tanh(expression[start+5, finish].to_f)).to_s + expression[finish+1, expression.length]
		end	
		
		# Replace arctan functions
		while expression.index("arctan(") do
			start = expression.index("arctan(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.atan(expression[start+7, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		# Replace tan functions
		while expression.index("tan(") do
			start = expression.index("tan(")
			finish = expression.index(")", start)

			expression = expression[0, start] + (Math.tan(expression[start+4, finish].to_f)).to_s + expression[finish+1, expression.length]
		end

		return expression
	end

end
