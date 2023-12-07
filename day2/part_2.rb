input = File.open("input.txt")
lines = input.readlines().map(&:chomp)

bag = {
    red: 12,
    green: 13,
    blue: 14,
}

power_sum = 0
lines.map do |line|
    id = line.scan(/Game (\d*): /).flatten()[0]

    # Remove "Game (id): " from the line
    remaining_line = line.gsub(/Game (\d+): /) {|x| ""}
    color_combos = remaining_line.split(";")
    num_and_color_arr = color_combos.map do |color_combo| 
        color_combo.scan(/(\d+) (blue|red|green)/)
    end
    colors_to_freqs = num_and_color_arr.map do |nums_and_colors|
        color_to_freq = {}
        nums_and_colors.each do |num_and_color|
            num = num_and_color[0].to_i
            color = num_and_color[1]
            new_hash = Hash[color, num]
            color_to_freq = color_to_freq.merge(new_hash)
        end
        color_to_freq
    end

    # Refactor later
    green_max = colors_to_freqs.group_by {|color_to_freq| color_to_freq["green"]}.keys.compact.max
    blue_max = colors_to_freqs.group_by {|color_to_freq| color_to_freq["blue"]}.keys.compact.max
    red_max = colors_to_freqs.group_by {|color_to_freq| color_to_freq["red"]}.keys.compact.max

    power = red_max * green_max * blue_max
    power_sum += power
end

print power_sum