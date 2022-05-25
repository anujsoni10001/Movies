//
//  Movie.swift
//  Movies
//
//  Created by Anuj Soni on 25/05/22.
//

import Foundation

struct MovieResponse:Codable{
let movies :[Movie]

private enum CodingKeys:String,CodingKey{
case movies = "Search"
}
}


struct Movie:Codable{
let title:String
let year:String
let imdbID:String
let poster:String
    
private enum CodingKeys:String,CodingKey{
case title = "Title"
case year = "Year"
case imdbID = "imdbID"
case poster = "Poster"
}
}

