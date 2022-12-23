//
//  TrailerViewController.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKNavigationDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	private var movie: Movie? {
		didSet {
			updateUI()
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
	
	private lazy var actorsLabel = {
		let label = UILabel()
		
		label.text = "Actors:"
		label.font = .boldSystemFont(ofSize: 20)
		
		return label
	}()
	
	private lazy var webView = {
		let webView = WKWebView()
		
		webView.navigationDelegate = self
		webView.allowsBackForwardNavigationGestures = false
		webView.layer.cornerRadius = 20
		webView.layer.masksToBounds = true
		webView.layer.borderColor = UIColor.systemPink.cgColor
		webView.layer.borderWidth = 2
		
		return webView
	}()
	
	private lazy var collectionView = {
		let collectionView = UICollectionView(
			frame: .zero,
			collectionViewLayout: UICollectionViewFlowLayout()
		)
		
		collectionView.backgroundColor = .clear
		
		return collectionView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(
			ActorCollectionViewCell.self,
			forCellWithReuseIdentifier: ActorCollectionViewCell.identifier
		)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupConstraints()
	}
	
	private func setup() {
		view.addSubviews(topCircle, bottomCircle, webView, nameLabel, actorsLabel, collectionView)
		
		view.backgroundColor = .black
	}
		
	private func setupConstraints() {
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
		
		actorsLabel.anchor(
			top: webView.bottomAnchor,
			leading: view.leadingAnchor,
			bottom: nil,
			trailing: nil,
			padding: .init(top: 20, left: 20, bottom: 0, right: 0),
			size: .init(width: view.frame.width - 50, height: 0)
		)
		
		collectionView.anchor(
			top: actorsLabel.bottomAnchor,
			leading: nil,
			bottom: view.bottomAnchor,
			trailing: nil,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0),
			size: .init(width: view.frame.width - 50, height: 0)
		)
		
		collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	func setMovie(movie: inout Movie) {
		self.movie = movie
	}
	
	private func updateUI() {
		nameLabel.text = "TRAILER:\n\t" + movie!.title
		
		let url = URL(string: "https://www.youtube.com/embed/\(movie!.trailerYoutubeId!)?autoplay=1")!
		webView.load(URLRequest(url: url))
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movie?.actors.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: ActorCollectionViewCell.identifier,
			for: indexPath
		) as! ActorCollectionViewCell
		
		var actor = movie!.actors[indexPath.item]
		
		cell.setActor(actor: &actor)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.frame.width
		return CGSize(width: width, height: 60)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		print("\(indexPath.item)")
	}
}
