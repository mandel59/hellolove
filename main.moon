export font
export data

love.load = (arg) ->
	font = love.graphics.newFont "mplus_subset.ttf", 32
	file = love.filesystem.newFile "hello.txt"
	file\open 'r'
	data = file\read()
	return

love.draw = ->
	love.graphics.setFont font
	love.graphics.print data, 10, 10
	return
