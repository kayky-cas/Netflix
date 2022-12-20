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
	
	init(title: String, duration: TimeInterval, exhibitions: UInt, description: String? = nil) {
		id = .init()
		self.title = title
		self.description = description
		self.duration = duration
		self.exhibitions = exhibitions
	}
}
