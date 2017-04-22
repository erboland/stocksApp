
//  ViewController.swift
//  stocks
//
//  Created by Robert Kim on 4/18/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit


class PortfolioViewController: UIViewController, TimeRangeControlDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
  
    var lineGraphView: LineGraphView!
    var timeRangeControl: TimeRangeControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.lineGraphView = LineGraphView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 100))
        
        self.lineGraphView.lineWidth = 3
        self.lineGraphView.lineColor = UIColor(hex: StockEnum.mainColor.rawValue)
        self.lineGraphView.backgroundColor = UIColor.clear
        
        self.lineGraphView.showStocksFor(.sixMonth, symbol: "GOOG")
        

        self.timeRangeControl = TimeRangeControl(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100))
        self.timeRangeControl.delegate = self
        
        self.scrollView.addSubview(lineGraphView)
        self.scrollView.addSubview(timeRangeControl)
        
    }
    
    func selectedChanged(range: TimeRangeEnum) {
        print(range)
        self.lineGraphView.showStocksFor(range, symbol: "GOOG")
    }

   
}

