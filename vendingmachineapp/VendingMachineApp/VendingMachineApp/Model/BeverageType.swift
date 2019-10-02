//
//  BeverageType.swift
//  VendingMachineApp
//
//  Created by 김지나 on 01/10/2019.
//  Copyright © 2019 김지나. All rights reserved.
//

import Foundation

enum BeverageType: CaseIterable {
    case strawberry
    case chocolate
    case cola
    case sprite
    case kanuIce
    case TOPLatte
    
    var beverage: Beverage {
        switch self {
        case .strawberry :
            return Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유")
        case .chocolate :
            return Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유")
        case .cola :
            return Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라")
        case .sprite :
            return Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트")
        case .kanuIce :
            return Kanu(kindOfKanu: "아이스블랜드", temperature: -3, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드")
        case .TOPLatte :
            return TOP(flavor: "라떼", temperature: 68, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")
        }
    }
    
}
