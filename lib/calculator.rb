require 'node'

class Calculator

	def self.evaluate(expression)
		expression = parse_brackets(expression) if expression.include?("(")

		head = Node.new(expression)
		return head.evaluate
	end

	private 

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

end
