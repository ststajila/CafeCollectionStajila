//
//  ViewController.swift
//  CafeCollectionStajila
//
//  Created by STANISLAV STAJILA on 9/14/23.
//

import UIKit

class ViewController: UIViewController {

    var items: [String] = ["Cappuccino", "Latte", "Frappuccino", "Coffee", "Tea"]
    var prices: [Double] = [5.5, 4.5, 5.0, 3.5, 3.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< items.count{
            print("\(items[i]): $\(prices[i])")
        }
        
    }


   
}

