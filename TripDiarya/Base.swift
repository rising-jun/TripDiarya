//
//  Base.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/16.
//

import Foundation
import UIKit
protocol ViewModelType{
    associatedtype Input
    associatedtype Output
    
    var input: Input? { get }
    var output: Output? { get }
}

class BaseView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI(){
        backgroundColor = .white
    }
}

class BaseViewController: UIViewController{
    override func loadView() {
        super.loadView()
        bindViewModel()
    }
    
    public func bindViewModel(){
        
    }
}
extension UIView{
    func addSubViews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
}
