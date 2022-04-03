//
//  BaseViewController.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/17.
//

import Foundation
import RxSwift

protocol ViewActionReactiveUseable: ViewCycleSubscribeable{
    func bindViewModel()
}

protocol ViewCycleSubscribeable{
    var viewLifeState: PublishSubject<ViewState> { get set }
    func subscribeViewCycle()
}

