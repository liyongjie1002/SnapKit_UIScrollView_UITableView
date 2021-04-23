//
//  NPTeacherView.swift
//  NPHome
//
//  Created by 李永杰 on 2021/4/22.
//  Copyright © 2021 李永杰. All rights reserved.
//

import UIKit
import SnapKit

class NPCommentView: UIView {
    
    let texts = ["詹姆斯詹姆斯詹姆斯詹姆斯詹姆斯詹姆斯詹姆斯詹姆斯", "霍华德霍华德霍华德", "杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特杜兰特", "加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特加内特"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    private func configUI() {
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        contentView.addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // 约束宽度，高度自动撑开
        contentView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        // 内部自动布局，不用设置高度
        headerView.snp.remakeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        // tableView自动布局自动计算的contentSize
        let height = tableView.contentSize.height
        tableView.snp.remakeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(height)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var headerView: NPTeacherHeaderView = {
        let view = NPTeacherHeaderView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorColor = .blue
        table.dataSource = self
        table.estimatedRowHeight = 30
        table.rowHeight = UITableView.automaticDimension
        table.register(NPCommentCell.self, forCellReuseIdentifier: "NPCommentCell")
        table.backgroundColor = .clear
        table.isScrollEnabled = false
        return table
    }()
}

class NPTeacherHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        configUI()
    }
    
    private func configUI() {
        addSubview(headerLabel)
        addSubview(bottomView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.snp.remakeConstraints { (make) in
            make.top.left.equalTo(50)
            make.right.equalTo(-50)
        }
        bottomView.snp.remakeConstraints { (make) in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(30)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "赵云打篮球赵云打篮球赵云打篮球赵云打篮球赵云打篮球赵云打篮球赵云打篮球赵云打篮球"
        return label
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
}

extension NPCommentView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NPCommentCell", for: indexPath) as! NPCommentCell
        cell.contentLabel.text = texts[indexPath.row]
        return cell
    }
}
