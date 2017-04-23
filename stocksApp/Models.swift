//
//  Models.swift
//  stocksApp
//
//  Created by Robert Kim on 4/23/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import Foundation
import Alamofire
import SocketIO

struct Socket {
    
    var socket = SocketIOClient(socketURL: URL(string: "http://192.168.1.146:3000")!,config: [.forcePolling(true)])
    
    func connect(){
        
        socket.on("connect") {data, ack in
            self.socket.emit("getStocks", ["symbol": "GOOG"])
            
            self.socket.on("stocksInfo/\(self.socket.sid!)") {data, ack in
                print(data)
            }
        }
        
        socket.on("error") {data, ack in
            print("error occured")
        }
    
        socket.connect()
    }
    
    func on(_ ref: String, completion: @escaping (AnyObject) -> ()){
        
    }
    
}

struct StocksModel {
    
    static func stocksFor(_ range: TimeRangeEnum, symbol: String, _ completion: @escaping ([CGFloat],[CGFloat: String]) -> Void ) {
        
        Alamofire.request("http://192.168.1.146:3000/\(range.rawValue)/\(symbol)").responseJSON { response in
            
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
