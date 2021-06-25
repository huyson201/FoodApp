//
//  CartController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import UIKit
import FirebaseDatabase
class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource ,CartItemTableViewCellDelegate {
    
    //MARK: properties
    static var invoices = [Invoice]()
    var fireDB = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set edit button
        
        let leftButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditing(sender:)))
        self.navigationItem.leftBarButtonItem = leftButton
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        print(CartController.invoices.count)
        
    }
    @IBAction func buyBtn(_ sender: Any) {
        
        let bill = getBill()
     
            let billId = self.fireDB.child("bills").childByAutoId().key
            let ref = self.fireDB.child("bills").child(billId!)
            if bill != nil {
                    DispatchQueue.main.async {
                        DispatchQueue.main.async {
                            for i in 0..<bill!.invoices.count{
                                let invoice = bill?.invoices[i]
                                let food = bill?.invoices[i].food
                                let refInvoices = ref.child("invoices").child("\(i)")
                                DispatchQueue.main.async {
                                    refInvoices.child("foods").setValue(["foodDescription":food!.foodDescription,"foodId":food!.foodId,"foodImage": food!.foodImage,"foodName":food!.foodName,"foodPrice":(food?.foodPrice)!] as [String:Any])
                                    
                                    return
                                    
                                }
                                refInvoices.setValue(["quantity":invoice!.quantity,"selected":invoice!.isSelected] as [String:Any])
                                
                            }
                            return
                        }
                    ref.setValue(["id": billId!,"status": bill!.status,"sumPrice":bill!.sumPrice,"userId":bill!.userId] as [String:Any])
                    
                }
                
        }
        if let i = CartController.invoices.firstIndex(where: {$0.isSelected}){
            CartController.invoices.remove(at: i)
        }
        

        tableView.reloadData()
        

    }
    
    //MARK: - get bill
    func getBill() -> Bill? {
        var invoices = [Invoice]()
        
        for i in 0..<CartController.invoices.count{
            if CartController.invoices[i].isSelected {
                invoices.append(CartController.invoices[i])
            }
        }
        if(invoices.count>0){
            let bill = Bill(id: "",invoices: invoices,status: Bill.COMFIRM_STATUS_TAG,sumPrice: calSumPrice(),userId: UserDefaults.standard.getUserLogin()!.id)
            return bill
        }
        return nil
        
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartController.invoices.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        
        let invoice = CartController.invoices[indexPath.row]
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
            CartController.invoices[index.row].quantity += 1
            cell.lblQuantity.text = "\(CartController.invoices[index.row].quantity)"
            
            lblTotalPrice.text = "\(calSumPrice())"
        }
        
    }
    
    func onClickMinus(cell: CartItemTableViewCell) {
        if let index = tableView.indexPath(for: cell){
            if CartController.invoices[index.row].quantity > 1{
                CartController.invoices[index.row].quantity -= 1
                cell.lblQuantity.text = "\(CartController.invoices[index.row].quantity)"
                lblTotalPrice.text = "\(calSumPrice())"
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
            CartController.invoices.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            lblTotalPrice.text = "\(calSumPrice())"
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        CartController.invoices[indexPath.row].isSelected = !CartController.invoices[indexPath.row].isSelected
        tableView.reloadRows(at: [indexPath], with: .none)
        
        lblTotalPrice.text = "\(calSumPrice())"
    }
    
    
    
    //MARK: processing check all
    
    @IBAction func checkAll(_ sender: CheckBox) {
        for item in CartController.invoices{
            item.isSelected = sender.isCheck
        }
        
        tableView.reloadData()
        lblTotalPrice.text = "\(calSumPrice())"
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
    
    // calculate price when user selected item
    func calSumPrice()->Int{
        var price = 0
        for item in CartController.invoices{
            if item.isSelected{
                price += (item.quantity) * item.food.foodPrice
            }
        }
        return price
    }
    
    
    
    
    
}
