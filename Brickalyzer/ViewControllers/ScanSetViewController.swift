//
//  ScanSetViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class ScanSetViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    let enterSetStackView = UIStackView(frame: .zero)
    let enterSetButton = UIButton()
    let enterSetText = UITextField()
    var enterSetBottomConstraint = NSLayoutConstraint()
    let padding = CGFloat(10.0)
    var dismissRecognizer: UITapGestureRecognizer!
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        showScanner()
        setupStackView()
        registerForKeyboard()
        dismissRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        dismissRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(dismissRecognizer)
    }
    
    @objc func dismissKeyboard() {
        enterSetText.resignFirstResponder()

    }
    
    func registerForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardDidShow(notification: Notification) {
        guard let info = notification.userInfo,
            let frameInfo = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else { return }
        let frame = frameInfo.cgRectValue
        UIView.animate(withDuration: 1.0, animations: { () in
            self.enterSetBottomConstraint.constant = -self.padding - frame.size.height
        })
    }

    @objc func keyboardWillHide() {
        enterSetBottomConstraint.constant = -padding
        print(enterSetBottomConstraint)
    }
    
    @objc func buttonTapped() {
        guard var text: String = enterSetText.text else {
            print("nil")
            return
        }
        if (!text.contains("-")) {
            text = "\(text)-1"
        }
        let vc = SetViewController()
        vc.setID = text
        navigationController?.pushViewController(vc, animated: true)
    }

    func setupStackView() {
        view.addSubview(enterSetStackView)
        enterSetButton.setTitle("Go", for: .normal)
        enterSetButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        enterSetText.placeholder = "Set ID / UPC"
        enterSetText.attributedPlaceholder = NSAttributedString(string: "Set ID / UPC", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 44))
        enterSetText.leftView = paddingView
        enterSetText.leftViewMode = .always
        let gray = UIColor.gray.withAlphaComponent(0.3)
        enterSetText.backgroundColor = gray
        enterSetText.textColor = .white
        enterSetText.adjustsFontSizeToFitWidth = true
        enterSetText.borderStyle = .line
        enterSetText.autocorrectionType = .no
        enterSetText.keyboardType = .numberPad
        enterSetText.tintColor = .white
        enterSetStackView.alignment = .center
        enterSetStackView.distribution = .fillProportionally
        enterSetStackView.axis = .horizontal
        enterSetStackView.translatesAutoresizingMaskIntoConstraints = false
        enterSetButton.translatesAutoresizingMaskIntoConstraints = false
        enterSetText.translatesAutoresizingMaskIntoConstraints = false
        enterSetStackView.addArrangedSubview(enterSetText)
        enterSetStackView.addArrangedSubview(enterSetButton)
        enterSetBottomConstraint = enterSetStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        NSLayoutConstraint.activate([
            enterSetStackView.heightAnchor.constraint(equalToConstant: 44),
            enterSetStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            enterSetStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            enterSetText.heightAnchor.constraint(equalTo: enterSetStackView.heightAnchor),
            enterSetButton.heightAnchor.constraint(equalTo: enterSetStackView.heightAnchor),
            enterSetBottomConstraint
        ])

    }

    func showScanner() {
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            print("error")
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr, .aztec,.code128, .code39, .code39Mod43, .code93, .dataMatrix, .ean13,.ean8]
        } else {
            print("error")
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }
    
    func found(code: String) {
        print(code)
        
        if !code.isEmpty{
            print(code)
        }
    }
}
