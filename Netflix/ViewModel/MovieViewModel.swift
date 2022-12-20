//
//  MovieViewModel.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import Foundation

class MovieViewModel {
	var repository = MovieRepositoryMock()
	
	private var movies: [Movie] = []
	
	init() {
		repository.populate { movies in
			movies.forEach { movie in
				self.movies.append(movie)
			}
		}
	}
	
	func getMovies() -> [Movie] {
		return movies
	}
}
