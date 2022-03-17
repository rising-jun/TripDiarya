//
//  ViewController.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/07.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController

class SplashViewController: UIViewController, ViewActionReactiveUseable {
    
    lazy var viewLifeState = PublishSubject<ViewState>()
    lazy var timeOverCheckSubject = PublishSubject<Bool>()
    private lazy var v = SplashView(frame: view.frame)
    
    
    override func loadView() {
        super.loadView()
        subscribeViewCycle()
        bindViewModel()
    }
    
    func subscribeViewCycle() {
        rx.viewDidLoad.bind { [weak self] _ in
            guard let self = self else { return }
            self.viewLifeState.onNext(ViewState.viewDidLoad)
        }.disposed(by: disposeBag)
        rx.viewWillAppear.bind { [weak self] _ in
            guard let self = self else { return }
            self.viewLifeState.onNext(ViewState.viewWillAppear)
        }.disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
    private let viewModel = SplashViewModel(timer: SplashTimer(timerSec: 4))
    private lazy var input = SplashViewModel
        .Input(viewState: viewLifeState)
    private lazy var output = viewModel.transform(input: input)
    
    func bindViewModel() {
        output.state?
            .map{$0.timeOver}
            .drive(onNext: { [weak self] done in
                print("done \(done)")
            }).disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = v
    }
}
