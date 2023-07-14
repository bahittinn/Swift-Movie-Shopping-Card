//
//  ViewController.swift
//  Movie-Shopping
//
//  Created by Bahittin on 13.07.2023.
//

import UIKit

class ViewController: UIViewController {

    var filmlerListesi = [Movies]()
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userD = UserDefaults.standard
        
        
        
        if let tabItems = tabBarController?.tabBar.items {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[0]
            tabItem.badgeValue = userD.string(forKey: "sepetSayisi")
        }
        
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.8)
        tasarim.scrollDirection = .vertical
        filmCollectionView!.collectionViewLayout = tasarim
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        let f1 = Movies(filmId: 1, filmBaslik: "Django", filmFiyat: 15.99, filmResimAdi: "django")
        let f2 = Movies(filmId: 2, filmBaslik: "Inception", filmFiyat: 15.99, filmResimAdi: "inception")
        let f3 = Movies(filmId: 3, filmBaslik: "Interstellar", filmFiyat: 15.99, filmResimAdi: "interstellar")
        let f4 = Movies(filmId: 4, filmBaslik: "Anadoluda", filmFiyat: 15.99, filmResimAdi: "birzamanlaranadoluda")
        let f5 = Movies(filmId: 5, filmBaslik: "The Hateful Eight", filmFiyat: 15.99, filmResimAdi: "thehatefuleight")
        let f6 = Movies(filmId: 6, filmBaslik: "The Pianist", filmFiyat: 15.99, filmResimAdi: "thepianist")
        
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
    }


}
//commit
var increase = 0
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,filmHucreProtocol {
    func sepeteEkle(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print(film.filmBaslik!)
        
        if let tabItems = tabBarController?.tabBar.items {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[0]
            increase = increase + 1
            tabItem.badgeValue = String(increase)
            
            let d = UserDefaults.standard
            
            d.set(increase, forKey: "sepetSayisi")
        }
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! filmHucre
        
        cell.filmAdiLabel.text = film.filmBaslik!
        cell.filmFiyatLabel.text = "\(film.filmFiyat!) TL"
        cell.filmImageView.image = UIImage(named: film.filmResimAdi!)
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        cell.layer.borderColor = UIColor.blue.cgColor
                cell.layer.borderWidth = 0.5
        return cell
    }
}


