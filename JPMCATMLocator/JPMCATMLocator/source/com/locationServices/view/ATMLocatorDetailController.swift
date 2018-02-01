//
//  ATMLocatorDetailController.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//
//This controller will be responsible for rendering location details when user clicks the near by atm's marker.
//In fact here I am following, MVVM design pattern and locatorDetail as viewModel. As viewModel is obvious, I made it as tightly coupled
//
//I am aware that using storyboard & autolayouts are bit easy but the reason some times I prefer custom views is to make a relation ship with programming code. We have other instances we would prefer custom views when multiple persons are working on same storyboards(to avoid un resolvable conflicts)
//

import UIKit
import ProjectWorldFramework

class ATMLocatorDetailController: MasterViewController {
    @IBOutlet var locatorDetail: ATMLocatorDetailViewModel!
    

    let controlView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red: 0.35, green: 0.73, blue: 0.80, alpha: 1.0)
//        cv.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height-40)
        return cv
    }()
    
    lazy var containerView: UIView = {
       let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red: 0.62, green: 0.81, blue: 0.85, alpha: 1.0)
        cv.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height-40)
        return cv
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(handleDoneEvent), for: .touchUpInside)
        return button
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location Name:"
        return label
    }()
    lazy var locationValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = locatorDetail.location?.name
        return label
    }()
    let locationBufferView: UIView = {
        let bufferView = UIView()
        bufferView.translatesAutoresizingMaskIntoConstraints = false
        bufferView.backgroundColor = .gray
        return bufferView
    }()
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "State Name:"
        return label
    }()
    lazy var stateValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = locatorDetail.location?.state
        return label
    }()
    let stateBufferView: UIView = {
        let bufferView = UIView()
        bufferView.translatesAutoresizingMaskIntoConstraints = false
        bufferView.backgroundColor = .gray
        return bufferView
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address:"
        return label
    }()
    lazy var addressValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = locatorDetail.location?.address
        return label
    }()
    let addressBufferView: UIView = {
        let bufferView = UIView()
        bufferView.translatesAutoresizingMaskIntoConstraints = false
        bufferView.backgroundColor = .gray
        return bufferView
    }()
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Distance:"
        return label
    }()
    lazy var distanceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(Float((locatorDetail.location?.distance) ?? -1)) Miles"
        return label
    }()
    let distanceBufferView: UIView = {
        let bufferView = UIView()
        bufferView.translatesAutoresizingMaskIntoConstraints = false
        bufferView.backgroundColor = .gray
        return bufferView
    }()
    
    //MARK:- View Controller overriden methods
    //Adding all the views to the parent view to render location information
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.24, green: 0.49, blue: 0.55, alpha: 1.0)
        self.view.addSubview(controlView)
        self.view.addSubview(doneButton)
        self.view.addSubview(containerView)
        addLocationDetails()
        addConstraints()
    }
    
    //MARK:- EventDelegationModel: @objc methods
    //Dismiss the current view from heirarchy
    @objc func handleDoneEvent() {
        dismiss(animated: true, completion: nil)
    }
}
