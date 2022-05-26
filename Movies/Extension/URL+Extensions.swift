//
//  URL+Extensions.swift
//  Movies
//
//  Created by Anuj Soni on 26/05/22.
//

import Foundation


extension URL{
    
static func forMoviesByName(_ name:String) -> URL?{
return URL(string:"http://www.omdbapi.com/?apikey=\(Constants.API_KEY)&s=\(name)")
}
    
}
