//
//  ContentView.swift
//  Movies
//
//  Created by Anuj Soni on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("Hello")
        
            .onAppear(){
        
            HTTPClient().getMovieDetailsBy(imdbId:"tt1204829"){ result in
            switch result{
            case .success(let movies):
            print(movies)
            case .failure(let error):
            print(error)
            print(error.localizedDescription)
            }
        }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
