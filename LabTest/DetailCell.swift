//
//  DetailCell.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    var imgAction : ((String) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var model: SearchDetail? {
        didSet {
            guard let model = model else { return }
            self.title.text = model.title
            self.subtitle.text = model.subtitle
        }
    }
    
}
