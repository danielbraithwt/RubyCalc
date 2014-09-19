APP_ROOT = File.dirname(__FILE__)

$:.unshift( File.join(APP_ROOT, 'lib') )
require 'calculator'
require 'expression_builder'

def get_expression
	print "Enter a line to add to the expression (quit to exit): "
	input = gets.chomp.strip

	return input
end

eb = ExpressionBuilder.new

puts "Welcome To RubyCalc!\n"

expression = get_expression

while expression != "quit" do
	#puts "The reuslt is :#{Calculator.evaluate(expression)}\n\n"
	#expression = get_expression
	eb.add_line(expression)
	expression = get_expression
end

puts "Goodbye"
