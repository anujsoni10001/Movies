//
//  ViewModelBase.swift
//  Movies
//
//  Created by Anuj Soni on 28/05/22.
//

import Foundation

enum LoadingState{
case loading,success,failed,none
}


class ViewModelBase : ObservableObject{
@Published var loadingState : LoadingState = .none
}
