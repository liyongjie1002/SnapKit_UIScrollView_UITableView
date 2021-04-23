//
//  NPTeacherCommentCell.swift
//  NPHome
//
//  Created by 李永杰 on 2021/4/22.
//  Copyright © 2021 李永杰. All rights reserved.
//

import UIKit
import SnapKit

class NPCommentCell: UITableViewCell {
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func configUI() {
        selectionStyle = .none
        contentView.addSubview(contentLabel)
        contentLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
    }
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
}
