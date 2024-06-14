//
//  MessageCellTableViewCell.swift
//  ChatterBox
//
//  Created by Gautham C on 6/14/24.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var receiverImageView: UIImageView!
    @IBOutlet weak var senderImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
