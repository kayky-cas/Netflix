//
//  UIImageView+Extension.swift
//  Netflix
//
//  Created by unicred on 22/12/22.
//

import UIKit

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
	
	func loadAndScale(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
						self?.contentMode = .scaleAspectFill
					}
				}
			}
		}
	}
}

//
