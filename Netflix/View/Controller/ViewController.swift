//
//  ViewController.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	private let viewModel = MovieViewModel()
	
	private let topCircle = {
		let circle = Circle()
		return circle
	}()
	
	private let bottomCircle = {
		let circle = Circle()
		return circle
	}()
	
	private let collectionView = UICollectionView(
		frame: .zero,
		collectionViewLayout: UICollectionViewFlowLayout()
	)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(
			MovieCollectionViewCell.self,
			forCellWithReuseIdentifier: MovieCollectionViewCell.identifier
		)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupConstraints()
	}
	
	func setup() {
		view.addSubviews(topCircle, bottomCircle, collectionView)
		
		view.backgroundColor = .black
		
		collectionView.backgroundColor = .init(
			red: 40 / 255,
			green: 40 / 255,
			blue: 40 / 255,
			alpha: 0
		)
		
		collectionView.isPrefetchingEnabled = false
	}
		
	func setupConstraints() {
		topCircle.anchor(
			top: view.topAnchor,
			leading: nil,
			bottom: nil,
			trailing: view.trailingAnchor,
			padding: .init(top: -300, left: 0, bottom: 0, right: -250),
			size: .init(width: 500, height: 500)
		)
		
		bottomCircle.anchor(
			top: nil,
			leading: view.leadingAnchor,
			bottom: view.bottomAnchor,
			trailing: nil,
			padding: .init(top: 0, left: -250, bottom: -300, right: 0),
			size: .init(width: 500, height: 500)
		)
		
		collectionView.frame = view.bounds
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.getMovies().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: MovieCollectionViewCell.identifier,
			for: indexPath
		) as! MovieCollectionViewCell
		
		var movie = viewModel.getMovies()[indexPath.item]
		
		
		cell.setMovie(movie: &movie)
		
		cell.getMovie = { movie in
			let movieViewController = MovieViewController()
			movieViewController.setMovie(movie: &movie)
			movieViewController.navigateToTrailer = { movie in
				let trailerViewController = TrailerViewController()
				trailerViewController.setMovie(movie: &movie)
				self.navigationController?.pushViewController(trailerViewController, animated: true)
			}
			self.present(movieViewController, animated: true)
//			self.navigationController?.pushViewController(movieViewController, animated: true)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = view.frame.width / 3 - 11
		return CGSize(width: width, height: width * 1.6)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		print("\(indexPath.item)")
	}
}
