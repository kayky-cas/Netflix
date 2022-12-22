//
//  TrailerViewController.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKNavigationDelegate {
	private var movie: Movie? {
		didSet {
			nameLabel.text = "TRAILER:\n\t" + movie!.title
			
			let url = URL(string: "https://www.youtube.com/embed/\(movie!.trailerUrl!)?autoplay=1")!
			webView.load(URLRequest(url: url))
		}
	}
	
	private lazy var topCircle = Circle()
	private lazy var bottomCircle = Circle()
	
	private lazy var nameLabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = .white
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var webView = WKWebView()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupConstraints()
	}
	
	func setup() {
		webView.navigationDelegate = self
		
		webView.allowsBackForwardNavigationGestures = false
		
		webView.layer.cornerRadius = 20
		webView.layer.masksToBounds = true
		
		view.addSubviews(topCircle, bottomCircle, webView, nameLabel)
		
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
		
		webView.anchor(
			top: view.safeAreaLayoutGuide.topAnchor,
			leading: nil,
			bottom: nil,
			trailing: nil,
			size: .init(width: view.frame.width - 20, height: 300)
		)
		
		webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
//		nameLabel.anchor(
//			top: webView.bottomAnchor,
//			leading: nil,
//			bottom: nil,
//			trailing: nil,
//			size: .init(width: view.frame.width - 20, height: 300)
//		)

	}
	
	func setMovie(movie: inout Movie) {
		self.movie = movie
	}

}
