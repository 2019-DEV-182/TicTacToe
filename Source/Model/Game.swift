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
//	ID: 9ECA3ED2-C880-427C-9818-BA45A4BFDBAE
//
//	Pkg: TicTacToe
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

struct Game {
	
	enum Piece: String {
		case empty = ""
		case x = "❌"
		case o = "⭕️"
	}
	
	var board: [[Piece]] = [
		[.empty, .empty, .empty],
		[.empty, .empty, .empty],
		[.empty, .empty, .empty]
	]
	
	subscript(coordinates: Coordinates) -> Piece {
		get {
			return board[coordinates.row][coordinates.column]
		}
	}
	
	mutating func updateBoard(using coordinates: Coordinates, playerTurn: Player) -> [[Piece]] {
		board[coordinates.row][coordinates.column] = playerTurn.piece
		return board
	}
}
