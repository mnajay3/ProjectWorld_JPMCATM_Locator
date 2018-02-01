//
//  ATMLocatorExtensions.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//

import UIKit
/*******************************************************************
 This is an extension to ATMLocatorDetailController, It is responsible
 to add constraints to all custom views..
 ********************************************************************/
extension ATMLocatorDetailController {
    
    //MARK:- Instance Methods
    func addLocationDetails() {
        self.containerView.addSubview(locationLabel)
        self.containerView.addSubview(locationValue)
        self.containerView.addSubview(locationBufferView)
        self.containerView.addSubview(stateLabel)
        self.containerView.addSubview(stateValue)
        self.containerView.addSubview(stateBufferView)
        self.containerView.addSubview(addressLabel)
        self.containerView.addSubview(addressValue)
        self.containerView.addSubview(addressBufferView)
        self.containerView.addSubview(distanceLabel)
        self.containerView.addSubview(distanceValue)
        self.containerView.addSubview(distanceBufferView)
    }

    
    //MARK:- Add Constraints
    func addConstraints() {
        
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        
        controlView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        controlView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        controlView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        controlView.bottomAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0).isActive = true
        
        doneButton.bottomAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        doneButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        stateLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 10).isActive = true
        stateLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 20).isActive = true
        stateLabel.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1/2).isActive = true
        stateLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stateValue.leftAnchor.constraint(equalTo: self.stateLabel.rightAnchor, constant: 0).isActive = true
        stateValue.topAnchor.constraint(equalTo: self.stateLabel.topAnchor, constant: 0).isActive = true
        stateValue.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        stateValue.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stateBufferView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        stateBufferView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        stateBufferView.topAnchor.constraint(equalTo: self.stateLabel.bottomAnchor).isActive = true
        stateBufferView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        locationLabel.leftAnchor.constraint(equalTo: self.stateLabel.leftAnchor, constant: 0).isActive = true
        locationLabel.topAnchor.constraint(equalTo: self.stateLabel.bottomAnchor, constant: 20).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: self.stateLabel.widthAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        locationValue.leftAnchor.constraint(equalTo: self.stateValue.leftAnchor, constant: 0).isActive = true
        locationValue.topAnchor.constraint(equalTo: self.locationLabel.topAnchor, constant: 0).isActive = true
        locationValue.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        locationValue.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        locationBufferView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        locationBufferView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        locationBufferView.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor).isActive = true
        locationBufferView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: self.locationLabel.leftAnchor, constant: 0).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 20).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: self.locationLabel.widthAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addressValue.leftAnchor.constraint(equalTo: self.locationValue.leftAnchor, constant: 0).isActive = true
        addressValue.topAnchor.constraint(equalTo: self.addressLabel.topAnchor, constant: 0).isActive = true
        addressValue.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        addressValue.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addressBufferView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        addressBufferView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        addressBufferView.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor).isActive = true
        addressBufferView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        distanceLabel.leftAnchor.constraint(equalTo: self.addressLabel.leftAnchor, constant: 0).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 20).isActive = true
        distanceLabel.widthAnchor.constraint(equalTo: self.addressLabel.widthAnchor).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        distanceValue.leftAnchor.constraint(equalTo: self.addressValue.leftAnchor, constant: 0).isActive = true
        distanceValue.topAnchor.constraint(equalTo: self.distanceLabel.topAnchor, constant: 0).isActive = true
        distanceValue.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        distanceValue.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        distanceBufferView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        distanceBufferView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        distanceBufferView.topAnchor.constraint(equalTo: self.distanceLabel.bottomAnchor).isActive = true
        distanceBufferView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        containerView.bottomAnchor.constraint(equalTo: self.distanceBufferView.bottomAnchor, constant: 0).isActive = true
    }
}
