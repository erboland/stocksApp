//
//  LineChart.swift
//  stocks
//
//  Created by Robert Kim on 4/18/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit
import Alamofire

enum StockEnum: String{
    
    case mainColor = "03A9F4"
}

enum TimeRangeEnum: String {
    case today = "stocksForToday"
    case fiveDays = "stocksForFiveDays"
    case month = "stocksForMonth"
    case threeMonth = "stocksForThreeMonths"
    case sixMonth = "stocksForSixMonths"
    case year = "stocksForYear"
}


class LineGraphView: UIView {

    var linePath = UIBezierPath()
    
    var maxY: CGFloat = 0
    var minY: CGFloat = 0
    var lineWidth: CGFloat = 0
    var lineColor: UIColor?
    
    var data: [CGFloat]!
    var dates: [CGFloat: String]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
    }
    
    override func draw(_ rect: CGRect) {
        
        if let points = self.data {
            let xInc = self.frame.width / CGFloat(points.count)
            let yInc = self.frame.height / (points.max()! - points.min()!)
            
            lineColor?.setFill()
            lineColor?.setStroke()
            
           
            
            self.linePath.move(to: CGPoint(x: 0, y: self.frame.height - (((points[0]) - points.min()! ) * yInc )))
            
            for (index,snap) in points.enumerated() {
                
                if index > 0 {
                    
                    let point: CGPoint = CGPoint(x: CGFloat(index) * xInc, y: self.frame.height - ((snap - points.min()!) * yInc))
                    self.linePath.addLine(to: point)
                }
              
            }
            
            self.linePath.lineWidth = self.lineWidth
            self.linePath.stroke()

        }
        
    }
    
    
    func showStocksFor(_ range: TimeRangeEnum, symbol: String){
        
        linePath.removeAllPoints()
        self.data = nil
        self.setNeedsDisplay()
        
        StocksModel.stocksFor(range, symbol: symbol) { (points, dates) in
            self.data = points
            self.dates = dates
            
            self.setNeedsDisplay()
        }
        
    }
    
}


struct StocksModel {
    
    static func stocksFor(_ range: TimeRangeEnum, symbol: String, _ completion: @escaping ([CGFloat],[CGFloat: String]) -> Void ) {
        
        Alamofire.request("http://192.168.1.3:3000/\(range.rawValue)/\(symbol)").responseJSON { response in
            
            if let data = response.result.value as? NSArray{
                
                var dates: [CGFloat: String] = [:]
                
                let points = data.map { (snap) -> CGFloat in
                    
                    let val =  (snap as! NSString).components(separatedBy: "/")
                    
                    let point = CGFloat((val[1] as NSString).doubleValue)
                    
                    dates[point] = val[0]
                    
                    return point
                }
                
                completion(points, dates)
                
            } else {
                print("no result value")
            }
            
        }
        
    }
    
}


extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
