//
//  Domain.swift
//  go_servers_app
//
//  Created by Julio Marin on 5/26/19.
//  Copyright © 2019 Julio Marin. All rights reserved.
//

import UIKit

class DomainTableViewCell: UITableViewCell {
    @IBOutlet weak var domainLogo: UIImageView!
    @IBOutlet weak var domainTitle: UILabel!
    @IBOutlet weak var domainInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
