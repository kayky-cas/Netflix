//
//  Circle.swift
//  Netflix
//
//  Created by unicred on 21/12/22.
//

import UIKit

class Circle: UIView {
	override func draw(_ rect: CGRect) {
		layer.cornerRadius = frame.height / 2
		layer.masksToBounds = true
		layer.backgroundColor = UIColor.systemPink.cgColor
	}
}
