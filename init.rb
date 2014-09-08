APP_ROOT = File.dirname(__FILE__)

$:.unshift( File.join(APP_ROOT, 'lib') )
require 'calculator'

def get_expression
	print "Enter an expression (quit to exit): "
	input = gets.chomp.strip

	return input
end

calculator = Calculator.new

puts "Welcome To RubyCalc!\n"

expression = get_expression

while expression != "quit" do
	puts "The reuslt is :#{Calculator.evaluate(expression)}\n\n"
	expression = get_expression
end

puts "Goodbye"
