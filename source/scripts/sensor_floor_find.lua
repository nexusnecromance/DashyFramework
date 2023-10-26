import "sensor_floor_reset"

search_max = 32
o = ParSolid
--Left sensor (A)
a_position = sensor_floor_l_y2
a = 0
while (~collision_line(sensor_floor_l_x1,sensor_floor_l_y1+a,sensor_floor_l_x2,sensor_floor_l_y2+a,o,true,true) and a < search_max) do
	a+=1
end
while (collision_line(sensor_floor_l_x1,sensor_floor_l_y1+a,sensor_floor_l_x2,sensor_floor_l_y2+a,o,true,true)) do
	a-=1
end
a_position += a 
--Right sensor (B)
b_position = sensor_floor_r_y2 
b = 0 
while (~collision_line(sensor_floor_r_x1,sensor_floor_r_y1+b,sensor_floor_r_x2,sensor_floor_r_y2+b,o,true,true) and b < search_max) do
	b+=1
end
while (collision_line(sensor_floor_r_x1,sensor_floor_r_y1+b,sensor_floor_r_x2,sensor_floor_r_y2+b,o,true,true)) do
	b-=1
end
b_position += b