//
//  CategoryListTableViewCell.swift
//  StarWars
//
//  Created by Kinjal  on 02/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func moreDetailsTapped(_ sender: Any) {
        
    }
    
    var peopleViewModel: PeopleViewModel! {
        didSet {
            titleLabel.text = peopleViewModel.name
            subTitleLabel.text = peopleViewModel.gender
            dateLabel.text = peopleViewModel.created
            // profileImageView.setImageForName(peopleViewModel.name, circular: true, textAttributes: nil)
            profileImageView.setImageForName(peopleViewModel.name, backgroundColor: UIColor.lightGray, circular: true, textAttributes: nil, gradient: false)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
