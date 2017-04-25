//
//  NewsTableViewCell.swift
//  stocks
//
//  Created by Ербол Каршыга on 4/21/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var newsLabel: UILabel!
    var dateLabel: UILabel!
    var arrowImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
super.init(style: style, reuseIdentifier: reuseIdentifier)
        newsLabel = UILabel (frame: CGRect(x: 10 , y: 0, width: self.bounds.width-5, height: 100*0.7))
        newsLabel.font = UIFont(name: "Avenir Next Medium", size: 18)
        dateLabel = UILabel (frame: CGRect(x: 18, y: newsLabel.frame.maxY + 2.5, width: self.bounds.width-5, height: 100*0.3-2.5))
        arrowImage = UIImageView(frame: CGRect(x: self.bounds.width-5, y: self.frame.minY, width: 5, height: self.frame.height))

        
        self.addSubview(newsLabel)
        self.addSubview(dateLabel)
        self.addSubview(arrowImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
