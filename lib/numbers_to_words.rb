class Fixnum
  define_method(:to_word) do
    num_string = self.to_s
    answer = ""
    ones = { "0" => "zero", "1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine"}
    teens = {"10" => "ten", "11" => "eleven", "12" => "twelve", "13" => "thirteen", "14" => "fourteen", "15" => "fifteen", "16" => "sixteen", "17" => "seventeen", "18" => "eighteen", "19" => "nineteen"}
    tens = {"0" => "", "2" => "twenty", "3" => "thirty", "4" => "forty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety"}

    if num_string.length == 1
      ones.fetch(num_string)
    elsif num_string.length == 2
      if num_string[0] == '1'
        teens.fetch(num_string)
      else
        answer = tens.fetch(num_string[0]) + " " + ones.fetch(num_string[1])
        answer
      end
    elsif num_string.length == 3
      if num_string[0] == '1' && num_string[1] == '1'
        last_two_digits = num_string[1] + num_string[2]
        answer = "one hundred " + teens.fetch(last_two_digits)
        # hundreds 1 hundred + teens 112

      elsif num_string[1] == '0'
        answer = ones.fetch(num_string[0]) + " hundred "  + tens.fetch(num_string[1]) + "" + ones.fetch(num_string[2])
        # hundreds with second number 0  205
      elsif num_string[1] == '1'
        last_two_digits = num_string[1] + num_string[2]
        answer = ones.fetch(num_string[0]) + " hundred "  + teens.fetch(last_two_digits)
      else
        answer = ones.fetch(num_string[0]) + " hundred "  + tens.fetch(num_string[1]) + " " + ones.fetch(num_string[2])

      end
    end
  end
end
