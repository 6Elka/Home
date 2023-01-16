//
//  ViewController.swift
//  Activ
//
//  Created by Artem on 15.01.2023.
//
import UIKit

class MainViewController: UIViewController {
    
    private let picker = UIPickerView(background: .yellow)
    private let imageView = UIImageView(contentMode: .scaleToFill)
    private let items = ["pic1", "pic2", "pic3", "saveButton"]
    private let button = UIButton(title: "Save Photo")
    private let textField = UITextField(placeholder: "Enter the text")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
}

//MARK: - Private Init
private extension MainViewController {
    //MARK: - Init
    func initialize() {
        view.backgroundColor = .white
        
        //MARK: - Image
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        //MARK: - Button
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            button.heightAnchor.constraint(equalToConstant: 40)
        
        ])
      
        //MARK: - Picker
        picker.delegate = self
        picker.dataSource = self
        view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            picker.widthAnchor.constraint(equalToConstant: 150),
            picker.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        //MARK: - TextField
        textField.delegate = self
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func tapped() {
        
        if textField.text?.count == 0 {
            let alert = UIAlertController(title: "Wrong", message: "Empty row", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            let avc = UIActivityViewController(activityItems: [textField.text ?? ""], applicationActivities: nil)
            present(avc, animated: true)
        }
    }
}

//MARK: - UIPickerViewDelegate / UIPickerViewDataSource
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            imageView.image = UIImage(named: items[row])
            button.isHidden = true
            textField.isHidden = true
            imageView.isHidden = false
            guard let image = UIImage(named: items[row]) else {return}
            let myActiv = MyActivity(title: items[row], image: image) { items in
                print(items)
            }
            let activity = UIActivityViewController(activityItems: [image], applicationActivities: [myActiv])
            present(activity, animated: true)
        case 1:
            imageView.image = UIImage(named: items[row])
            button.isHidden = true
            imageView.isHidden = false
            textField.isHidden = true
            guard let image = UIImage(named: items[row]) else {return}
            let myActiv = MyActivity(title: items[row], image: image) { items in
                print(items)
            }
            let activity = UIActivityViewController(activityItems: [image], applicationActivities: [myActiv])
            present(activity, animated: true)
        case 2:
            imageView.image = UIImage(named: items[row])
            button.isHidden = true
            imageView.isHidden = false
            textField.isHidden = true
            guard let image = UIImage(named: items[row]) else {return}
            let myActiv = MyActivity(title: items[row], image: image) { items in
                print(items)
            }
            let activity = UIActivityViewController(activityItems: [image], applicationActivities: [myActiv])
            present(activity, animated: true)
        case 3:
            imageView.isHidden = true
            button.isHidden = false
            textField.isHidden = false
        default:
            break
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
}

//MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let avc = UIActivityViewController(activityItems: [textField.text ?? ""], applicationActivities: nil)
        present(avc, animated: true)
        return true
    }
}


