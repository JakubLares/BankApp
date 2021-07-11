//
//  NewPaymentViewModel.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit
import Combine

class NewPaymentViewModel {

    private var cancellables = Set<AnyCancellable>()

    var toAccountValid = PassthroughSubject<Bool, Never>()
    var bankCodeValid = PassthroughSubject<Bool, Never>()
    var amountValid = PassthroughSubject<Bool, Never>()
    var isAllValid = PassthroughSubject<Bool, Never>()

    init() {
        Publishers.CombineLatest3(toAccountValid, bankCodeValid, amountValid)
            .map { $0 && $1 && $2 }
            .sink { [weak self] isValid in
                self?.isAllValid.send(isValid)
            }
            .store(in: &cancellables)
    }

    func bindToAccountTextField(_ textField: UITextField) {
        textField.textPublisher()
            .sink { [weak self] textField in
                self?.validateToAccount(textField)
            }
            .store(in: &cancellables)
    }

    func bindBankCodeTextField(_ textField: UITextField) {
        textField.textPublisher()
            .sink { [weak self] textField in
                self?.validateBankCode(textField)
            }
            .store(in: &cancellables)
    }

    func bindAmountTextField(_ textField: UITextField) {
        textField.textPublisher()
            .sink { [weak self] textField in
                self?.validateAmount(textField)
            }
            .store(in: &cancellables)
    }

    func makePayment(toAccount: String, bankCode: String, amount: String) {
        let payment = Payment(toAccount: Int(toAccount) ?? 0, bankCode: Int(bankCode) ?? 0, amount: Double(amount) ?? 0)
        FileClient.shared.savePayment(payment)
    }

    private func validateToAccount(_ textField: UITextField?) {
        guard let textField = textField else { return }

        let input = textField.unwrappedText()
        let isValid = input.validate(regexString: "\\d{10}$") && input.count == 10
        styleTextFieldValidation(isValid: isValid, textField: textField)
        toAccountValid.send(isValid)
    }

    private func validateBankCode(_ textField: UITextField?) {
        guard let textField = textField else { return }

        let input = textField.unwrappedText()
        let isValid = input.validate(regexString: "\\d{4}$") && input.count == 4
        styleTextFieldValidation(isValid: isValid, textField: textField)
        bankCodeValid.send(isValid)
    }

    private func validateAmount(_ textField: UITextField?) {
        guard let textField = textField else { return }

        let input = textField.unwrappedText()
        let isValid = input.validate(regexString: "\\d+(\\.\\d{1,2})?")
        styleTextFieldValidation(isValid: isValid, textField: textField)
        amountValid.send(isValid)
    }

    private func styleTextFieldValidation(isValid: Bool, textField: UITextField) {
        textField.textColor = isValid ? .black : .red
    }
    
}
