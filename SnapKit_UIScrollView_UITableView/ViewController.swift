//
//  ViewController.swift
//  SnapKit_UIScrollView_UITableView
//
//  Created by 李永杰 on 2021/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    private func configUI() {
        self.view.addSubview(teacherView)
        teacherView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
     
    lazy var teacherView: NPCommentView = {
        let view = NPCommentView()
        return view
    }()
}

