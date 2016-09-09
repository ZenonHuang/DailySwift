//
//  RoundedCornerButton.swift
//  Swiftbot
//
//  Created by zzgo on 16/9/9.
//  Copyright © 2016年 thoughtbot. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {
//  awakeFromNib()，在 view 从 IB 中加载时被调用。
//  drawRect(_:)，在 view 需要将自己绘制到屏幕上时被调用。
//  layoutSubviews()，在 view 需要确定 subview 的大小与位置时被调用。
  override func awakeFromNib() {
    layer.cornerRadius=4;
    backgroundColor = UIColor(red: 0.75, green: 0.20, blue: 0.19, alpha: 1.0)
  }
}
