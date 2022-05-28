//
//  String+Extensions.swift
//  Movies
//
//  Created by Anuj Soni on 28/05/22.
//

import Foundation

extension String{

func trimmedandEscaped() -> String{
    return self.trimmingCharacters(in:.whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) ?? self
}
}

