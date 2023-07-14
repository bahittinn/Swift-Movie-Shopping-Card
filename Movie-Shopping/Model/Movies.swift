//
//  Movies.swift
//  Movie-Shopping
//
//  Created by Bahittin on 13.07.2023.
//

import Foundation

class Movies {
    var filmId:Int?
    var filmBaslik:String?
    var filmFiyat:Double?
    var filmResimAdi:String?
    
    init(filmId: Int? = nil, filmBaslik: String? = nil, filmFiyat: Double? = nil, filmResimAdi: String? = nil) {
        self.filmId = filmId
        self.filmBaslik = filmBaslik
        self.filmFiyat = filmFiyat
        self.filmResimAdi = filmResimAdi
    }
}
