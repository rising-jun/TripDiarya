//
//  Base.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/16.
//

import Foundation
import UIKit
import RxSwift

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
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


extension UIView{
    func addSubViews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
}

enum ViewState{
    case viewDidLoad
    case viewWillAppear
}
