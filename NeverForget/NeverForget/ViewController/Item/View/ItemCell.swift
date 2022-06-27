//
//  ItemCell.swift
//  NeverForget
//
//  Created by Jaber Shamali on 27/06/22.
//

import Foundation
import UIKit

final class ItemCell: UITableViewCell{
    static let identifier = "cell"
    
    lazy var itemLb : UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        
        return lb
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCell: CodeView{
    func buildHierarchy() {
        contentView.addSubview(itemLb)

    }

    
    func configConstraints() {
        
        itemLb.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            
        }
        
    }
    
    func additionalConfig() {

    }
    
    
}
