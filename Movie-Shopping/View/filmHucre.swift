//
//  filmHucre.swift
//  Movie-Shopping
//
//  Created by Bahittin on 13.07.2023.
//

import UIKit
protocol filmHucreProtocol {
    func sepeteEkle(indexPath:IndexPath)
}

class filmHucre: UICollectionViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmFiyatLabel: UILabel!
    @IBOutlet weak var filmAdiLabel: UILabel!
    var hucreProtocol:filmHucreProtocol?
    var indexPath:IndexPath?
    
     
    @IBAction func sepeteEkleButtn(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
      
    }
}
