//
//  ViewController.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import UIKit

class ViewController: UIViewController {
	let MOVIES_PER_PAGE = 18

	@IBOutlet weak var movieList: UILabel!
	
	private let viewModel = MovieViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		viewModel.getMovies { movies in
			var titles = ""
			
			let slice = movies[0..<self.MOVIES_PER_PAGE]
			
			for movie in slice {
				titles += "- \(movie.title)\n\tDuration: \(Int(movie.duration / 60)) min\n\n"
			}
			
			self.movieList.numberOfLines = slice.count * 2
			self.movieList.text = titles
		}
	}
}

