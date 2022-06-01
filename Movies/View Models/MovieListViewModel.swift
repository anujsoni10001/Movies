//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Anuj Soni on 26/05/22.
//

import Foundation

class MovieListViewModel : ViewModelBase{
    
@Published var movies : [MovieViewModel] = [MovieViewModel]()
let httpClient = HTTPClient()
    
func searchByName(_ name :String){

if name.isEmpty{
    self.loadingState = .failed
    return
}
    
    self.loadingState = .loading
    
httpClient.getMoviesBy(search:name.trimmedandEscaped()){ result in
    switch result{
    case .success(let movies):
        if let movie = movies {
            DispatchQueue.main.async{
            self.movies = movie.map(MovieViewModel.init)
            self.loadingState = .success
            }
        }
    case .failure(let error):
        DispatchQueue.main.async {
            self.loadingState = .failed
        }
    print(error.localizedDescription)
    }
}
}
}

struct MovieViewModel{

let movie:Movie

var title:String{
movie.title
}

var poster:String{
movie.poster
}
    
var imdbId:String{
movie.imdbId
}
    
var year:String{
movie.year
}
}

