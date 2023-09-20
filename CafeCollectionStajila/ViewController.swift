//
//  ViewController.swift
//  CafeCollectionStajila
//
//  Created by STANISLAV STAJILA on 9/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusCheck: UILabel!
    @IBOutlet weak var menuOutlet: UITextView!
    @IBOutlet weak var cartOutlet: UITextView!
    @IBOutlet weak var totalOutlet: UILabel!
    var items: [String] = ["Cappuccino", "Latte", "Frappuccino", "Coffee", "Tea"]
    var prices: [Double] = [5.50, 4.50, 5.00, 3.50, 3.00]
    var shopingCart: [String: Double] = [:]
    
    @IBOutlet weak var foodOrderInput: UITextField!
    @IBOutlet weak var quantityInputOutlet: UITextField!
    var total: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        statusCheck.backgroundColor = UIColor.green
        statusCheck.text = "You are good to continue shoping"
        menuOutlet.text = "Menu: "
        for i in 0 ..< items.count{
            menuOutlet.text = "\(menuOutlet.text!) \n\(items[i]): $\(prices[i])"
        }
        
    }
    
    @IBAction func addingToCartFunction(_ sender: Any) {
        
        if let order = foodOrderInput.text {
            var index: Int?
            if checkItem(name: order, array: items) {
                if let q = Int(quantityInputOutlet.text!){
                for i in 0 ..< items.count{
                    if order == items[i]{
                        index = i;
                        total += prices[i] * Double(q)
                    }
                }
                
                    shopingCart[order] = prices[index!]
                    cartOutlet.text = ""
                    for items in shopingCart {
                        cartOutlet.text += "\(items.key) \n"
                    }
                    
                    totalOutlet.text = "Total: $\(total)"
                    statusCheck.backgroundColor = UIColor.green
                    statusCheck.text = "You are good to continue shoping"
                } else{
                    statusCheck.backgroundColor = UIColor.red
                    statusCheck.text = "Use only whole numbers in the quantity field"
                }
                
            } else {
                statusCheck.backgroundColor = UIColor.red
                statusCheck.text = "The item is not in the Menu"
                
            }
        }
    }
    
    func checkItem(name: String, array: [String]) -> Bool{
        for item in array{
            if name == item{
                return true;
            }
        }
        return false;
    }
    

  
   
}

