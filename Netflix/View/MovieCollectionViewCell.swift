//
//  MovieCell.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
	static let identifier = "MovieCollectionViewCell"
	
	var movie: Movie? {
		didSet {
			details.text = movie?.title
			duration.text = "\(Int(movie!.duration / 60)) min"
		}
	}
	
	lazy var image = {
		let image = UIImageView()
		// TODO
		// - get a nil image
		// - async image load
		// - create an Custom image view??????
		image.image = UIImage(named: "nil-image")
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		return image
	}()
	
	lazy var container = {
		let view = UIView()
		return view
	}()
	
	lazy var duration = {
		let label = UILabel()
		label.textAlignment = .right
		label.textColor = .white
		label.font = UIFont.italicSystemFont(ofSize: 18)
		label.shadowColor = .black
		label.shadowOffset = .init(width: 1, height: 1)
		return label
	}()
	
	lazy var details = {
		let label = UILabel()
		// TODO (TITLE) <- center -> (DURATION) min
		label.text = "Jorge"
		label.numberOfLines = 2
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.shadowColor = .black
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
		setupConstraints()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	func setup() {
		contentView.addSubviews(image, details, duration)
		contentView.backgroundColor = .gray
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
	}
	
	func setupConstraints() {
		image.anchor(
			top: contentView.topAnchor,
			leading: contentView.leadingAnchor,
			bottom: nil,
			trailing: contentView.trailingAnchor,
			size: .init(width: contentView.frame.width, height: contentView.frame.height)
		)
		
		duration.anchor(
			top: contentView.topAnchor,
			leading: contentView.leadingAnchor,
			bottom: nil,
			trailing: contentView.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 5),
			size: .init(width: contentView.frame.width, height: 20)
		)
		
		details.anchor(
			top: nil,
			leading: contentView.leadingAnchor,
			bottom: contentView.bottomAnchor,
			trailing: contentView.trailingAnchor,
			padding: .init(top: 0, left: 5, bottom: 5, right: 5),
			size: .init(width: contentView.frame.width, height: 50)
		)
	}
}
