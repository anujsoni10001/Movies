//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Anuj Soni on 30/05/22.
//
import Foundation

class MovieDetailViewModel : ObservableObject{

private var movieDetail:MovieDetail?

@Published var loadingState : LoadingState = .loading
let httpClient = HTTPClient()
    
init(movieDetail:MovieDetail? = nil){
self.movieDetail = movieDetail
}

var title: String {
self.movieDetail?.title ?? ""
}
    
var poster: String {
self.movieDetail?.poster ?? ""
}

var plot: String {
self.movieDetail?.plot ?? ""
}

var rating :Int {
get{
    let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
    return Int(ceil(ratingAsDouble ?? 0.0))
}
}
    
var director : String {
self.movieDetail?.director ?? ""
}

func searchByImdbId(imdbid:String){
httpClient.getMovieDetailsBy(imdbId: imdbid) { result in
      switch result{
        case .success(let moviedetail):
                DispatchQueue.main.async{
                self.movieDetail = moviedetail
                self.loadingState = .success
                }
        case .failure(let error):
          print(error.localizedDescription)
            DispatchQueue.main.async {
                self.loadingState = .failed
            }
        }
    }
}
}
