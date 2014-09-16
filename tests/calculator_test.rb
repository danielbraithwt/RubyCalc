#APP_ROOT = File.dirname(__FILE__)
APP_ROOT = File.dirname("../")
puts APP_ROOT
$:.unshift( File.join(APP_ROOT, 'lib') )

require "calculator"
require "minitest/autorun"

class TestCalculator < MiniTest::Unit::TestCase
	
	def test_simple_expression()
		puts "[*] Testing Simple Expressions"

		# 1 + 1 should equal 2
		assert Calculator.evaluate("1 + 1") ==  2, "\t[E] 1 + 1 should equal 2"

		# 2 - 1 should equal 1
		assert Calculator.evaluate("2 - 1") == 1, "\t[E] 2 - 1 should equal 1"

		# 4 / 2 should equal 2
		assert Calculator.evaluate("4 / 2") == 2, "\t[E] 4 / 2 should equal 2"

		# 2 * 2 should equal 4
		assert Calculator.evaluate("2 * 2") == 4, "\t[E] 2 * 2 should equals 4"
			
	end

end
