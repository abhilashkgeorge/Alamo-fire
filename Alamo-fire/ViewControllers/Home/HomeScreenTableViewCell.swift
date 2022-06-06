//
//  HomeScreenTableViewCell.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 30/05/22.
//

import UIKit

protocol NavigationDelegate: AnyObject {
    func didSelectItem(Address: String, phoneNumber: String, mailId: String)
}
class HomeScreenTableViewCell: UITableViewCell {
    
    weak var delegate: NavigationDelegate?
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
            self.firstCV.showsHorizontalScrollIndicator = false
            self.firstCV.delegate = self
            self.firstCV.dataSource = self
            self.firstCV.reloadData()
            self.firstCV.layoutIfNeeded()
            flowLayout.itemSize = CGSize(width: 382, height: 215)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.scrollDirection = .horizontal
                
            } else if indexPath == 1 {
                self.secondCV.setCollectionViewLayout(flowLayout, animated: false)
                self.secondCV.showsHorizontalScrollIndicator = false
                self.secondCV.delegate = self
                self.secondCV.dataSource = self
                self.secondCV.reloadData()
                self.secondCV.layoutIfNeeded()
                flowLayout.itemSize = CGSize(width: 350, height: 110)
                flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 20)
                flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 2 {
            self.thirdCV.setCollectionViewLayout(flowLayout, animated: false)
            self.thirdCV.showsHorizontalScrollIndicator = false
            self.thirdCV.delegate = self
            self.thirdCV.dataSource = self
            self.thirdCV.reloadData()
            self.thirdCV.layoutIfNeeded()
            flowLayout.itemSize = CGSize(width: contentView.bounds.width/3 - 20, height: contentView.bounds.height/3 - 20)
            flowLayout.minimumInteritemSpacing = 11.5
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
           flowLayout.minimumLineSpacing = 12.5
            thirdCV.collectionViewLayout = flowLayout
            

        } else  if indexPath == 3{
            self.fourthCV.setCollectionViewLayout(flowLayout, animated: false)
            self.fourthCV.showsHorizontalScrollIndicator = false
            self.fourthCV.delegate = self
            self.fourthCV.dataSource = self
            self.fourthCV.reloadData()
            self.fourthCV.layoutIfNeeded()
            flowLayout.itemSize = CGSize(width: 351, height: 120)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16
                                                   , bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
        } else {
            self.fifthCV.setCollectionViewLayout(flowLayout, animated: false)
            self.fifthCV.showsHorizontalScrollIndicator = false
            self.fifthCV.delegate = self
            self.fifthCV.dataSource = self
            self.fifthCV.reloadData()
            self.fifthCV.layoutIfNeeded()
            flowLayout.itemSize = CGSize(width: bounds.width/2 - 40 , height: 46)
            flowLayout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16)
           // flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 10
            flowLayout.minimumInteritemSpacing = 0
        }
    }
    
    @IBAction func fifthVCbtnTapped(_ sender: Any) {
        print("hi there")
        delegate?.didSelectItem(Address: "hi", phoneNumber: "ji", mailId: "hi")
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
            firstPageControl.numberOfPages = 4
            return 4
        } else if collectionView == thirdCV {
            return 8
        }else if collectionView == fourthCV {
            secondPageControl.numberOfPages = 4
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
            firstPageControl.currentPage = 0
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
            secondPageControl.currentPage = 0
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthCV", for: indexPath) as! HomeScreenCollectionViewCell

            cell.contentView.layer.cornerRadius = 15.0
            cell.layer.cornerRadius = 15.0
            return cell
        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fifthCV", for: indexPath) as! HomeScreenCollectionViewCell
            if indexPath.row == 4{
                cell.fifthCVButton.setTitle("Contact Us", for: .normal)
                cell.fifthCVButton.setImage(UIImage(named:  UIImage.AssetImages.headset.rawValue), for: .normal)
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("HIhihihihihih")
        if collectionView == fifthCV {
            print("HIhihihihihih")
        
            if indexPath.row == 4 {
               
        }
    }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.firstPageControl?.currentPage = Int(roundedIndex)
        self.secondPageControl?.currentPage = Int(roundedIndex)
    }
}
