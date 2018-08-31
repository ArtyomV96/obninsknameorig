//
//  BottomDatePicker.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 24.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class BottomDatePicker: UIView {
    
    var container: UIView = {
       // var view = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 260, width: UIScreen.main.bounds.width, height: 260))
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.colorWhite
        return view
    }()
    
    var splitter: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "splitterColor")
        return view
    }()
    
    var topsplitter: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "splitterColor")
        return view
    }()
    
    var datePicker: UIDatePicker = {
        var view = UIDatePicker()
        view.datePickerMode = .date
        view.backgroundColor = Constants.colorWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cancelButton: UIButton = {
        let view: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 22))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitleColor(Constants.colorBlue, for: .normal)
        view.setTitle("Отмена", for: .normal)
        view.titleLabel?.font = UIFont(name: Constants.SFRegular, size: 17)
        view.addTarget(self, action: #selector(pickerDismiss), for: .touchUpInside)
        view.tag = 1
        return view
    }()
    
    var showNewsButton: UIButton = {
        let view: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 22))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitleColor(Constants.colorBlue, for: .normal)
        view.titleLabel?.font = UIFont(name: Constants.SFMedium, size: 17)
        view.setTitle("Показать новости", for: .normal)
        view.tag = 2
        return view
    }()
    
    func addViews() {
        if UIApplication.shared.keyWindow != nil {
            self.backgroundColor = UIColor(white: 0, alpha: 0)
            self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.pickerDismiss)))
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.addSubview(container)
            container.addSubview(cancelButton)
            container.addSubview(showNewsButton)
            container.addSubview(datePicker)
            container.addSubview(splitter)
            container.addSubview(topsplitter)
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 1
            })
        }
    }
    
    @objc func pickerDismiss() {
        self.removeFromSuperview()
                UIView.animate(withDuration: 0.5, animations: {
                    self.alpha = 0
                })
    }
    let parentViewController = NewsTableController()

    func setupConstraint() {
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 260).isActive = true
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        topsplitter.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        topsplitter.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        topsplitter.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        splitter.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        splitter.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 8).isActive = true
        splitter.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        datePicker.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 220).isActive = true

        cancelButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 8).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16).isActive = true

        showNewsButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 8).isActive = true
        showNewsButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16).isActive = true
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tag = 21
        addViews()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
