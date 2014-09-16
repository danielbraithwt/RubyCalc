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

end
