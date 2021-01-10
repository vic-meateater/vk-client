//
//  FriendCollectionViewController.swift
//  vk-client
//
//  Created by Vic on 27.12.2020.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    public var friendImg: [String]!

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friendImg.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FriendCollectionViewCell{
            let friendImages = friendImg[indexPath.row]
            cell.friendFullImage.image = UIImage(named: friendImages)
            return cell

        }
        return UICollectionViewCell()
    }
    
}
