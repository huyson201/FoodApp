//
//  HomeController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/2/21.
//

import UIKit
import FirebaseDatabase

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate,UITableViewDataSource{
  
    //MARK: properties

    var categories = [Category]()
    var foods = [Food]()
    var fireDB = Database.database().reference()
    var currentCategory = 0
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: set delegate
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        
        // get categories form firebase
        fireDB.child("categories").observe(.value){
            snapshot in
                if snapshot.exists(){

                    let value = snapshot.value as? NSDictionary ?? [:]
    
                    for item in value{
                        print(item.value)
                        if let ctValue = item.value as?NSDictionary{
                            if let ctId = ctValue["categoryId"] as? String, let ctImg = ctValue["categoryImg"] as? String, let ctName = ctValue["categoryName"] as? String{
                                let category = Category(categoryId: ctId, categoryImg: ctImg , categoryName: ctName)
                                self.categories += [category]
                                self.categories = self.categories.sorted(by: {$0.categoryId < $1.categoryId})
                            }
                        }
                        
                    }
                   
                    self.categoryCollection.reloadData()


                }
            
            }
         
     
        // add food
            self.foods.append(Food(categoryId: "1", foodDescription: "thit bo xao thom ngon", foodId: "123", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 25000))
        
            self.foods.append(Food(categoryId: "1", foodDescription: "thit bo xao thom ngon", foodId: "123", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 25000))
        
            self.foods.append(Food(categoryId: "1", foodDescription: "thit bo xao thom ngon", foodId: "123", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 25000))
        
            self.foods.append(Food(categoryId: "1", foodDescription: "thit bo xao thom ngon", foodId: "123", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 25000))
      
    }
    
    

    
    //MARK: Uicollectionview delegate, datasource, flowlayout
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = IndexPath(row: currentCategory, section: 0)
        currentCategory = indexPath.row

    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        if indexPath.row == currentCategory{
            cell.ctName.textColor = .red
        }
        return cell
    }
    
            
    //MARK: uitableview delegate, datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let food = foods[indexPath.row]
        cell.lblFoodName.text = food.foodName
        cell.lblFoodPrice.text = "\(food.foodPrice)"
        cell.foodImg.image = UIImage(named: food.foodImage)
        return cell
    }
    
    
}


