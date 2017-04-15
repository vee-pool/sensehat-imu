# The code takes input from data_imu.txt
# it calculate the heading and the direction
# it consists of 4 function
# compass_convert finds the lines starting from 'compass:'.
# deletes the commas
# capture_raw(array) takes the resulting array.
# splits it to get the desired compass data as x and y cordinate
# compute_heading computes the heading in degree.
# converts it into range 0-360
# compute_direction determines the direction and prints it

def compass_convert
  file = File.open('data_imu.txt', 'r')
  file.readlines.each do |line|
    next unless line =~ /compass:/
    array = line.split(', ')
    capture_raw(array)
  end # end of loop
  file.close
end # end of function

def capture_raw(array)
  for i in 0...array.length
    inner_array = array[i].split

    if i.zero?
      raw_x = inner_array[inner_array.length - 1].to_f
    elsif i == 1
      raw_y = inner_array[inner_array.length - 1].to_f
    end # end of if

  end # end of for
  compute_heading(raw_x, raw_y)
end # end of function

def compute_heading(raw_x, raw_y)
  heading = (Math.atan2(raw_y, raw_x) * 180) / Math::PI
  if heading < 0 then heading += 360 end
  compute_direction(heading)
end # end of function

def compute_direction(heading)
  if heading > 68 && heading < 113 then dirn = 'East'
  elsif heading > 248 && heading < 293 then dirn = 'West'
  elsif heading > 338 || heading < 23 then dirn = 'North'
  elsif heading > 158 && heading < 203 then dirn = 'South'
  elsif heading > 23 && heading < 68 then dirn = 'North-East'
  elsif heading > 112 && heading < 158 then dirn = 'South-East'
  elsif heading > 203 && heading < 248 then dirn = 'South-West'
  elsif heading > 293 && heading < 338 then dirn = 'North-West'
  end # end of if
  print "heading = #{heading}\tdir = #{dirn} \n"
end # end of function

compass_convert
