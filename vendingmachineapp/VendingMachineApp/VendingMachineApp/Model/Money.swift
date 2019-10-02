//
//  Money.swift
//  VendingMachineApp
//
//  Created by 김지나 on 01/10/2019.
//  Copyright © 2019 김지나. All rights reserved.
//

import Foundation

struct Money {
    private var balance = 0
    
    // 잔액 증가
    mutating func insert(money: Int) {
        self.balance = balance + money
    }
    // 잔액 감소
    mutating func deductBalance(selectBeveragePrice: Int) {
        self.balance = balance - selectBeveragePrice
    }
    
    // 현재 잔액 리턴
    func currentBalance() -> Int {
        return self.balance
    }
}
