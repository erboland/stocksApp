//
//  MainTableViewController.swift
//  stocks
//
//  Created by Ербол Каршыга on 4/18/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class MyStocksTableViewController: UITableViewController {

    var stocks=[Stock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "Assets"
        print("ok")
        loadingStocks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func loadingStocks () {
        for i in 1...10 {
            stocks.append(Stock(stockName: "Name \(i)", shares: i, growth: i))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Stock", for: indexPath) as? StockTableViewCell else {
            fatalError("stocksix")
        }
        cell.nameLabel.text = stocks[indexPath.row].stockName
        cell.sharesLabel.text = "\(stocks[indexPath.row].shares!) shares"
        cell.growthLabel.text = "\(stocks[indexPath.row].growth!)"

    print("stocks")
        return cell
    }
    



    

    
     //MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        return
    }
    

}

struct Stock {
    var stockName: String!
    var shares: Int!
    var growth: Int!
}
