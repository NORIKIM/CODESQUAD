//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class Coffee: Beverage {
    static let standardTemp = 65
    private let temperature: Int
    
    init(temperature: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date(), image: UIImage) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture), image: image)
    }
    
    func isHot() -> Bool {
        return temperature > Coffee.standardTemp
    }
}

class Kanu: Coffee {
    private let kindOfKanu: String
    
    init(kindOfKanu: String, temperature: Int, brand: String, volume: Int, price: Int, productName: String) {
        self.kindOfKanu = kindOfKanu
        super.init(temperature: temperature, brand: brand, volume: volume, price: price, productName: productName, image: UIImage(named: "카누아이스블랜드.jpg")!)
    }
}
class TOP: Coffee {
    private let flavor: String
    
    init(flavor: String, temperature: Int, brand: String, volume: Int, price: Int, productName: String) {
        self.flavor = flavor
        super.init(temperature: temperature, brand: brand, volume: volume, price: price, productName: productName, image: UIImage(named: "TOP라떼.jpeg")!)
    }
}
