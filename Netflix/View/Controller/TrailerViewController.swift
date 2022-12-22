//
//  TrailerViewController.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit

class TrailerViewController: UIViewController {
	private let topCircle = {
		let circle = Circle()
		return circle
	}()
	
	private let bottomCircle = {
		let circle = Circle()
		return circle
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupConstraints()
	}
	
	func setup() {
		view.addSubviews(topCircle, bottomCircle)
		
		view.backgroundColor = .black
	}
		
	func setupConstraints() {
		topCircle.anchor(
			top: view.topAnchor,
			leading: view.leadingAnchor,
			bottom: nil,
			trailing: nil,
			padding: .init(top: -300, left: -250, bottom: 0, right: 0),
			size: .init(width: 500, height: 500)
		)
		
		bottomCircle.anchor(
			top: nil,
			leading: nil,
			bottom: view.bottomAnchor,
			trailing: view.trailingAnchor,
			padding: .init(top: 0, left: 0, bottom: -300, right: -250),
			size: .init(width: 500, height: 500)
		)
	}

}
