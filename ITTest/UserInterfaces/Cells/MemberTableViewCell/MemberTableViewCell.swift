//
//  MemberTableViewCell.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    // MARK: - Life Cycle
    
    @IBOutlet weak var memberID: UILabel!
    @IBOutlet weak var memberName: UILabel!

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    
    func configure(_ memberViewModel: MemberViewModel) {
        
        if memberViewModel.id.isEmpty && memberViewModel.name.isEmpty {
            memberID.text = ""
            memberName.text = "There is no data"
        }
        else {
            memberID.text = memberViewModel.id
            memberName.text = memberViewModel.name
        }
    }
}
