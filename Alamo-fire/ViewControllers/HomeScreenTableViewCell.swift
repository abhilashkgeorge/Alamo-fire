//
//  HomeScreenTableViewCell.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 30/05/22.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstCV: UICollectionView!
    @IBOutlet weak var secondCV: UICollectionView!
    @IBOutlet weak var thirdCV: UICollectionView!
    @IBOutlet weak var fourthCV: UICollectionView!
    @IBOutlet weak var fifthCV: UICollectionView!

    @IBOutlet weak var firstPageControl: UIPageControl!

    @IBOutlet weak var secondPageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCells(indexPath: Int) {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        if indexPath == 0 {
            self.firstCV.setCollectionViewLayout(flowLayout, animated: false)
            self.firstCV.delegate = self
            self.firstCV.dataSource = self
            flowLayout.itemSize = CGSize(width: 382, height: 215)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
                
            } else if indexPath == 1 {
                self.secondCV.setCollectionViewLayout(flowLayout, animated: false)
                self.secondCV.delegate = self
                self.secondCV.dataSource = self
                flowLayout.itemSize = CGSize(width: 350, height: 110)
                flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
                flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 2 {
            self.thirdCV.setCollectionViewLayout(flowLayout, animated: false)
            self.thirdCV.delegate = self
            self.thirdCV.dataSource = self
            flowLayout.itemSize = CGSize(width: 119, height: 119)
            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0)
            flowLayout.scrollDirection = .horizontal
            thirdCV.collectionViewLayout = flowLayout
            

        } else  if indexPath == 3{
            self.fourthCV.setCollectionViewLayout(flowLayout, animated: false)
            self.fourthCV.delegate = self
            self.fourthCV.dataSource = self
            flowLayout.itemSize = CGSize(width: 351, height: 120)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16
                                                   , bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
        } else {
            self.fifthCV.setCollectionViewLayout(flowLayout, animated: false)
            self.fifthCV.delegate = self
            self.fifthCV.dataSource = self
            flowLayout.itemSize = CGSize(width: 185, height: 46)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        firstPageControl.currentPage = indexPath.row
//        secondPageControl.currentPage = indexPath.row
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension HomeScreenTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCV {
            return 2
        } else if collectionView == secondCV {
            return 4
        } else if collectionView == thirdCV {
            return 8
        }else if collectionView == fourthCV {
            return 4
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == firstCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCV", for: indexPath) as! HomeScreenCollectionViewCell
            return cell
        } else if collectionView == secondCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCV", for: indexPath) as! HomeScreenCollectionViewCell
            cell.contentView.backgroundColor = .white
            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 5.0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 15.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.borderShadowColour.cgColor
            cell.contentView.layer.masksToBounds = true
            cell.layer.shadowColor = UIColor.white.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0.0)
            cell.layer.shadowRadius = 6.0
            cell.layer.shadowOpacity = 0.6
            cell.layer.cornerRadius = 15.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

            return cell
        }
        else if collectionView == thirdCV {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCV", for: indexPath) as! HomeScreenCollectionViewCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdPartCV", for: indexPath) as! HomeScreenCollectionViewCell
                return cell
            }

            

        } else if collectionView == fourthCV {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthCV", for: indexPath) as! HomeScreenCollectionViewCell
            cell.contentView.layer.cornerRadius = 15.0
            cell.layer.cornerRadius = 15.0
            return cell
        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fifthCV", for: indexPath) as! HomeScreenCollectionViewCell
            return cell
        }
        
    }
}
