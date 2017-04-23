//
//  ViewController.swift
//  stocks
//
//  Created by Robert Kim on 4/18/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var containerView: UIView!
    var priceLabel: UILabel!
    var sharesLabel: UILabel!
    var graphicView: UIView!
    var newsTableView: UITableView!
    var statsTableView: UITableView!
    var ordersTableView: UITableView!
    var mainScrollView: UIScrollView!
    var newsArray = [News]()
    var statsArray = [String]()
    var ordersArray = [Order]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("red")
        loading()
        downloadElements()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainScrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        containerView.bounds = CGRect(x: 0,y: 0, width: mainScrollView.contentSize.width, height:mainScrollView.contentSize.height)
        print(containerView.bounds)
        
    }
    
    func downloadElements () {
        for item in 1...4 {
            newsArray.append(News(text: "\(item)", date: "\(item*5)"))
        }
        for order in 1...4{
            ordersArray.append(Order(text: "\(order)", date: "\(order*2)", price: "\(order*3)", shares: "\(order*4)"))
        }
    }

    func loading() {
        let buttonOne = UIButton(type: .system) as UIButton
        buttonOne.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        buttonOne.backgroundColor = .green
        buttonOne.setTitle("test", for: .normal)
        buttonOne.addTarget(self, action: Selector(("buttonAction1x1:")), for: UIControlEvents.touchUpInside)
        //Mark: NEED FOR SCROLL VIEW
        self.mainScrollView = UIScrollView()
        self.mainScrollView.delegate = self
        self.mainScrollView.contentSize = CGSize(width: self.view.bounds.width, height: 2050)
        self.mainScrollView.bounces = false
        
        containerView = UIView()
        self.mainScrollView.addSubview(containerView)
        mainScrollView.addSubview(buttonOne)
        view.addSubview(mainScrollView)
        
        print(view.center.x)
        let width = view.bounds.width
        priceLabel = UILabel(frame: CGRect(x: 0, y: 20.0, width:width, height: 70.0))
        priceLabel.text = "LOLOLOLOLOLO"
        priceLabel.textColor = .black
        priceLabel.textAlignment = .center
        priceLabel.font.withSize(70)
        sharesLabel = UILabel(frame: CGRect(x: 0, y: priceLabel.frame.maxY, width: width, height: 30.0))
        sharesLabel.text="shares"
        sharesLabel.textColor = .black
        sharesLabel.textAlignment = .center
        
        graphicView = UIView(frame: CGRect(x: 0, y: sharesLabel.frame.maxY+10.0, width: width, height: 300.0))
        graphicView.backgroundColor = .green
        
        newsTableView = UITableView(frame: CGRect(x: 0, y: graphicView.frame.maxY+175.0, width: width, height: 400))
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "news")
        newsTableView.tag = 1
        newsTableView.backgroundColor = .black
        newsTableView.rowHeight = 100
        


        
        
        
        statsTableView = UITableView(frame: CGRect(x: 0, y: newsTableView.frame.maxY+20.0, width: width, height: 500))
        statsTableView.delegate = self
        statsTableView.dataSource = self
        statsTableView.register(StatsTableViewCell.self, forCellReuseIdentifier: "stat")
        statsTableView.tag = 2
        statsTableView.rowHeight = 100
        
        
        
        
        
        ordersTableView = UITableView(frame: CGRect(x: 0, y: statsTableView.frame.maxY+20.0, width: width, height: 400))
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        ordersTableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: "order")
        ordersTableView.tag = 3
        ordersTableView.rowHeight = 100
        

        
        mainScrollView.addSubview(priceLabel)
        mainScrollView.addSubview(sharesLabel)
        mainScrollView.addSubview(graphicView)
        mainScrollView.addSubview(newsTableView)
        mainScrollView.addSubview(statsTableView)
        mainScrollView.addSubview(ordersTableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag {
        case 1:
            return 4
        case 2:
            return 5
        case 3:
            return 4
        default:
            print("default")
            return newsArray.count
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch tableView.tag {
            
        case 1:
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsTableViewCell
            cell.newsLabel.text = newsArray[indexPath.row].text
            cell.dateLabel.text = newsArray[indexPath.row].date
        return cell
        case 2:
           let  cell = tableView.dequeueReusableCell(withIdentifier: "stat") as! StatsTableViewCell
           
           return cell
        case 3:
           let  cell = tableView.dequeueReusableCell(withIdentifier: "order") as! OrdersTableViewCell
           cell.textLabe.text = ordersArray[indexPath.row].text
           cell.dateLabel.text = ordersArray[indexPath.row].date
           cell.priceLabel.text = ordersArray[indexPath.row].price
           cell.sharesLabel.text = ordersArray[indexPath.row].shares
           return cell
        default:
            print("default")
            let cell = tableView.dequeueReusableCell(withIdentifier: "news")!
        return cell
            
        }

        

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    


}


struct News {
    var text: String!
    var date: String!
}

struct Stat{
    var open: Double!
    var high: Double!
    var low: Double!
    var volume: Double!
    var avgvol: Double!
    var mktcap: Double!
    var ratio: Double!
    var yield: Double!
    var ftkh: Double!
    var ftkl: Double!
}

struct Order {
    var text: String!
    var date: String!
    var price: String!
    var shares: String!
}



