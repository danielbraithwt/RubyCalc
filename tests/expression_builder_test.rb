APP_ROOT = File.dirname("../")
$:.unshift( File.join(APP_ROOT, 'lib') )

require 'expression_builder'
require 'minitest/autorun'

class TestExpressionBuilder < MiniTest::Unit::TestCase
	
	def test_expression_builder_variables
		puts "\n[*] Testing Expression Builder Variables"

		# Create the expression builder
		eb = ExpressionBuilder.new

		# The expression builder shouldent contain "ans" as variable
		assert eb.variable_defined?("ans") == false, "[E] The expression builder shoudlent have 'ans' as a variable\nas we havent added anything yet"

		# Add 1 + 1 to the expression builder
		eb.add_line("1 + 1")

		# Now the expression builder should contain "ans" as variable
		assert eb.variable_defined?("ans") == true, "[E] The expression builder should contain 'ans' as a variable"

		# Add x = 1
		eb.add_line("x = 1")

		# The expression builder should now contain "x" as a variable
		assert eb.variable_defined?("x") == true, "[E] The expression builder should contain 'x' as a variable"
	end

	def test_expression_builder_compile
		puts "[*] Testing Expression Builder Compile"
		
		# Create the expression builder
		eb = ExpressionBuilder.new

		# Add the line "1+1"
		eb.add_line("1+1")

		# Test to see if expression is correct
		assert eb.compile_expression == "1+1;", "[E] The compiled expression should be '1+1;' as we just added that line"

		# Add another line and see if it is in order
		eb.add_line("x = 0")

		# Test to see if the expression is correct
		assert eb.compile_expression == "1+1;x = 0;", "[E] The compiled expression should be '1+1;x = 0;' as thoughs are the two lines we inserted"

	end

	def test_expression_builder_evaluate
		puts "\n[*] Testing Expression Builder Evaluate"

		# Create the expression builder
		eb = ExpressionBuilder.new
		eb.add_line("1 + 1")
		eb.add_line("x = 2")
		eb.add_line("ans + x")

		# The lines should evaluate to 4
		assert eb.evaluate == 4, "[E] 1 + 1 + 2 should evaluate to 4"

		# Add a new line to the expression builder
		eb.add_line("2 + 3")

		# The newly added line should overide the last answer and return 5
		assert eb.evaluate == 5, "[E] New line should over write the last answer"
	end
end
