# Read the data
f = File.new("hicp.csv", "r")
data = f.readlines
f.close

# find the average
sum = 0
data.each do |hicp|
	value = hicp.split(",")[1].to_f
	sum = sum + value
end
puts "The mean is:"
mean = sum/data.count
puts mean


# standard deviation
sum2 = 0
data.each do |hicp|
	value = hicp.split(",")[1].to_f
	sum2 = sum2 + (value-mean)**2
end
std_dev = (sum2/data.count)**0.5
puts "The standard deviation is:"
puts std_dev

# find the z-scores
zscores = []
data.each do |hicp|
	value = hicp.split(",")[1].to_f
	zscore = (value-mean)/std_dev
	zscores.push(zscore)
end

# write the zscores to a file
f = File.new("hicp_zscores.csv", "w")
f.write(zscores.join("\n"))
f.close

