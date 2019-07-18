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
//	ID: BD9ADD22-8EC4-438E-BE70-91369D9FB07A
//
//	Pkg: TicTacToe
//
//	Swift: 5.0
//
//	MacOS: 10.15
//

import Foundation
@testable import TicTacToe

// Mock board for test win
func mockBoard(using model: GameViewModel, playerMove: Game.Piece, coords: [Coordinates]) -> GameViewModel {
	var mutModel = model
	mutModel.process(move: playerMove, coordinates: coords[0])
	mutModel.process(move: playerMove, coordinates: coords[1])
	mutModel.process(move: playerMove, coordinates: coords[2])
	return mutModel
}

// Mocks for horizontal win
var mockFirstRowWin: [Coordinates] {
	return [.init(row: 0, column: 0),
			.init(row: 0, column: 1),
			.init(row: 0, column: 2)]
}

var mockSecondRowWin: [Coordinates] {
	return [.init(row: 1, column: 0),
			.init(row: 1, column: 1),
			.init(row: 1, column: 2)]
}

var mockThirdRowWin: [Coordinates] {
	return [.init(row: 2, column: 0),
			.init(row: 2, column: 1),
			.init(row: 2, column: 2)]
}

// Mocks for vertical win
var mockFirstColumnWin: [Coordinates] {
	return [.init(row: 0, column: 0),
			.init(row: 1, column: 0),
			.init(row: 2, column: 0)]
}

var mockSecondColumnWin: [Coordinates] {
	return [.init(row: 0, column: 1),
			.init(row: 1, column: 1),
			.init(row: 2, column: 1)]
}

var mockThirdColumnWin: [Coordinates] {
	return [.init(row: 0, column: 2),
			.init(row: 1, column: 2),
			.init(row: 2, column: 2)]
}

// Mocks for diagonal win
var mockTopLeftToBottomRightWin: [Coordinates] {
	return [.init(row: 0, column: 0),
			.init(row: 1, column: 1),
			.init(row: 2, column: 2)]
}

var mockBottomLeftToTopRightWin: [Coordinates] {
	return [.init(row: 2, column: 0),
			.init(row: 1, column: 1),
			.init(row: 0, column: 2)]
}

// Mocks for board state
let mockGameEmptyBoard = Game.init(board: [
	[.empty, .empty, .empty],
	[.empty, .empty, .empty],
	[.empty, .empty, .empty]
	])

let mockGameFullBoard = Game.init(board: [
	[.x, .o, .x],
	[.o, .o, .x],
	[.x, .x, .o]
	])

let mockGameOneSpaceLeft = Game.init(board: [
	[.x, .o, .x],
	[.o, .o, .x],
	[.x, .x, .empty]
	])

let mockCoord = Coordinates(row: 2, column: 2)

func mockModelEmptyBoard(for player: Player = .playerOne) -> GameViewModel {
	return GameViewModel(game: mockGameEmptyBoard, playerTurn: player)
}

func mockModelFullBoard(for player: Player = .playerOne) -> GameViewModel {
	return GameViewModel(game: mockGameFullBoard, playerTurn: player)
}

func mockModelOneSpaceLeft(for player: Player = .playerOne) -> GameViewModel {
	return GameViewModel(game: mockGameOneSpaceLeft, playerTurn: player)
}
