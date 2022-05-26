//
//  Movie.swift
//  Movies
//
//  Created by Anuj Soni on 25/05/22.
//

import Foundation

//Supporting Component holding list of Models
struct MovieResponse:Codable{
let movies :[Movie]

private enum CodingKeys:String,CodingKey{
case movies = "Search"
}
}

//Model
struct Movie:Codable{
let title:String
let year:String
let imdbId:String
let poster:String
    
private enum CodingKeys:String,CodingKey{
case title = "Title"
case year = "Year"
case imdbId = "imdbID"
case poster = "Poster"
}
}


