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
//	ID: D90632DA-DF52-492E-93FC-2CE70CC435D6
//
//	Pkg: TicTacToe
//
//	Swift: 5.0
//
//	MacOS: 10.15
//

import UIKit

// MARK: - AutoLayout Helper
extension UIView {
	
	func anchor(top: NSLayoutYAxisAnchor? = nil,		paddingTop: CGFloat = 0,
				bottom: NSLayoutYAxisAnchor? = nil,		paddingBottom: CGFloat = 0,
				left: NSLayoutXAxisAnchor? = nil,		paddingLeft: CGFloat = 0,
				right: NSLayoutXAxisAnchor? = nil,		paddingRight: CGFloat = 0,
				centerX: NSLayoutXAxisAnchor? = nil,	paddingCenterX: CGFloat = 0,
				centerY: NSLayoutYAxisAnchor? = nil,	paddingCenterY: CGFloat = 0,
				width: CGFloat = 0, height: CGFloat = 0) {
		
		translatesAutoresizingMaskIntoConstraints = false
		
		if let top = top {
			topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
		}
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
		}
		if let right = right {
			rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
		}
		if let left = left {
			leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
		}
		if let centerX = centerX {
			centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
		}
		if let centerY = centerY {
			centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
		}
		if width != 0 {
			widthAnchor.constraint(equalToConstant: width).isActive = true
		}
		if height != 0 {
			heightAnchor.constraint(equalToConstant: height).isActive = true
		}
	}
}
