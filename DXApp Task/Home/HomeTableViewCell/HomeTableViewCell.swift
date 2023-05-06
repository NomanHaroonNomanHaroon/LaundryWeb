//
//  HomeTableViewCell.swift
//  DXApp Task
//
//  Created by Macbook Pro on 06/05/2023.
//

import UIKit

struct HomeTableViewCellModel {
    let rowTitle: String
    let rowIcon: UIImage?
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rowIcon: UIImageView!
    @IBOutlet weak var rowTitle: UILabel!
    @IBOutlet weak var rightChevron: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rowIcon.image = nil
        rowTitle.text = nil
    }
    
    func configureRow(model: HomeTableViewCellModel, isEvenRow: Bool) {
        rowIcon.image = model.rowIcon
        rowTitle.text = model.rowTitle
        rightChevron.tintColor = !isEvenRow ? Constants.AppColors.primaryBackgroundColor : Constants.AppColors.secondaryBackgroundColor
        containerView.backgroundColor = !isEvenRow ? Constants.AppColors.secondaryBackgroundColor : Constants.AppColors.primaryBackgroundColor
        rowTitle.textColor = !isEvenRow ? Constants.AppColors.primaryBackgroundColor : Constants.AppColors.secondaryBackgroundColor
        
    }
}
