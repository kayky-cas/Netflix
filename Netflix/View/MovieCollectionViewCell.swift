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
			// TODO
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
	
	lazy var details = {
		let label = UILabel()
		// TODO (TITLE) <- center -> (DURATION) min
		label.text = "Jorge"
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
		contentView.addSubviews(image, details)
		contentView.backgroundColor = .cyan
	}
	
	func setupConstraints() {
		image.anchor(
			top: contentView.topAnchor,
			leading: contentView.leadingAnchor,
			bottom: nil,
			trailing: contentView.trailingAnchor,
			size: .init(width: contentView.frame.width, height: contentView.frame.height - 20)
		)
		
		details.anchor(
			top: image.bottomAnchor,
			leading: contentView.leadingAnchor,
			bottom: contentView.bottomAnchor,
			trailing: contentView.trailingAnchor,
			size: .init(width: contentView.frame.width, height: 20)
		)
	}
}
