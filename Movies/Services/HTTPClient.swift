//
//  HTTPClient.swift
//  Movies
//
//  Created by Anuj Soni on 25/05/22.
//

import Foundation

enum NetworkError:Error{
case badURL
case noData
case decodingError
}


class HTTPClient{

func getMoviesBy(search:String,completion:@escaping (Result<[Movie]?,NetworkError>)->Void){
    
    //Create a url for http request else badURL
    guard let url = URL.forMoviesByName(search) else {
        return completion(.failure(.badURL))
    }
    
    URLSession.shared.dataTask(with:url){data,response,error in
     //   , completionHandler: T##(Data?, URLResponse?, Error?) -> Void)
    
    //Data Extracted Succesfully else noData
    guard let data = data , error == nil else {
    return completion(.failure(.noData))
    }
    
    //Decoding Succesfull else decodingError
    guard let movies = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
    print("Hello 123")
    return completion(.failure(.decodingError))
    }
    
    return completion(.success(movies.movies))
    
    }.resume()
}

}
