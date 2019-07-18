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
//	ID: AC2790D1-2438-4235-81E1-8BD139638A35
//
//	Pkg: TicTacToe
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit

class GameViewController: UIViewController {

	// Game View Model
	private lazy var model = GameViewModel()
	
	// Game UI
	private lazy var gameView: GameView = {
		let view = GameView()
		view.elements = model.board
		view.delegate = self
		return view
	}()

	// Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view = gameView
	}
}

// MARK: - Actions
extension GameViewController: GameViewDelegate {
	func squarePressed(square: UIButton) {
		guard let square = Square(rawValue: square.tag) else {
			fatalError("Square not found")
		}
		
		let result = model.process(move: model.playerTurn.piece, coordinates: square.coordinates)
		
		switch result {
		case .moveIlleagal: showAlertView(title: "Illegal Move", message: "Square not empty")
		case .move(let model): update(using: model)
		case .gameDraw(let model): handleEndGame(with: model, message: "It's a draw")
		case .gameWin(let model): handleEndGame(with: model, message: "\(model.playerTurn.rawValue) Wins")
		}
	}
}

// MARK: - End game methods
extension GameViewController {
	private func handleEndGame(with model: GameViewModel, message: String) {
		showAlertView(title: "Game Over", message: message)
		reset()
	}
	
	private func reset() {
		update(using: GameViewModel.reset)
	}
	
	private func update(using model: GameViewModel) {
		self.model = model
		gameView.update(model)
	}
}
