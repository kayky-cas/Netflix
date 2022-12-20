//
//  Movie.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import Foundation

struct Movie {
	let id: UUID
	var title: String
	var description: String?
	var duration: TimeInterval
	var exhibitions: UInt
	var imageUrl: String?
	
	init(title: String, description: String? = nil, duration: TimeInterval, exhibitions: UInt, imageUrl: String? = nil) {
		id = .init()
		
		self.title = title
		self.description = description
		self.duration = duration
		self.exhibitions = exhibitions
		self.imageUrl = imageUrl
	}
}
