#APP_ROOT = File.dirname(__FILE__)
APP_ROOT = File.dirname("../")
puts APP_ROOT
$:.unshift( File.join(APP_ROOT, 'lib') )

require "calculator"
require "minitest/autorun"

class TestCalculator < MiniTest::Unit::TestCase
	
	def test_single_operator_expressions()
		puts "\n[*] Testing Single Operator Expressions"

		# 1 + 1 should equal 2
		assert Calculator.evaluate("1 + 1") ==  2, "\t[E] 1 + 1 should equal 2"

		# 2 - 1 should equal 1
		assert Calculator.evaluate("2 - 1") == 1, "\t[E] 2 - 1 should equal 1"

		# 4 / 2 should equal 2
		assert Calculator.evaluate("4 / 2") == 2, "\t[E] 4 / 2 should equal 2"

		# 2 * 2 should equal 4
		assert Calculator.evaluate("2 * 2") == 4, "\t[E] 2 * 2 should equals 4"
	end

	def test_multiple_operator_expressions()
		puts "\n[*] Testing Multiple Operator Expressions"

		# 1 + 4 / 2 should equal 3
		assert Calculator.evaluate("1 + 4 / 2") == 3, "\t[E] 1 + 4 / 2 should equal 3"

		# 4 - 2 * 3 should equal -2
		assert Calculator.evaluate("4 - 2 * 3") == -2, "\t[E] 4 - 2 * 3 should equal -2"

		# 5 / 5 + 2 should equal 3
		assert Calculator.evaluate("5 / 5 + 2") == 3, "\t[E] 5 / 5 + 2 should equal 3"

		# 4 * 2 + 2 should equal 10
		assert Calculator.evaluate("4 * 2 + 2") == 10, "\t[E] 4 * 2 + 2 should equal 10"
	end

	def test_bracket_expressions()
		puts "\n[*] Testing Bracket Expressions"

		# ( 1 + 1 ) * 3 should equal 6
		assert Calculator.evaluate("( 1 + 1 ) * 3") == 6, "\t[E] ( 1 + 1 ) * 3 should equal 6"

		# ( 3 + 2 ) / 5 should equal 1
		assert Calculator.evaluate("( 3 + 2 ) / 5") == 1, "\t[E] ( 3 + 2 ) / 5 should equal 5"

		# ( 2 + 3 ) * ( 4 - 3 ) should equal 5
		assert Calculator.evaluate("( 2 + 3 ) * ( 4 - 3 )") == 5, "\t[E] ( 2 + 3 ) * ( 4 - 3 ) should equal 5"

		# ( 2 + 3 ) + ( 3 + 4 ) should equal 12
		assert Calculator.evaluate("( 2 + 3 ) + ( 3 + 4 )") == 12, "\t[E] ( 2 + 3 ) * ( 3 + 4 ) should equal 12"
	end

	def test_exponent_expressions()
		puts "\n[*] Testing Exponent Expressions"

		# 3^2 should equal 6
		assert Calculator.evaluate("3^2") == 9, "\t[E] 3^2 should equal 6"

		# 2 + 2^2 should equal 6
		assert Calculator.evaluate("2 + 2^2") == 6, "\t[E] 2 + 2^2 should equal 6"

		# ( 3 + 3 )^2 should equal 36
		assert Calculator.evaluate("( 3 + 3 )^2") == 36, "\t[E] ( 3 + 3 )^2 should equal 36"
	end

	def test_multi_line_expressions()
		puts "\n[*] Testing Multi Line Expressions"

		# 2 + 2; 2 + ans should equal 6
		assert Calculator.evaluate("2 + 2; 2 + ans") == 6, "\t[E] 2 + 2; 2 + ans should equal 6"

		# x = 2; x^2 should equal 4
		assert Calculator.evaluate("x = 2; x^2") == 4, "\t[E] x = 2; x^2 should equal 4"

		# 2 + 4; ans + 1; ans / 7 should equal 1
		assert Calculator.evaluate("2 + 4; ans + 1; ans / 7") == 1, "\t[E] 2 + 4; ans + 1; ans / 7 should equal 1"
	end

	def test_function_expression()
		puts "\n[*] Testing Function Expressions"
		
		# sin(2) should equal Math.sin(2)
		assert Calculator.evaluate("sin(2)") == Math.sin(2), "[E] sin(2) not correct"
	
		# arccos(0.3) should equal Math.acos(0.3)
		assert Calculator.evaluate("arccos(0.3)") == Math.acos(0.3), "[E] arccos(0.3) not correct"

		# tanh(2) should equal Math.tanh(2)
		assert Calculator.evaluate("tanh(2)") == Math.tanh(2), "[E] tanh(2) not correct"
	end

	def test_nested_function_expressions()
		puts "\n[*] Testing Nested Function Expressions"

		# sin(1+1) should equal Math.sin(1+1)
		assert Calculator.evaluate("sin(1+1)") == Math.sin(1+1), "[E] sin(1+1) should equal Math.sin(1+1)"

		# sin(cos(2)) should equal Math.sin(Math.cos(2))
		assert Calculator.evaluate("sin(cos(2))") == Math.sin(Math.cos(2)), "[E] sin(cos(2)) should equal Math.sin(Math.cos(2))"

		# arcsin(sin(0.5)) should equal 0.5
		assert Calculator.evaluate("arcsin(sin(0.5))") == 0.5, "[E] arcsin(sin(0.5)) should equal 2"
	end

	def test_constants_expressions()

		# pi should equal Math::PI
		assert Calculator.evaluate("pi") == Math::PI, "[E] pi should equal Math::PI"

		# e should equal Math::E
		assert Calculator.evaluate("e") == Math::E, "[E] e should equal Math::E"
	end

	def testing_comp_expressions()
		
		# sin(pi) should equal Math.sin(Math::PI)
		assert Calculator.evaluate("sin(pi)") == Math.sin(Math::PI), "[E] sin(pi) should equal Math.sin(Math::PI)"

		# s = pi; cos(s/2) + cos(s/4) should equal Math.cos(Math::PI/2) + Math.cos(Math:PI/4)
		assert Calculator.evaluate("s = pi; cos(s/2) + cos(x/4)") ==  Math.cos(Math::PI/2) + Math.cos(Math:PI/4), "[E] " 

		# x = (1+2)^2; ln(x) should equal Math.log((1+2)**2)
		assert Calculator.evaluate("x = (1+2)^2; ln(x)") == Math.log((1+2)**2), "[E] x = (1+2)^2; ln(x) should equal Math.log((1+2)**2)"
	end

end
