//
//  PostCell.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPost: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func setupData(data: PostModel) {
        
        lblTitle.text = data.title + "\(data.userId)"
        lblPost.text = data.body
        lblCommentCount.text = "\(data.comment?.count ?? 0)"
        
        contentView.customRoundedView(radius: 8, width: 0.5, color: .lightGray)
    }
}
