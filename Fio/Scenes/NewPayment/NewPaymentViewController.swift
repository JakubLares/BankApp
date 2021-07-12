//
//  NewPaymentViewController.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit
import Combine

class NewPaymentViewController: UIViewController {

    @IBOutlet weak var toAccountLabel: UILabel!
    @IBOutlet weak var toAccountTextField: UITextField!
    @IBOutlet weak var bankCodeLabel: UILabel!
    @IBOutlet weak var bankCodeTextField: UITextField!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!

    private var viewModel = NewPaymentViewModel()
    private var cancellables = Set<AnyCancellable>()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupViewModel()
    }

    @IBAction func payButtonPressed(_ sender: Any) {
        viewModel.makePayment(
            toAccount: toAccountTextField.unwrappedText(),
            bankCode: bankCodeTextField.unwrappedText(),
            amount: amountTextField.unwrappedText()
        )
        _ = navigationController?.popViewController(animated: true)
    }

    private func setupUI() {
        title = LocalizableStrings.NewPayment.title

        toAccountLabel.text = LocalizableStrings.NewPayment.toAccount
        bankCodeLabel.text = LocalizableStrings.NewPayment.bankCode
        amountLabel.text = LocalizableStrings.NewPayment.amount
        currencyLabel.text = LocalizableStrings.czechCrown
        payButton.isEnabled = false
        payButton.setTitle(LocalizableStrings.NewPayment.pay, for: .normal)
    }

    private func setupViewModel() {
        viewModel.bindToAccountTextField(toAccountTextField)
        viewModel.bindBankCodeTextField(bankCodeTextField)
        viewModel.bindAmountTextField(amountTextField)
        viewModel.isAllValid
            .assign(to: \.isEnabled, on: payButton)
            .store(in: &cancellables)
    }

}
