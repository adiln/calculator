module Evaluate
  extend ActiveSupport::Concern

  def execute(params)

    operators = []
    values = []
    params.delete(' ').split(/\s+|\b/).each do |elem|
      # collect numbers
      if (!!(elem =~ /^\d+$/))
        values << to_float_or_int(elem)
      end
      #collect operators, check precedence. If top oprator(in stack) has higher or same precedence
      #to the current operator, then calculate with top operator and two top values
      if (['+', '-', '*', '/'].include?(elem))
        while (!operators.empty? && check_precedence(elem, operators.last))
          values << (apply_operator operators.pop, values.pop, values.pop)
        end
        operators << elem
      end
    end

    # calculate values with remaining operators
    while (!operators.empty?)
      values << (apply_operator operators.pop, values.pop, values.pop)
    end
    return values.pop
  end

  private

  def check_precedence op1, op2
    if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
      return false;
    else
      return true;
    end
  end

  def apply_operator elem, b, a
    case elem
      when '+'
        a + b
      when '-'
        a - b
      when '*'
        a * b
      when '/'
        if (b == 0)
          raise "Cannot divide by zero"
        end
        a > b ? (a / b) : (a.to_f/b).round(2)
    end
  end

  # convert string to integer or float
  def to_float_or_int str
    Integer(str) rescue Float(str) rescue nil
  end

end
