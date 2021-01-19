//
//  NewsCustomViewController.swift
//  vk-client
//
//  Created by Vict on 18.01.2021.
//

import UIKit

class NewsCustomViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(NewsCollectionViewCell.nib, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell{
            
            //cell.config(news: "asdf")
            
            return cell
        }
        return UICollectionViewCell()
    }

}
