//
//  MovieViewModel.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import Foundation

class MovieViewModel {
	var repository = MovieRepositoryMock()
	
	func getMovies(completion: @escaping ([Movie]) -> ()) {
		repository.populate(completion: completion)
	}
}
