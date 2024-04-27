//
//  ButtonActions.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 27/04/24.
//

import Foundation

class ButtonActions {
    
    
    func valideFavoriteButton(isFavorite: Bool) {
        
        if isFavorite{
            return isFavorite = false
        }else {
            isFavorite = true
        }
        
    }
}
