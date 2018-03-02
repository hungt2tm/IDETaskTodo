//
//  TodoTableViewCell.swift
//  TaskTodo
//
//  Created by If Only on 3/2/18.
//  Copyright © 2018 Gnuh Nav Inc. All rights reserved.
//

import UIKit

protocol TodoTableViewCellDelegate: class {
    func getIndexPath(indexPath: IndexPath)
}

class TodoTableViewCell: UITableViewCell {
    
    // MARK - Variable
    weak var delegate: TodoTableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func handledInfoCell(_ sender: Any) {
        if let indexPath = self.indexPath, let delegate = self.delegate {
            delegate.getIndexPath(indexPath: indexPath)
        }
    }
    
}
