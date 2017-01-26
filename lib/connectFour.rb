class ConnectFour
		
	attr_accessor :board, :turn

	def initialize
		@turn = 1
		@board = createBoard
	end

	def createBoard
		@board = Array.new
		for i in 0...6
			@board[i] = Array.new
			for j in 0...7
				@board[i][j] = 0
			end
		end
		return @board
	end

	def play
		win = false
		while (!win)
			win = takeTurn
			@turn += 1
		end
		printBoard
		puts "\nWinner\n"
		if ((@turn - 1) % 2 == 0)
			puts "Player 2"
		else
			puts "Player 1"
		end
	end

	def takeTurn
		printBoard
		puts "\nTurn ##{@turn}\n"
		if (@turn % 2 == 0)
			puts "Player 2's Turn"
		else
			puts "Player 1's Turn"
		end
		col = -1
		valid = false
		row = -1
		while (!valid) 
			puts "\nEnter the column: "
			col = gets.chomp.to_i
			valid,row=placeDisc(col)
		end
		return checkWin(row, col)
	end

	def placeDisc(col)
		for i in 0...6
			if (@board[i][col] == 0)
				if (i == 5)
					@board[5][col] = whosTurn
					return true, 5 
				end
			else 
				if (i == 0)
					return false, -1
				else
					@board[i - 1][col] = whosTurn
					return true, i - 1
				end
			end
		end
	end

	def whosTurn
		if (@turn % 2 == 0)
			return 2
		else
			return 1
		end
	end

	def printBoard
		for i in 0...6
			puts "\n"
			for j in 0...7
				if (@board[i][j] == 0)
					print "◯ "
				elsif (@board[i][j] == 1)
					print "① "
				elsif (@board[i][j] == 2)
					print "② "
				end
			end
		end
		return
	end

	def checkWin(row, col)
		if (checkHorizontal(row, col) || checkVertical(row, col) || checkDiagonals(row, col))
			return true
		end
	end

	def checkDiagonals(row, col)
		if (checkDiagonalDownLeft(row, col) || checkDiagonalDownRight(row, col))
			return true
		end
	end

	def checkDiagonalDownLeft(row, col)
		counter = 0
		lastSpot = 0
		timesDown = 5 - row
		if (timesDown <= col)
			startRow = 5
			startCol = col - timesDown
		else
			startRow = row - timesDown
			startCol = 0
		end
		puts "Starting at Row: #{startRow}, Col: #{startCol}"
		for i in 0...7
			puts "At Row: #{startRow - i}, Col: #{startCol + i}"
			if (counter == 4)
				return true
			end
			if (startRow - i > 5 || startRow - i < 0 || startCol + i > 6 || startCol + i < 0)
				return false
			end
			puts "Row: #{startRow - i}, Column: #{startCol + i}#{@board[startRow - i][startCol + i]}"
			if (@board[startRow - i][startCol + i] == 0)
				counter = 0
				lastSpot = 0
			else
				if (@board[startRow - i][startCol + i] == lastSpot || lastSpot == 0)
					counter += 1
				end
				lastSpot = @board[startRow - i][startCol + i]
			end
		end
		return false
	end

	def checkDiagonalDownRight(row, col)
		counter = 0
		lastSpot = 0
		timesDown = 5 - row
		puts timesDown
		if (timesDown >= col)
			startRow = 5
			startCol = col + timesDown
		else
			startRow = row + timesDown
			startCol = col
		end
		puts "Starting at Row: #{startRow}, Col: #{startCol}"

		for i in 0...7
			if (counter == 4)
				return true
			end
			if (startRow - i > 5 || startRow - i < 0 || startCol - i > 6 || startCol - i < 0)
				return false
			end
			puts "Row: #{startRow - i}, Column: #{startCol - i}#{@board[startRow - i][startCol - i]}"
			if (@board[startRow - i][startCol - i] == 0)
				counter = 0
				lastSpot = 0
			else
				if (@board[startRow - i][startCol - i] == lastSpot || lastSpot == 0)
					counter += 1
				end
				lastSpot = @board[startRow - i][startCol - i]
			end
		end
		return false
	end

	def checkHorizontal(row, col)
		lastSpot = 0
		counter = 0
		for i in 0...7
			if (counter == 4)
				return true
			end
			if (@board[row][i] == 0)
				counter = 0
				lastSpot = 0
			else
				if (@board[row][i] == lastSpot || lastSpot == 0)
					counter += 1
				end
				lastSpot = @board[row][i]
			end
		end
		return false
	end

	def checkVertical(row, col)
		if (row > 2)
			return false
		else
			lastSpot = 0
			counter = 0
			for i in 0...4
				if (@board[row + i][col] == lastSpot || lastSpot == 0)
					counter += 1
				else 
					counter = 0
				end
				lastSpot = @board[row + i][col]
			end
			if (counter == 4)
				return true
			else 
				return false
			end
		end
	end

end

#Uncomment to play
#game = ConnectFour.new
#game.play