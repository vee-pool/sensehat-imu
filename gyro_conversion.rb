# Taking input of raw IMU data file,
# gyro_conversion converts the gyroscope readings to Degrees per Seconds

def gyro_conversion(in_file)
  j = 0 # To print the reading numbers
  puts 'Gyroscope readings in Degrees per Seconds'
  in_file.readlines.each do |line|
    if line =~ /gyro:/
      j += 1
      puts "---#{j}---"
      array = line.split(',')
      convert_to_dps(array)
    end
  end
end

def convert_to_dps(array)
  (0...array.length).each do |i|
    inner_array = array[i].split
    print_reading(inner_array, i)
  end
end

def print_reading(inner_array, i)
  if i.zero?
    x = inner_array[inner_array.length - 1].to_f * 0.07
    puts "x: #{x}"
  elsif i == 1
    y = inner_array[inner_array.length - 1].to_f * 0.07
    puts "y: #{y}"
  elsif i == 2
    z = inner_array[inner_array.length - 1].to_f * 0.07
    puts "z: #{z}"
  end
end
