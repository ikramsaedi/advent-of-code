input = File.open("1_input.txt")
lines = input.readlines().map(&:chomp)

# This gets all the digits within a string
digits_arr = lines.map {|line| line.scan(/\d/)}

sum = 0
digits_arr.each do |digits|
    num = (digits[0] + digits[-1]).to_i
    sum += num
end