//
//  MovieListScreen.swift
//  Movies
//
//  Created by Anuj Soni on 26/05/22.
//

import SwiftUI

struct MovieListScreen: View {
    
     @ObservedObject private var movieListVM:MovieListViewModel
    
    @State private var movieName:String = ""
      
      init(){
          self.movieListVM = MovieListViewModel()
          self.movieListVM.searchByName("batman")
      }
    
    var body: some View {
        VStack{
            
            TextField.init("Search", text: $movieName) {_ in
            }.onSubmit {
                self.movieListVM.searchByName(movieName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .padding(.vertical,10)
                
            
            MovieListView(movies: movieListVM.movies)
                .navigationTitle("Movies")
               
        }
        .embedInNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}

