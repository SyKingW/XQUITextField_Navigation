//
//  XQUITextField_Navigation.swift
//  XQShopMallProject
//
//  Created by WXQ on 2020/5/20.
//  Copyright © 2020 itchen.com. All rights reserved.
//

import UIKit
import UITextField_Navigation

extension UIView {
    
    /// 把该 view 下面所有的 TextField 和 textView 连起来
    public func xq_showTextField_Navigation() {
        
        let tfArr = self.xq_getAllChildsTextField()
        
        // 是否是第一个
        var isFirst = true
        var lastIndex = 0
        
        for (index, view) in tfArr.enumerated() {
            if isFirst {
                
                // 第一个
                if self.xq_NavigationFieldJudgeSingle(with: view) {
                    isFirst = false
                    lastIndex = index
                }
                
            }else {
                // 至少第二个
                if self.xq_NavigationFieldJudge(with: view, lastV: tfArr[lastIndex]) {
                    lastIndex = index
                }
                
            }
        }
        
    }
    
    /// 判断是否符合 NavigationField
    /// - Parameters:
    ///   - v: 当前这个
    ///   - lastV: 上一个
    private func xq_NavigationFieldJudge(with v: UIView, lastV: UIView) -> Bool {
        
        if !v.isUserInteractionEnabled || v.isHidden {
            return false
        }
        
        // tf
        if let tf = v as? UITextField, tf.isEnabled, tf.isUserInteractionEnabled,
            let lastTF = lastV as? NavigationField {
            lastTF.nextNavigationField = tf
            return true
        }
        
        // tv
        if let tv = v as? UITextView, tv.isEditable, tv.isUserInteractionEnabled,
            let lastTF = lastV as? NavigationField {
            lastTF.nextNavigationField = tv
            return true
        }
        
        return false
    }
    
    private func xq_NavigationFieldJudgeSingle(with v: UIView) -> Bool {
        
        if !v.isUserInteractionEnabled || v.isHidden {
            return false
        }
        
        // tf
        if let tf = v as? UITextField, tf.isEnabled {
            tf.applyInputAccessoryView()
            return true
        }
        
        // tv
        if let tv = v as? UITextView, tv.isEditable {
            tv.applyInputAccessoryView()
            return true
        }
        
        return false
    }
    
    /// 获取下面所有的 UITextField or UITextView
    public func xq_getAllChildsTextField() -> [UIView] {
        
        var tfArr = [UIView]()
        for v in self.subviews {
            
            if let tf = v as? UITextField {
                tfArr.append(tf)
                
            }else if let tv = v as? UITextView {
                tfArr.append(tv)
                
            }else {
                
                // 继续往下层获取
                tfArr.append(contentsOf: v.xq_getAllChildsTextField())
                
            }
            
        }
        
        return tfArr
        
    }
    
    
}
