//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김지나 on 22/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Inventory {
    var list = [Beverage:Int]()
    
    var allBeverages: [Beverage] {
        return Array(list.keys)
    }
    
    mutating func generateBeverage() {
        let allBeverage = BeverageType.allCases
        for drink in allBeverage {
            self.list.updateValue(0, forKey: drink.beverage)
        }
    }
    
    // 음료 추가
    mutating func addBeverage(_ select: Beverage) {
        self.list[select] = self.list[select]! + 1
    }
    
    // 음료 차감
    mutating func subtract(_ select: Beverage) {
        print(list)
        self.list[select] = self.list[select]! - 1
    }
}
    
    


