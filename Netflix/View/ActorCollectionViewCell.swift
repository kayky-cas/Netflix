//
//  ActorCollectionViewCell.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {
	static let identifier = "ActorCollectionViewCell"
	
	private var actor: Actor? {
		didSet {
			self.actorLabel.text = actor?.name
		}
	}
	
	private lazy var container = {
		let view = UIVisualEffectView(effect: nil)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.effect = UIBlurEffect(style: .systemThinMaterialDark)
		view.backgroundColor = .clear
		
		return view
	}()
	
	private lazy var actorLabel = {
		let label = UILabel()
		label.text = "Carlos"
		label.font = .systemFont(ofSize: 20)
		return label
	}()
	
	private lazy var actorImage = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "person.fill")
		imageView.tintColor = .white
		return imageView
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
		contentView.addSubviews(container, actorImage, actorLabel)
		container.frame = contentView.bounds
	}
	
	private func setupCell() {
		contentView.layer.borderColor = UIColor.systemPink.cgColor
		contentView.layer.borderWidth = 2
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
	}
	
	func setupConstraints() {
		actorImage.anchor(
			top: contentView.topAnchor,
			leading: contentView.leadingAnchor,
			bottom: contentView.bottomAnchor,
			trailing: nil,
			padding: .init(top: 10, left: 20, bottom: 10, right: 0),
			size: .init(width: contentView.frame.height - 20, height: contentView.frame.height)
		)
		
		actorLabel.anchor(
			top: nil,
			leading: actorImage.trailingAnchor,
			bottom: nil,
			trailing: nil,
			padding: .init(top: 0, left: 20, bottom: 0, right: 0)
		)
		
		actorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
	}
	
	func setActor(actor: inout Actor) {
		self.actor = actor
	}
}
