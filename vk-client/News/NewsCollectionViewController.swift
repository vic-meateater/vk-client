//
//  NewsCollectionViewController.swift
//  vk-client
//
//  Created by Vict on 18.01.2021.
//

import UIKit

//private let reuseIdentifier = "Cell"

class NewsCollectionViewController: UICollectionViewController {
    let newsDataSource = NewsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(NewsCollectionViewCell.nib, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let newsValues = newsDataSource.getNews()
        return newsValues.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell {
            let newsValues = newsDataSource.getNews()
            cell.set(newsValues: newsValues[indexPath.row])
    
            return cell
        }
        return UICollectionViewCell()
    }

}
