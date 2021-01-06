//
//  FriendCollectionViewController.swift
//  vk-client
//
//  Created by Vict on 27.12.2020.
//

import UIKit

class FriendCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }
    public var friendImages: String?


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FriendCollectionViewCell{
    
            cell.friendFullImage.image = UIImage(named: friendImages ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
//    @IBAction func tapOnLike(_ sender: Liker) {
//        print(#function)
//        func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FriendCollectionViewCell{
//        
//                cell.likesCounter.text = "12"
//                return cell
//            }
//            return UICollectionViewCell()
//        }
//    }
    
}
