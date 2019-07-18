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
//	ID: C83B5463-F93A-46EC-9818-752491031C00
//
//	Pkg: TicTacToe
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

enum Square: Int {
	
	// Top row
	case topLeft
	case topMiddle
	case topRight
	
	// Middle row
	case middleLeft
	case middle
	case middleRight
	
	// Bottom
	case bottomLeft
	case bottomMiddle
	case bottomRight
	
	// Square coordinates
	var coordinates: Coordinates {
		switch self {
		case .topLeft:		return .init(row: 0, column: 0)
		case .middleLeft:	return .init(row: 1, column: 0)
		case .bottomLeft:	return .init(row: 2, column: 0)
		case .topMiddle:	return .init(row: 0, column: 1)
		case .middle:		return .init(row: 1, column: 1)
		case .bottomMiddle: return .init(row: 2, column: 1)
		case .topRight:		return .init(row: 0, column: 2)
		case .middleRight:	return .init(row: 1, column: 2)
		case .bottomRight:	return .init(row: 2, column: 2)
		}
	}
}
