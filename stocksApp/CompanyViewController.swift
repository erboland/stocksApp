//
//  ViewController.swift
//  stocks
//
//  Created by Robert Kim on 4/18/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit
import Alamofire

class CompanyViewController: UIViewController {

  
    @IBOutlet weak var scrollView: UIScrollView!
    var lineGraphView: LineGraphView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Alamofire.request("http://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&apikey=KCUL").responseJSON { response in
           
            if let data = response.result.value as? NSDictionary{
                
                if let points = data.object(forKey: "Time Series (5min)") as? NSDictionary{
                  
                    let dates = points.allKeys.sorted(by:{($0 as! String) < ($1 as! String)})
                    var dataPoints:[CGFloat] = []
                    
                    for date in dates {
                        
                        if let stock = points[date] as? NSDictionary {
                            let point = stock.object(forKey: "1. open") as! NSString
                            dataPoints.append(CGFloat(point.doubleValue))
                        }
                        
                    }
                    
//                    self.lineGraphView = lineGraphView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
                   
                
                    self.lineGraphView.minY = dataPoints.min()!
                    self.lineGraphView.maxY = dataPoints.max()!
                    self.lineGraphView.data = dataPoints
                    self.lineGraphView.lineWidth = 3
                    self.lineGraphView.lineColor = UIColor(hex: "00BFA5")
                    self.lineGraphView.backgroundColor = UIColor.clear
                    
                    self.view.addSubview(self.lineGraphView)
                    
                } else {
                    print("bad")
                }
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

