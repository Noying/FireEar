//
//  TaskCell.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AudioKitUI
import SnapKit

class TaskCell: UITableViewCell {

    @IBOutlet  var showImageView: UIImageView!
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var remainderTimeLabel: UILabel!
    @IBOutlet weak var outputPlot: AKNodeOutputPlot!
    @IBOutlet weak var controlBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        outputPlot.layer.cornerRadius = 8.0
        if #available(iOS 11.0, *) {
            outputPlot.backgroundColor = UIColor(named: "playColor")
        } else {
            // Fallback on earlier versions
        }
        remainderTimeLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(stepNameLabel.snp.right).offset(25)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalTo(outputPlot.snp.top).offset(-5)
            make.right.equalTo(controlBtn.snp.left).offset(-5)
        }
        controlBtn.snp.makeConstraints({make in
            make.centerY.equalToSuperview()
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
