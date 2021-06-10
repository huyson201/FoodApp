//
//  CartController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource ,CartItemTableViewCellDelegate {
   
    //MARK: properties
    var invoices = [Invoice]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set edit button
        
        let leftButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditing(sender:)))
        self.navigationItem.leftBarButtonItem = leftButton
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let food = Food(categoryId: "1", foodDescription: "", foodId: "1", foodImage: "thit-bo-xao", foodName: "Thit Bo Xao", foodPrice: 50000)
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
        invoices += [Invoice(food: food)]
      
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return invoices.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell

        let invoice = invoices[indexPath.row]
        cell.setInvoice(invoice: invoice)
        cell.delegate = self
        cell.delegate = self
       
        // check selected
        if invoice.isSelected{
            cell.backgroundColor = .systemGray4
            cell.isSelected = true
        }else{
            cell.backgroundColor = .systemBackground
            cell.isSelected = false
        }
        
        return cell
    }
    
    //MARK: processing cart item table view delegate
    func onClickPlus(cell: CartItemTableViewCell) {

        if let index = tableView.indexPath(for: cell){
            invoices[index.row].quantity += 1
            cell.lblQuantity.text = "\(invoices[index.row].quantity)"
        }

    }
    
    func onClickMinus(cell: CartItemTableViewCell) {
        if let index = tableView.indexPath(for: cell){
            if invoices[index.row].quantity > 1{
                invoices[index.row].quantity -= 1
                cell.lblQuantity.text = "\(invoices[index.row].quantity)"
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1{
            return true
        }
        return false
    }
    */

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            invoices.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        invoices[indexPath.row].isSelected = !invoices[indexPath.row].isSelected
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    //MARK: processing check all
    
    @IBAction func checkAll(_ sender: CheckBox) {
        for item in invoices{
            item.isSelected = sender.isCheck
        }
        
        tableView.reloadData()
    }
    
    
    // MARK: processing edit button of navigaionbar
    @objc private func showEditing(sender:UIBarButtonItem){
        if tableView.isEditing == true{
            tableView.isEditing = false
            self.navigationItem.leftBarButtonItem?.title = "Edit"
        }else{
            tableView.isEditing = true
            self.navigationItem.leftBarButtonItem?.title = "Done"
        }
    }
}
