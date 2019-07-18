//	MIT License
//
//	Copyright © 2019_DEV_182
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//
//	ID: F0300BC8-CF2C-4F7C-8710-780BE39722E7
//
//	Pkg: TicTacToe
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

struct GameViewModel {
	var game: Game = Game()
	
	var playerTurn = Player.playerOne
	
	var board: [[Game.Piece]] {
		return game.board
	}
	
	var flatBoard: [Game.Piece] {
		return game.board.flatMap { $0 }
	}
	
	static var reset: GameViewModel {
		return GameViewModel(game: .init(), playerTurn: .playerOne)
	}
	
	mutating func update(with coords: Coordinates) -> GameViewModel {
		let board = game.updateBoard(using: coords, playerTurn: playerTurn)
		return GameViewModel(game: .init(board: board), playerTurn: self.playerTurn)
	}
	
	func swapTurn(current: Player) -> GameViewModel {
		return GameViewModel(game: self.game, playerTurn: current.switchPlayer)
	}
}

// MARK: - Process move
extension GameViewModel {
	
	@discardableResult
	mutating func process(move playerPiece: Game.Piece, coordinates: Coordinates) -> Result {
		
		guard checkLegalMove(coordinates: coordinates) else {
			return .moveIlleagal
		}
		
		let updatedModel = update(with: coordinates)
		
		if updatedModel.checkWin(for: playerPiece, coordinates: coordinates) {
			return .gameWin(updatedModel)
		}
		
		if checkDraw(game: game) {
			return .gameDraw(updatedModel)
		}
		
		return .move(updatedModel.swapTurn(current: playerTurn))
	}
	
	func checkLegalMove(coordinates: Coordinates) -> Bool {
		return self.game[coordinates] == .empty
	}
	
	func checkWin(for playerPiece: Game.Piece, coordinates: Coordinates) -> Bool {
		return checkHorizontalWin(for: playerPiece)
			|| checkVerticalWin(for: playerPiece)
			|| checkDiagonalWin(for: playerPiece)
	}
}

// MARK: - Result Checks
extension GameViewModel {
	
	func checkHorizontalWin(for playerPiece: Game.Piece) -> Bool {
		for row in game.board {
			if row.elements(areAll: playerPiece) { return true }
		}
		return false
	}
	
	func checkVerticalWin(for playerPiece: Game.Piece) -> Bool {
		for column in 0..<3 {
			if playerPiece == game.board[0][column]
			&& playerPiece == game.board[1][column]
			&& playerPiece == game.board[2][column] {
				return true
			}
		}
		return false
	}
	
	func checkDiagonalWin(for playerPiece: Game.Piece) -> Bool {
		if playerPiece == game.board[0][0] && playerPiece == game.board[1][1] && playerPiece == game.board[2][2]
		|| playerPiece == game.board[2][0] && playerPiece == game.board[1][1] && playerPiece == game.board[0][2] {
		   return true
		}
		return false
	}
	
	func checkDraw(game: Game) -> Bool {
		for row in game.board {
			if row.contains(.empty) { return false }
		}
		return true
	}
}
