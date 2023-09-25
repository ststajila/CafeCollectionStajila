//
//  ViewController.swift
//  CafeCollectionStajila
//
//  Created by STANISLAV STAJILA on 9/14/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var itemRegister: UITextField!
    
    @IBOutlet weak var priceRegister: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        foodOrderInput.delegate
        quantityInputOutlet.delegate
        passwordOutlet.delegate
        itemRegister.delegate
        priceRegister.delegate
        
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
                if isInCart(item: order, cart: shopingCart){
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
                } else{
                    statusCheck.backgroundColor = UIColor.red
                    statusCheck.text = "The item is already in the cart!"
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
    
    func isInCart(item: String, cart: [String: Double]) -> Bool{
        for items in cart{
            if items.key == item{
                return false;
            }
        }
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        foodOrderInput.resignFirstResponder()
        quantityInputOutlet.resignFirstResponder()
        passwordOutlet.resignFirstResponder()
        itemRegister.resignFirstResponder()
        priceRegister.resignFirstResponder()
        return true
    }
    
    func adminLogin(password: String) -> Bool{
        if password == "pony"{
            return true
        }
        return false
    }
    
    @IBAction func additemAction(_ sender: Any) {
        if adminLogin(password: passwordOutlet.text!){
            
            if checkItem(name: itemRegister.text!, array: items){
                
                statusCheck.backgroundColor = UIColor.red
                statusCheck.text = "The item is already in the menu, you cannot add it!"
            }
            else{
                
//                if itemRegister.text!.c
                items.append(itemRegister.text!)
                statusCheck.backgroundColor = UIColor.green
                statusCheck.text = "New item is added to the menu!"
            }
                
            
        }
        
    }
}
