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
    var oldFoods = [Food]()
    var foods = [Food]()
    var fireDB = Database.database().reference()
   
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var currentCategory = 0
    
    let CATEGORY_ALL_FOOD  = "all"
    
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
        
        fireDB.child("foods").observe(.value){
            snapshot in
                if snapshot.exists(){

                    let value = snapshot.value as? NSDictionary ?? [:]
    
                    for item in value{
                        if let mFood = item.value as?NSDictionary{
                            if let categoryId = mFood["categoryId"] as? String,
                               let foodImg = mFood["foodImage"] as? String,
                               let foodName = mFood["foodName"] as? String,
                               let foodId = mFood["foodId"] as? String,
                               let foodPrice = mFood["foodPrice"] as? Int,
                               let foodDesc = mFood["foodDescription"] as? String{
                                let food = Food(categoryId: categoryId, foodDescription: foodDesc, foodId: foodId, foodImage: foodImg, foodName: foodName, foodPrice: foodPrice)
                                self.oldFoods += [food]
                            }
                        }
                        
                    }
                    self.foods = self.oldFoods
                    self.menuTableView.reloadData()


                }
            
            }
            
      
    }
    
    

    
    //MARK: Uicollectionview delegate, datasource, flowlayout
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let currentCell = collectionView.cellForItem(at: IndexPath(row: currentCategory, section: 0)) as? CategoryCollectionViewCell{
            currentCell.ctName.textColor = .black
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell{
            currentCategory = indexPath.row
            cell.ctName.textColor = .red
            
            let category = categories[indexPath.row]
            foods = getfoodsByCategoryId(ctId: category.categoryId)
            self.menuTableView.reloadData()
        }
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    
            
    //MARK: uitableview delegate, datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let food = foods[indexPath.row]
        cell.setMenuItem(food: food)
        return cell
    }
    
    //get foods by category
    
    func getfoodsByCategoryId(ctId:String) -> [Food]{
        var foods = [Food]()
        for food in self.oldFoods{
            if food.categoryId == ctId{
                foods += [food]
            }
        }
        return foods
        
    }
    
}


