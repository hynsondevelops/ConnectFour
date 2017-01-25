require 'spec_helper'

describe ConnectFour do 
	before :all do 
		@game = ConnectFour.new
		@board = @game.board
	end

	describe "#new" do
		it "Creates a connectFour object" do
			expect(@game).to be_an_instance_of(ConnectFour)
		end
	end

	describe "#createBoard" do
		it "Stores the board in the Connect Four object" do
			expect(@game.board).to be_an_instance_of(Array)
		end

		it "Builds a 7x6 board" do
			expect(@board.size).to eq(6)
			for i in 0...@board.size
				expect(@board[i].size).to eq(7) 
			end
		end

		it "Initializes the board to all 0's" do
			for i in 0...@board.size
				for j in 0...@board[i].size
					expect(@board[i][j]).to eq(0)
				end
			end
		end
	end

	describe "#placeDisc" do
		it "Places a player's choice on the board" do
			@game.placeDisc(0)
			expect(@game.board[5][0]).to eq(1)
		end	

		it "Differentiates between players' turns" do
			@game.placeDisc(2)
			@game.turn = 2;
			@game.placeDisc(1)
			expect(@game.board[5][2]).to eq(1)
			expect(@game.board[5][1]).to eq(2)		
		end

		it "Drops the disc into the right row" do
			@game.placeDisc(0)
			expect(@game.board[4][0]).to eq(2)
		end

		it "Does not allow placement of a disc in a full column" do
			@game.placeDisc(0)
			@game.placeDisc(0)
			@game.placeDisc(0)
			@game.placeDisc(0)
			expect(@game.placeDisc(0)[0]).to eq(false)
		end

	end

end