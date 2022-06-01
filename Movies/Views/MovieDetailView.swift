//
//  MovieDetailView.swift
//  Movies
//
//  Created by Anuj Soni on 31/05/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetail : MovieDetailViewModel
    
    var body: some View {
        
        ScrollView {
        
        VStack(alignment: .leading, spacing: 10) {
            
            URLImage(url: movieDetail.poster)
            .cornerRadius(10)
            .shadow(color:Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
        
            Text(movieDetail.title.uppercased())
            .fontWeight(.bold)
            .padding(.top,10)
            
            Text(movieDetail.plot)
            .multilineTextAlignment(.leading)
            
            
            Text("Rating : \(movieDetail.rating)/10".uppercased())
                .fontWeight(.bold)
            
            Rating(rating:.constant(movieDetail.rating))
            
            Text("Director".uppercased())
                .fontWeight(.bold)
            
            Text(movieDetail.director)                .multilineTextAlignment(.leading)
    
            Spacer()
            
        }.padding()
            
        .navigationTitle(movieDetail.title.uppercased())
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetail: MovieDetailViewModel(movieDetail:MovieDetail(title: "The Racing Brothers, Lets & Go", year:"1996–1997", rated: "TV-PG", plot:"Two competitive brothers, Go and Retsu, meet a man named Dr. Tsuchiya who gives them two cars and tells them to enter the Mini 4WD competition.", director: "N/A", actors: "Ikue Ôtani, Hidenari Ugaki, Masako Katsuki", imdbRating: "7.0", poster: "https://m.media-amazon.com/images/M/MV5BNzcxOGViMjMtNTQ0ZC00ZjJmLWE2MzktN2E4NmU0YjkzM2IxXkEyXkFqcGdeQXVyMTEwNDU1MzEy._V1_SX300.jpg", imdbId: "tt1204829"))).embedInNavigationView()
    }
}


