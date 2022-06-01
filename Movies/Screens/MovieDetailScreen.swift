//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by Anuj Soni on 31/05/22.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId:String
    
    @ObservedObject var movieDetailVM:MovieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        
        VStack{
        
        if movieDetailVM.loadingState == .success{
        MovieDetailView(movieDetail: movieDetailVM)
        }
        else if movieDetailVM.loadingState == .failed{
        FailedView()
        }
        else if movieDetailVM.loadingState == .loading{
        LoadingView()
        }
        
        }
        .onAppear(){
            self.movieDetailVM.searchByImdbId(imdbid: imdbId)
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "tt1204829")
    }
}
