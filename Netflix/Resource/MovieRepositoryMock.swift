//
//  MovieRepositoryMock.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import Foundation

class MovieRepositoryMock {
	private func populate(completion: @escaping ([Movie]) -> ()) {
		let titles = [
			"Um sonho de Liberdade ",
			"O Poderoso Chefão ",
			"O Poderoso Chefão II",
			"Batman - O Cavaleiro das Trevas",
			"12 Homens e uma Sentença",
			"A Lista de Schindler",
			"Pulp Fiction: Tempo de Violência",
			"O Senhor dos Anéis: O Retorno do Rei",
			"Três homens em Conflito",
			"Clube da Luta",
			"O Senhor dos Anéis: A Sociedade do Anel",
			"Forrest Gump: O Contador de Histórias",
			"Star Wars: Episódio V - O Império Contra-Ataca ",
			"Inception",
			"O Senhor dos Anéis: As Duas Torres",
			"Um Estranho no Ninho",
			"Os Bons Companheiros",
			"Matrix",
			"Os Sete Samurais",
			"Guerra nas Estrelas - Uma Nova Esperança",
			"Cidade de Deus",
			"Seven: Os Sete Crimes Capitais",
			"O Silêncio dos Inocentes",
			"A Felicidade Não se Compra",
		]
		
		completion(titles.map(getRandomMovieStats))
	}
	
	private func getRandomMovieStats(_ title: String) -> Movie {
		let HOUR = 3600
		
		return Movie(title: title, duration: TimeInterval(Int.random(in: HOUR..<HOUR * 4)), exhibitions: UInt.random(in: 1000..<1000000))
	}
}
