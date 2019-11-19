//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김지나 on 21/06/2019.
//  Copyright © 2019 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: Property
    private var vending = VendingMachine()
    private var tag = 0
    
    // MARK: IBOutlet
    @IBOutlet weak var beverageCollection: UICollectionView!
    @IBOutlet weak var currentBalance: UILabel!
    
    // MARK: View Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageCollection.delegate = self
        beverageCollection.dataSource = self
        
        vending.beverageListUp()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pressedBuyBtn(_:)), name: .buyButton, object: nil)
        //currentBalance.text = UserDefaults.standard.string(forKey: "currentBalance")
    }
    
    // MARK: IBAction
    @IBAction func insertMoney(_ sender: UIButton) {
        let priceStr = sender.titleLabel?.text
        let price = priceStr!.components(separatedBy: [",","₩"," "]).joined()
        vending.insertMoney(Int(price)!)
        currentBalance.text = "잔액 : " + String(vending.currentBalance()) + " ₩"
        //UserDefaults.standard.set(currentBalance.text, forKey: "currentBalance")
    }
    
    @IBAction func beverageAdd(_ sender: UIButton) {
        let beverage = vending.kindOfBeverage()
        let selectBeverage = beverage[sender.tag]
        vending.addBeverage(selectBeverage)
        reloadBeverageCell(at: sender.tag)
    }
    
    @IBAction func beverageBuy(_ sender: UIButton) {
        tag = sender.tag
        NotificationCenter.default.post(name: .buyButton, object: nil)
    }
    
    // MARK: objc
    @objc func pressedBuyBtn(_ notification: Notification) {
        let beverage = vending.kindOfBeverage()
        let selectBeverage = beverage[tag]
        vending.buyBeverage(selectBeverage)
        reloadBeverageCell(at: tag)
        currentBalance.text = "잔액 : " + String(vending.currentBalance()) + " ₩"
    }

    // MARK: collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vending.kindOfBeverage().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageCell", for: indexPath) as! BeverageCellCV
        let beverage = vending.kindOfBeverage()[indexPath.item]
        cell.beverageImage.image = beverage.image
        cell.beverageCount.text = "\(vending.stockOfBeverage()[beverage]!)개"
        cell.addButton.tag = indexPath.item
        cell.buyButton.tag = indexPath.item
        return cell
    }
    
    private func reloadBeverageCell(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        beverageCollection.reloadItems(at: [indexPath])
    }
}


// MARK: CollectionViewCell
class BeverageCellCV: UICollectionViewCell {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var beverageImage: UIImageView!
    @IBOutlet weak var beverageCount: UILabel!
}
