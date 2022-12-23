//
//  MovieCell.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
	static let identifier = "MovieCollectionViewCell"
	
	var getMovie: ((inout Movie) -> Void)?
	
	private var movie: Movie? {
		didSet {
			title.text = movie?.title
			duration.text = "\(Int(movie!.duration / 60)) min"
			
			if let imageUrl = movie!.imageUrl {
				image.loadAndScale(url: URL(string: imageUrl)!)
			}
		}
	}
	
	private lazy var tapLayer = {
		let view = UIView()
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchUpInside))
		view.isUserInteractionEnabled = true
		view.addGestureRecognizer(tapGestureRecognizer)
		return view
	}()
	
	private lazy var image = {
		let image = UIImageView()
		image.image = UIImage(systemName: "questionmark.video.fill")
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		image.tintColor = .systemPink

		return image
	}()
	
	private lazy var titleContainer = {
		let view = UIVisualEffectView(effect: nil)
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.effect = UIBlurEffect(style: .systemThinMaterialDark)
		view.backgroundColor = .clear
		
		return view
	}()
	
	private lazy var duration = {
		let label = UILabel()
		
		label.textAlignment = .center
		label.textColor = .white
		label.font = UIFont.italicSystemFont(ofSize: 18)
		label.shadowColor = .black
		label.shadowOffset = .init(width: 1, height: 1)
		label.backgroundColor = .systemPink
		label.layer.cornerRadius = 5
		label.layer.masksToBounds = true
		label.layer.shadowColor = UIColor.black.cgColor
		label.layer.shadowOffset = .init(width: 2, height: 2)
		label.layer.shadowOpacity = 1
		
		return label
	}()
	
	private lazy var title = {
		let label = UILabel()
		
		label.numberOfLines = 2
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.shadowColor = .init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.8)
		label.shadowOffset = .init(width: -1, height: 1)
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupCell()
		setupConstraints()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	private func setup() {
		contentView.addSubviews(image, titleContainer, title, duration, tapLayer)
	}
	
	private func setupCell() {
		contentView.backgroundColor = .black
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
		contentView.layer.borderWidth = 2.5
		contentView.layer.borderColor = UIColor.systemPink.cgColor
	}
	
	private func setupConstraints() {
		tapLayer.frame = contentView.bounds
		
		image.anchor(
			top: contentView.topAnchor,
			leading: contentView.leadingAnchor,
			bottom: nil,
			trailing: contentView.trailingAnchor,
			size: .init(width: contentView.frame.width, height: contentView.frame.height)
		)
		
		duration.anchor(
			top: contentView.topAnchor,
			leading: nil,
			bottom: nil,
			trailing: contentView.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 5),
			size: .init(width: 80, height: 25)
		)
		
		titleContainer.anchor(
			top: nil,
			leading: contentView.leadingAnchor,
			bottom: contentView.bottomAnchor,
			trailing: contentView.trailingAnchor,
			size: .init(width: contentView.frame.width, height: 58)
		)
		
		title.anchor(
			top: nil,
			leading: titleContainer.leadingAnchor,
			bottom: titleContainer.bottomAnchor,
			trailing: titleContainer.trailingAnchor,
			padding: .init(top: 0, left: 8, bottom: 8, right: 8),
			size: .init(width: titleContainer.frame.width, height: titleContainer.frame.height / 2)
		)
	}
	
	func setMovie(movie: inout Movie) {
		self.movie = movie
	}
	
	@objc func touchUpInside() {
		getMovie!(&movie!)
	}
}
