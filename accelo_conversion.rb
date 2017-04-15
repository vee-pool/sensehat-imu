include Math

PI = 3.14159265358979323846
RAD_TO_DEG = 57.29578

def accelo_convert(file)
  file.readlines.each do |line|
    next unless line =~ /accelo:/
    my_array = line.split(',')
    capture_raw(my_array)
  end
  file.close
end

def capture_raw(array)
  for i in 0...array.length
    inner_array = array[i].split
    if i.zero?
      raw_x = inner_array[inner_array.length - 1].to_f
    elsif i == 1
      raw_y = inner_array[inner_array.length - 1].to_f
    elsif i == 2
      raw_z = inner_array[inner_array.length - 1].to_f
    end
  end
  find_accelo_angles(raw_x, raw_y, raw_z)
end

def find_accelo_angles(raw_x, raw_y, raw_z)
  acc_x_angle = (atan2(raw_y, raw_z) + PI) * RAD_TO_DEG
  acc_y_angle = (atan2(raw_z, raw_x) + PI) * RAD_TO_DEG

  acc_x_angle -= 180.0

  if acc_y_angle > 90.0
    acc_y_angle -= 270.0
  else
    acc_y_angle += 90.0
  end

  puts "#{acc_x_angle}\t#{acc_y_angle}"
end

accelo_convert
