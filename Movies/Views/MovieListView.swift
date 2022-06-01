//
//  MovieListView.swift
//  Movies
//
//  Created by Anuj Soni on 26/05/22.
//

import SwiftUI

struct MovieListView: View {

    let movies : [MovieViewModel]

    var body: some View {
        List(movies,id: \.imdbId){movie in
        NavigationLink(destination:MovieDetailScreen(imdbId:movie.imdbId)){
            MovieCell(movie: movie)
            .padding(.vertical,4)
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: [MovieViewModel(movie:Movie(title:"Asdulla", year:"2016", imdbId: "123", poster: "https://m.media-amazon.com/images/M/MV5BMTQwNDM2MTMwMl5BMl5BanBnXkFtZTgwMjE4NjQxMTE@._V1_SX300.jpg"))])
    }
}


struct MovieCell: View {
    
    let movie :MovieViewModel
    
    var body: some View {
        HStack(alignment:.top){
            URLImage(url:movie.poster)
                .frame(width:100, height: 120, alignment: .top)
                .cornerRadius(6)
                .shadow(color:Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
            
            
            VStack(alignment:.leading,spacing:10){
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(movie.year)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top,5)
                
            }.padding(5)
            
            Spacer()
        }.contentShape(Rectangle())
    }
}

