require 'node'
require 'byebug'

class Calculator

	def self.evaluate(expression)
		expression = parse_brackets(expression) if expression.include?("(")
		expression = parse_exponents(expression) if expression.include?("^")

		head = Node.new(expression)
		return head.evaluate
	end

	private 

	# Function takes an expression and evaluates the brackets in the 
	# expression
	def self.parse_brackets(expression)
		open = 1
		start = expression.index("(")

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

		end

		if start && open == 0
			parsed = parse_brackets(expression[start+1, index-1].strip)
			beginning = expression[0,start-1] || ""
			ending =  expression[index+1,expression.length] || ""

			return beginning + parsed.to_s + ending

		else
			puts "Evaluating: #{expression}"
			head = Node.new(expression.strip)
			return head.evaluate
		end
	end

	# Function takes an expression and evaulates the powers
	# in the expression
	def self.parse_exponents(expression)
		pow = expression.index("^")

		while pow do
			expstart = expression.rindex(" ", pow) || 0
			expend = expression.index(" ", pow) || expression.length
			
			puts "Start: #{expression[expstart,pow]}"
			puts "End: #{expression[pow+1,expend]}"

			poweval = expression[expstart, pow].strip.to_i ** expression[pow+1,expend].strip.to_i
			puts "Eval: #{poweval}"
			expression = expression[0,expstart] + poweval.to_s + expression[expend,expression.length]

			pow = expression.index("^")
		end
		
		return expression
	end

end
