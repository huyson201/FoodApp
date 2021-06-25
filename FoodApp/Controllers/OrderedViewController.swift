//
//  OrderedViewController.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/24/21.
//

import UIKit
import FirebaseDatabase
class OrderedViewController: UIViewController {
    var bills = [Bill]()
    var fireDB = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    var num = [1,3,2,5]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
     
//        fireDB.child("bills").observe(.value){
//            snapshot in
//                if snapshot.exists(){
//
//                    let value = snapshot.value as? NSDictionary ?? [:]
//
//                    for item in value{
//                        if let mBill = item.value as?NSDictionary{
//                            let bill = Bill()
//
//
//                        }
//                    }
//
//
//
//
//                }
//
//            }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension OrderedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderedTableViewCell") as? OrderedTableViewCell else{
            return UITableViewCell()
        }
        return cell
        
    }



}
