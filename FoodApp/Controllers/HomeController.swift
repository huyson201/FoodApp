//
//  HomeController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/2/21.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
   
  
    //MARK: properties

    var categories = [Category]()
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        categories.append(Category(categoryId: "1", categoryImg:"thit-bo-xao", categoryName: "Mon An 1"))
        
        categories.append(Category(categoryId: "1", categoryImg:"thit-bo-xao", categoryName: "Mon An 2"))
        
        categories.append(Category(categoryId: "1", categoryImg:"thit-bo-xao", categoryName: "Mon An 3"))
        
        categories.append(Category(categoryId: "1", categoryImg:"thit-bo-xao", categoryName: "Mon An 4"))
        
        categories.append(Category(categoryId: "1", categoryImg:"thit-bo-xao", categoryName: "Mon An 5"))
    
      
      
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

   
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    

}



