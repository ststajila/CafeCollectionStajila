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
    var items: [String] = ["Coffee", "Cappuccino", "Frappuccino", "Latte", "Tea"]
    var prices: [Double] = [3, 3.99, 4.5, 5.49, 2.49]
    var menu: [String: Double] = [:]
    var shopingCart: [String: Double] = [:]
    
    @IBOutlet weak var sortByNameOutlet: UIButton!
    
    @IBOutlet weak var sortByPriceOutlet: UIButton!
    
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
            menuOutlet.text = "\(menuOutlet.text!) \n\(items[i]): $\(String(format: "%.2f", prices[i]))"
            
            sortByNameOutlet.backgroundColor = UIColor.gray
            sortByNameOutlet.titleLabel?.textColor = UIColor.white
            sortByPriceOutlet.backgroundColor = UIColor.gray
            
            
        }
        
    }
    
    @IBAction func addingToCartFunction(_ sender: Any) {
        
        if let order = foodOrderInput.text {
            var index: Int?
            if checkItem(name: order, array: items) {
                if isInCart(item: order, cart: shopingCart){
                    if let q = Int(quantityInputOutlet.text!){
                        if q > 0{
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
                            
                            totalOutlet.text = "Total: $\(String(format: "%.2f", total))"
                            statusCheck.backgroundColor = UIColor.green
                            statusCheck.text = "You are good to continue shoping"
                            foodOrderInput.text = ""
                            quantityInputOutlet.text = ""
                    } else{
                        statusCheck.backgroundColor = UIColor.red
                        statusCheck.text = "Use only whole numbers > or = 0"
                    }
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
    
    func indexOfItem(name: String, array: [String]) -> Int{
        for i in 0 ..< array.count{
            if array[i] == name{
                return i;
            }
        }
        return -1;
    }
    
    
    
    func isInCart(item: String, cart: [String: Double]) -> Bool{
        for items in cart{
            if items.key == item{
                return false;
            }
        }
        return true;
    }
    
    func adminLogin(password: String) -> Bool{
        if password == "pony"{
            return true
        }
        return false
    }
    
    @IBAction func addItemAction(_ sender: Any) {
        if adminLogin(password: passwordOutlet.text!){
            
            if checkItem(name: itemRegister.text!, array: items){
                for item in items{
                    print("\(item) \n")
                }
                statusCheck.backgroundColor = UIColor.red
                statusCheck.text = "The item is already in the menu, you cannot add it!"
            }
            else{
                
                if let i = itemRegister.text{
                    if i != ""{
                        if let p = Double(priceRegister.text!){
                            if p > 0 {
                                items.append(i)
                                prices.append(p)
                                menuOutlet.text = ""
                                menuOutlet.text = "Menu: "
                                
                                for i in 0 ..< items.count{
                                    menuOutlet.text = "\(menuOutlet.text!) \n\(items[i]): $\(String(format: "%.2f", prices[i]))"                           }
                                statusCheck.backgroundColor = UIColor.green
                                statusCheck.text = "New item is added to the menu!"
                                
                                passwordOutlet.text = ""
                                itemRegister.text = ""
                                priceRegister.text = ""
                                
                                sortByNameOutlet.backgroundColor = UIColor.gray
                                
                                sortByPriceOutlet.backgroundColor = UIColor.gray
                                
                            } else {
                                statusCheck.backgroundColor = UIColor.red
                                statusCheck.text = "The price cannot = 0 or be negative!"
                            }
                            
                        } else {
                            statusCheck.backgroundColor = UIColor.red
                            statusCheck.text = "The price of the item must be a number!"
                        }
                        
                    } else{
                        statusCheck.backgroundColor = UIColor.red
                        statusCheck.text = "Enter the item you want to add"
                        
                    }
                }
            }
        } else{
                    statusCheck.backgroundColor = UIColor.red
                    statusCheck.text = "Invalid admin password"
                }
                
        }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        
        if adminLogin(password: passwordOutlet.text!){
            
            if itemRegister.text! != ""{
                if checkItem(name: itemRegister.text!, array: items) {
                    
                    if let i = itemRegister.text{
                        
                        var index = indexOfItem(name: i, array: items)
                        items.remove(at: index)
                        prices.remove(at: index)
                        
                        menuOutlet.text = ""
                        menuOutlet.text = "Menu: "
                        
                        for i in 0 ..< items.count{
                            menuOutlet.text = "\(menuOutlet.text!) \n\(items[i]): $\(String(format: "%.2f", prices[i]))"                           }
                        
                        statusCheck.backgroundColor = UIColor.green
                        statusCheck.text = "The item was successfully deleted!"
                        
                        passwordOutlet.text = ""
                        itemRegister.text = ""
                        priceRegister.text = ""
                        
                        sortByNameOutlet.backgroundColor = UIColor.gray
                        
                        sortByPriceOutlet.backgroundColor = UIColor.gray
                        
                    }
                } else{
                    
                    statusCheck.backgroundColor = UIColor.red
                    statusCheck.text = "The item is not in the menu, you cannot delete it!"
                }
            } else{
                statusCheck.backgroundColor = UIColor.red
                statusCheck.text = "Enter the item you want to delete"
            }
        }else{
                    statusCheck.backgroundColor = UIColor.red
                    statusCheck.text = "Invalid admin password"
                }
    }
    
    
    @IBAction func sortByNameAction(_ sender: Any) {
        
        menu = [:]
        for i in 0 ..< items.count{
            menu["\(items[i])"] = prices[i]
            print("\n\(items[i]): \(prices[i])")
        }
        
        menuOutlet.text = ""
        menuOutlet.text = "Menu: "
        
        for item in menu.sorted(by: <){
            menuOutlet.text = "\(menuOutlet.text!)\n\(item.key): $\(String(format: "%.2f", item.value))"
            sortByPriceOutlet.backgroundColor = UIColor.gray
            sortByNameOutlet.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func sortByPriceAction(_ sender: Any) {
        menu = [:]
        for i in 0 ..< items.count{
            menu["\(items[i])"] = prices[i]
            print("\n\(items[i]): \(prices[i])")
        }
        
        menuOutlet.text = ""
        menuOutlet.text = "Menu: "
        
        for item in menu.sorted(by: {$0.value < $1.value}){
            menuOutlet.text = "\(menuOutlet.text!)\n\(item.key): $\(String(format: "%.2f", item.value))"
            sortByNameOutlet.backgroundColor = UIColor.gray
            sortByPriceOutlet.backgroundColor = UIColor.blue
        }
    }
    
    
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                foodOrderInput.resignFirstResponder()
                quantityInputOutlet.resignFirstResponder()
                passwordOutlet.resignFirstResponder()
                itemRegister.resignFirstResponder()
                priceRegister.resignFirstResponder()
                return true
            }
    }
