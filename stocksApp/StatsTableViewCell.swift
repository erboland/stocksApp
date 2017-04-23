//
//  StatsTableViewCell.swift
//  stocks
//
//  Created by Ербол Каршыга on 4/22/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class StatsTableViewCell: UITableViewCell {

    var firstLabel: UILabel!
    var secondLabel: UILabel!
    var firstNumber: UILabel!
    var secondNumber: UILabel!
    
    
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
        firstLabel = UILabel(frame: CGRect(x: 0, y: self.frame.minY, width: self.frame.width/4, height: self.bounds.height))
        secondLabel = UILabel(frame: CGRect(x: self.bounds.width/2, y: self.frame.minY, width: self.frame.width/4, height: self.bounds.height))
        firstNumber = UILabel(frame: CGRect(x: self.bounds.width/4, y: self.frame.minY, width: self.frame.width/4, height: self.bounds.height))
        secondNumber = UILabel(frame: CGRect(x: self.bounds.width*3/4, y: self.frame.minY, width: self.frame.width/4, height: self.bounds.height))
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
        self.addSubview(firstNumber)
        self.addSubview(secondNumber)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
