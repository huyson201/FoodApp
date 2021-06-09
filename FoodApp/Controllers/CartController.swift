//
//  CartController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import UIKit

class CartController: UITableViewController, CartItemTableViewCellDelegate {
   
    //MARK: properties
    var invoices = [Invoice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let food = Food(categoryId: "1", foodDescription: "", foodId: "1", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 50000)
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("row \(invoices.count)")
        return invoices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        
        let invoice = invoices[indexPath.row]
        cell.setInvoice(invoice: invoice)
        cell.indexPath = indexPath
        cell.delegate = self
        cell.delegate = self
        
        return cell
    }
    
    //MARK: processing cart item table view delegate
    func onClickPlus(cell: CartItemTableViewCell) {
        if let index = cell.indexPath{
            invoices[index.row].quantity += 1
            cell.lblQuantity.text = "\(invoices[index.row].quantity)"
        }
    }
    
    func onClickMinus(cell: CartItemTableViewCell) {
        if let index = cell.indexPath{
            if invoices[index.row].quantity > 1{
                invoices[index.row].quantity -= 1
                cell.lblQuantity.text = "\(invoices[index.row].quantity)"
            }
      
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            invoices.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
