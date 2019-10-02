//
//  Soda.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class Soda: Beverage {
    private let calorie: Int
    
    init(calorie: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date(), image: UIImage) {
        self.calorie = calorie
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture), image: image)
    }
    
    func isHigh() -> Bool {
        return calorie > 400
    }
}


class Cola: Soda {
    enum company: String {
        case pepsi = "pepsi"
        case cocacola = "cocacola"
    }
    init(calorie: Int, brand: company, volume: Int, price: Int, productName: String) {
        super.init(calorie: calorie, brand: brand.rawValue, volume: volume, price: price, productName: productName, image: UIImage(named: "콜라.jpeg")!)
    }
}
class Sider: Soda {
    private let carbonicAcidContent: Double
    
    init(carbonicAcidContent: Double, calorie: Int, brand: String, volume: Int, price: Int, productName: String) {
        self.carbonicAcidContent = carbonicAcidContent
        super.init(calorie: calorie, brand: brand, volume: volume, price: price, productName: productName, image: UIImage(named: "스프라이트.jpg")!)
    }
}
