//
//  ViewController.swift
//  CafeCollectionStajila
//
//  Created by STANISLAV STAJILA on 9/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuOutlet: UILabel!
    var items: [String] = ["Cappuccino", "Latte", "Frappuccino", "Coffee", "Tea"]
    var prices: [Double] = [5.50, 4.50, 5.00, 3.50, 3.00]
    var shopingCart: [String: Double] = [:]
    @IBOutlet weak var foodOrderInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< items.count{
            menuOutlet.text! += "\(items[i]): $\(prices[i])\n"
        }
    }
    
    @IBAction func addingToCartFunction(_ sender: Any) {
        
        if checkItem(foodOrderInput.text, items) {
            
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

