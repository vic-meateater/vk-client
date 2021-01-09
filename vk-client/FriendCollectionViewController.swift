//
//  FriendCollectionViewController.swift
//  vk-client
//
//  Created by Vict on 27.12.2020.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    public var friendImages: String?


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FriendCollectionViewCell{
    
            cell.friendFullImage.image = UIImage(named: friendImages ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
}
