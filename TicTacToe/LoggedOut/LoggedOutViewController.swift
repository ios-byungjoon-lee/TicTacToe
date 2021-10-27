//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by BJ_LEE on 2021/10/27.
//

import RIBs

import RxSwift
import RxCocoa
import SnapKit
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(player1Name: String?, player2Name: String?)

}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?

    private let disposeBag: DisposeBag = .init()

    private let player1Field: UITextField = {
        let view = UITextField()
        view.borderStyle = .line
        view.placeholder = "Player 1 name"
        return view
    }()

    private let player2Field: UITextField = {
        let view = UITextField()
        view.borderStyle = .line
        view.placeholder = "Player 2 name"
        return view
    }()

    private let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = UIColor.black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(player1Field)
        player1Field.snp.makeConstraints {
            $0.top.equalTo(view).offset(100)
            $0.leading.trailing.equalTo(view).inset(40)
            $0.height.equalTo(40)
        }
        
        view.addSubview(player2Field)
        player2Field.snp.makeConstraints {
            $0.top.equalTo(player1Field.snp.bottom).offset(20)
            $0.leading.trailing.height.equalTo(player1Field)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.top.equalTo(player2Field.snp.bottom).offset(20)
            $0.leading.trailing.height.equalTo(player1Field)
        }
    }

    private func bind() {
        loginButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.listener?.login(
                    player1Name: owner.player1Field.text,
                    player2Name: owner.player2Field.text
                )
            })
            .disposed(by: disposeBag)
    }
}
