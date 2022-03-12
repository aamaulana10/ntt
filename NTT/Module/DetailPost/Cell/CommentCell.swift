//
//  CommentCell.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var lblCommentUser: UILabel!
    @IBOutlet weak var lblCommentContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(data: CommentModel) {
        
        lblCommentUser.text = data.email
        lblCommentContent.text = data.body
    }
    
}
