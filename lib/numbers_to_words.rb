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
    elsif num_string.length == 3 # hundreds
      if num_string[0] == '1' && num_string[1] == '1'
        last_two_digits = num_string[1] + num_string[2]
        answer = "one hundred " + teens.fetch(last_two_digits)
        # hundreds 1 hundred + teens 112
      elsif num_string[1] == '0' && num_string[2] != '0'
        answer = ones.fetch(num_string[0]) + " hundred "  + tens.fetch(num_string[1]) + "" + ones.fetch(num_string[2])
        # hundreds with second number 0  105
      elsif num_string[1] == '1'
        last_two_digits = num_string[1] + num_string[2]
        answer = ones.fetch(num_string[0]) + " hundred "  + teens.fetch(last_two_digits)
      elsif num_string[1] == '0' && num_string[2] == '0'
        answer = ones.fetch(num_string[0]) + " hundred"
      else
        answer = ones.fetch(num_string[0]) + " hundred "  + tens.fetch(num_string[1]) + " " + ones.fetch(num_string[2])
      end


    elsif num_string.length == 4 # thousands
      if num_string[1] == '0' && num_string[2] == '0' && num_string[3] == '0'
        answer = ones.fetch(num_string[0]) + " thousand"
        # working for number with 000 ex:1000
      elsif num_string[2] == '0' && num_string[3] == '0'
        answer = ones.fetch(num_string[0]) + " thousand " + ones.fetch(num_string[1]) + " hundred"
        # working for number with nn00 ex:1100
      elsif num_string[1] == '0' && num_string[2] == '0'
        answer = ones.fetch(num_string[0]) + " thousand " + ones.fetch(num_string[3])
        # working for number with n00n ex:1005
      elsif num_string[1] == '0' && num_string[2] != '1' && num_string[3] == '0'
        answer = ones.fetch(num_string[0]) + " thousand " + tens.fetch(num_string[2])
        # working for number with n0not(1)0 ex:1020
      elsif num_string[1] == '0' && num_string[2] == '1'
        last_two_digits = num_string[2] + num_string[3]
        answer = ones.fetch(num_string[0]) + " thousand " + teens.fetch(last_two_digits)
        # working for number with n01n ex:1015
      elsif num_string[2] == '1'
        last_two_digits = num_string[2] + num_string[3]
        answer = ones.fetch(num_string[0]) + " thousand " + ones.fetch(num_string[1]) + " hundred "  + teens.fetch(last_two_digits)
      elsif num_string[2] != '1' && num_string[3] == '0'
        last_two_digits = num_string[2] + num_string[3]
        answer = ones.fetch(num_string[0]) + " thousand " + ones.fetch(num_string[1]) + " hundred "  + tens.fetch(num_string[2])
      else
        answer = ones.fetch(num_string[0]) + " thousand "  + ones.fetch(num_string[1]) + " hundred " + tens.fetch(num_string[2]) + " " + ones.fetch(num_string[3])
      end
    elsif num_string.length == 5
      ten_thousands_digit = ""
      hundreds_digit = ""
      if num_string[0] != '1' && num_string[2] != "0" && num_string[3] == "0" && num_string[4] == "0"
        #search_digit_one = num_string[0]  num_string[1]
        ten_thousands_digit_one = tens.fetch(num_string[0]) + " "
        ten_thousands_digit_two = ones.fetch(num_string[1])
        ten_thousands_digit = ten_thousands_digit_one + ten_thousands_digit_two + " thousand "
        hundreds_digit = ones.fetch(num_string[2]) + " hundred"
        answer = ten_thousands_digit + hundreds_digit
      elsif num_string[2] == "0" && num_string[3] == "0" && num_string[4] == "0"
        ten_thousands_digit_one = tens.fetch(num_string[0]) + " "
        ten_thousands_digit_two = ones.fetch(num_string[1])
        ten_thousands_digit = ten_thousands_digit_one + ten_thousands_digit_two + " thousand"
      end
    end
  end
end
