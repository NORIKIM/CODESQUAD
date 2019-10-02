//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let buyButton = NSNotification.Name(rawValue: "buyButton")
}

struct VendingMachine {
    private var inven = Inventory()
    private var money = Money()
    private var purchase = [Beverage]()
    
    mutating func beverageListUp() {
        inven.generateBeverage()
    }
    
    func kindOfBeverage() -> [Beverage] {
        return inven.allBeverages
    }
    
    func stockOfBeverage() -> [Beverage:Int] {
        return inven.list
    }
    
    func currentBalance() -> Int {
        return money.currentBalance()
    }
    
    mutating func insertMoney(_ priceBtn: Int) {
        if priceBtn == 0 {
             money.insert(money: 1000)
        } else {
            money.insert(money: 5000)
        }
    }
    
    mutating func addBeverage(_ select: Beverage) {
        inven.addBeverage(select)
    }
    
    mutating func buyBeverage(_ select: Beverage) {
        inven.subtract(select)
        money.deductBalance(selectBeveragePrice: select.beveragePrice)
        self.purchase.append(select)
    }
    
}

