input = File.open("input.txt")
lines = input.readlines().map(&:chomp)

# This gets all the digits within a string
# The positive lookahead works for cases like "oneight", where you are still expected to 
# pluck "one" and "eight" as separate strings (rather than just "one").
# I think what is doing is no matter your position in the string, it gets every instance of one, two etc
# without actually consuming it. So in the case of oneight, both one and eight can be found because one was not consumed
# in a capturing group
# See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion

digits_arr = lines.map {|line| line.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten()}

def convert_to_digit(str) 
    # If you want to use strings as keys in a hash
    # The hash must be defined with rocket notation
    str_to_int = {
        "one" => "1",
        "two" => "2",
        "three" => "3",
        "four" => "4",
        "five" => "5",
        "six" => "6",
        "seven" => "7",
        "eight" => "8",
        "nine" => "9"
    }
    if str.to_i.to_s == str
        return str
    else 
        return str_to_int[str]
    end
end


sum = 0
digits_arr.each do |digits|
    num = (convert_to_digit(digits[0]) + convert_to_digit(digits[-1])).to_i
    sum += num
end

print(sum)