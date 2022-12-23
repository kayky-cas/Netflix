//
//  MovieViewController.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit

class MovieViewController: UIViewController {
	
	var navigateToTrailer: ((inout Movie) -> Void)?
	
	private var movie: Movie? {
		didSet {
			titleLabel.text = movie!.title
			duration.text = "\(Int(movie!.duration / 60)) min"
			descriptionTextView.text = "Description:\n\n\t" + (movie!.description ?? "")
			
			if let imageUrl = movie!.imageUrl {
				image.load(url: URL(string: imageUrl)!)
			}
		}
	}
	
	private lazy var circle = Circle()
	
	private lazy var line = {
		let view = UIView()
		view.backgroundColor = .systemPink
		return view
	}()
	
	private lazy var descriptionContainer = {
		let view = UIVisualEffectView(effect: nil)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.effect = UIBlurEffect(style: .systemThickMaterialDark)
		view.backgroundColor = .clear
		view.layer.cornerRadius = 15
		view.layer.masksToBounds = true
		return view
	}()
	
	private lazy var descriptionTextView = {
		let textView = UITextView()
		textView.backgroundColor = .clear
		textView.textColor = .white
		textView.textAlignment = .justified
		textView.font = .systemFont(ofSize: 16)
		
		return textView
	}()
	
	lazy var container = {
		let view = UIVisualEffectView(effect: nil)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.effect = UIBlurEffect(style: .systemThinMaterialDark)
		view.backgroundColor = .clear
		
		return view
	}()
	
	private lazy var image = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true

		imageView.layer.masksToBounds = true
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = .init(width: 0, height: -3)
		return imageView
	}()
	
	private lazy var titleContainer = UIView()
	
	private lazy var titleLabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.italicSystemFont(ofSize: 30)
		label.numberOfLines = 0
		label.shadowColor = .black
		label.shadowOffset = .init(width: -3, height: 2)
		return label
	}()
	
	lazy var duration = {
		let label = UILabel()
		label.textAlignment = .center
		label.textColor = .white
		label.font = UIFont.italicSystemFont(ofSize: 20)
		label.shadowColor = .black
		label.shadowOffset = .init(width: 1, height: 1)
		label.backgroundColor = .systemPink
		label.layer.cornerRadius = 10
		label.layer.masksToBounds = true
		label.layer.shadowColor = UIColor.black.cgColor
		label.layer.shadowOffset = .init(width: 2, height: 2)
		label.layer.shadowOpacity = 1
		return label
	}()
	
	lazy var ratingButton = {
		let button = UIButton(configuration: UIButton.Configuration.filled())
		button.setTitle("TRAILER", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.tintColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
		button.layer.borderColor = UIColor.systemPink.cgColor
		button.layer.borderWidth = 3
		button.layer.cornerRadius = 15
		button.layer.masksToBounds = true
		
		button.addTarget(self, action: #selector(self.touchUpInside), for: .touchUpInside)
		return button
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
		view.addSubviews(
			container,
			circle,
			image,
			duration,
			line,
			titleContainer,
			titleLabel,
			descriptionContainer,
			descriptionTextView,
			ratingButton
		)
		
		container.frame = view.bounds
	}
	
	func setupConstraints() {
		let circleRadius = 400.0
		
		circle.anchor(
			top: nil,
			leading: nil,
			bottom: view.bottomAnchor,
			trailing: view.trailingAnchor,
			padding: .init(top: 0, left: 0, bottom: -circleRadius / 2, right: -circleRadius / 2),
			size: .init(width: circleRadius, height: circleRadius)
		)

		image.anchor(
			top: view.safeAreaLayoutGuide.topAnchor,
			leading: nil,
			bottom: nil,
			trailing: nil,
			size: .init(width: view.frame.width, height: 250)
		)
		
		line.anchor(
			top: image.bottomAnchor,
			leading: nil,
			bottom: nil,
			trailing: nil,
			size: .init(width: view.frame.width, height: 5)
		)
		
		duration.anchor(
			top: image.topAnchor,
			leading: nil,
			bottom: nil,
			trailing: image.trailingAnchor,
			padding: .init(top: 15, left: 0, bottom: 0, right: 10),
			size: .init(width: 100, height: 35)
		)
		
		titleContainer.anchor(
			top: line.bottomAnchor,
			leading: nil,
			bottom: nil,
			trailing: nil,
			padding: .init(top: 15, left: 0, bottom: 0, right: 0),
			size: .init(width: view.frame.width, height: 0)
		)
		
		titleLabel.anchor(
			top: titleContainer.topAnchor,
			leading: titleContainer.leadingAnchor,
			bottom: titleContainer.bottomAnchor,
			trailing: titleContainer.trailingAnchor,
			padding: .init(top: 0, left: 20, bottom: 0, right: 20),
			size: .init(width: titleContainer.frame.width, height: titleContainer.frame.height)
		)
		
		ratingButton.anchor(
			top: nil,
			leading: nil,
			bottom: view.safeAreaLayoutGuide.bottomAnchor,
			trailing: nil,
			padding: .init(top: 10, left: 0, bottom: 0, right: 0),
			size: .init(width: 150, height: 40)
		)
		
		ratingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
				
		descriptionContainer.anchor(
			top: titleContainer.bottomAnchor,
			leading: nil,
			bottom: ratingButton.topAnchor,
			trailing: nil,
			padding: .init(top: 20, left: 0, bottom: 20, right: 0),
			size: .init(width: view.frame.width - 30, height: 0)
		)
		
		descriptionContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		descriptionTextView.anchor(
			top: descriptionContainer.topAnchor,
			leading: descriptionContainer.leadingAnchor,
			bottom: descriptionContainer.bottomAnchor,
			trailing: descriptionContainer.trailingAnchor,
			padding: .init(top: 10, left: 15, bottom: 10, right: 15)
		)
	}
	
	func setMovie(movie: inout Movie) {
		self.movie = movie
	}
	
	@objc func touchUpInside() {
		dismiss(animated: true)
		navigateToTrailer!(&movie!)
	}
}
