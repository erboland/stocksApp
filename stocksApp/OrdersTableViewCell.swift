//
//  OrdersTableViewCell.swift
//  stocks
//
//  Created by Ербол Каршыга on 4/22/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    var textLabe: UILabel!
    var dateLabel: UILabel!
    var sharesLabel: UILabel!
    var priceLabel: UILabel!
    var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabe = UILabel(frame: CGRect(x: 0, y: self.frame.minY, width: self.bounds.width/2, height: self.bounds.height/2))
        dateLabel = UILabel(frame: CGRect(x: 0, y: self.frame.maxY+5, width: self.bounds.width/2, height: self.bounds.height/2-5))
        sharesLabel = UILabel(frame: CGRect(x: self.bounds.width/2, y: self.frame.minY, width: self.bounds.width/2 - 5, height: self.bounds.height/2))
        priceLabel = UILabel(frame: CGRect(x: self.bounds.width/2, y: sharesLabel.frame.maxY+5, width: self.bounds.width/2 - 5, height: self.bounds.height-5))
        arrowImage = UIImageView(frame: CGRect(x: sharesLabel.frame.maxX, y: self.frame.minY, width: 5, height: self.bounds.height))
        self.addSubview(textLabe)
        self.addSubview(dateLabel)
        self.addSubview(sharesLabel)
        self.addSubview(priceLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
