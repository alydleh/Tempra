//
//  Server.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 11/29/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation
import UIKit
import AWSIoT

class Server{
    var subscribeTopic = "rpToApp"
    var publishTopic = "appToRp"
    var connected = false;
    var iotDataManager: AWSIoTDataManager!;
    var iotManager: AWSIoTManager!;
    var iot: AWSIoT!
    static var rpState: Int = 2
    static var rpCalibrate: Int = 3
    static var rpBattery: Double = 1.0
    static var heatMap = [Double]()
    static var temps = [0.0,0.0,0.0,0.0]
    static var calibrate = 0
    static var numBurn = 4
    static var alert = 2

    
    init() {
        if !self.connected{
            setup()
        }
        subscribe()
        publish()
    }
    
    func setup(){
        //     print("goes through setup")
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: AWSRegion, identityPoolId: CognitoIdentityPoolId)
        let iotEndPoint = AWSEndpoint(urlString: IOT_ENDPOINT)
        
        // Configuration for AWSIoT control plane APIs
        let iotConfiguration = AWSServiceConfiguration(region: AWSRegion, credentialsProvider: credentialsProvider)
        
        // Configuration for AWSIoT data plane APIs
        let iotDataConfiguration = AWSServiceConfiguration(region: AWSRegion,
                                                           endpoint: iotEndPoint,
                                                           credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = iotConfiguration
        
        iotManager = AWSIoTManager.default()
        iot = AWSIoT.default()
        
        AWSIoTDataManager.register(with: iotDataConfiguration!, forKey: ASWIoTDataManager)
        iotDataManager = AWSIoTDataManager(forKey: ASWIoTDataManager)
        
        // Initialize the connection
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            DispatchQueue.main.async {
                //print("connection status = \(status.rawValue)")
                switch(status)
                {
                case .connecting:
                    //  print("Connecting...")
                    break
                    
                case .connected:
                    //print("Connected")
                    self.connected = true
                    let uuid = UUID().uuidString;
                    let defaults = UserDefaults.standard
                    let certificateId = defaults.string( forKey: "certificateId")
                    
                    //  print("Using certificate:\n\(certificateId!)\n\n\nClient ID:\n\(uuid)")
                    
                case .disconnected:
                    print("Disconnected")
                    
                case .connectionRefused:
                    print("Connection Refused")
                    
                case .connectionError:
                    print("Connection Error")
                    
                case .protocolError:
                    print("Protocol Error")
                    
                default:
                    print("Unknown State")
                    print("unknown state: \(status.rawValue)")
                }
                
                NotificationCenter.default.post( name: Notification.Name(rawValue: "connectionStatusChanged"), object: self )
            }
        }
        
        
        if (connected == false)
        {
            let defaults = UserDefaults.standard
            var certificateId = defaults.string( forKey: "certificateId")
            
            if (certificateId == nil)
            {
                
                // No certificate ID has been stored in the user defaults; check to see if any .p12 files
                // exist in the bundle.
                let myBundle = Bundle.main
                let myImages = myBundle.paths(forResourcesOfType: "p12" as String, inDirectory:nil)
                let uuid = UUID().uuidString;
                
                if (myImages.count > 0) {
                    // At least one PKCS12 file exists in the bundle.  Attempt to load the first one
                    // into the keychain (the others are ignored), and set the certificate ID in the
                    // user defaults as the filename.  If the PKCS12 file requires a passphrase,
                    // you'll need to provide that here; this code is written to expect that the
                    // PKCS12 file will not have a passphrase.
                    if let data = try? Data(contentsOf: URL(fileURLWithPath: myImages[0])) {
                        if AWSIoTManager.importIdentity( fromPKCS12Data: data, passPhrase:"", certificateId:myImages[0]) {
                            // Set the certificate ID and ARN values to indicate that we have imported
                            // our identity from the PKCS12 file in the bundle.
                            defaults.set(myImages[0], forKey:"certificateId")
                            defaults.set("from-bundle", forKey:"certificateArn")
                            DispatchQueue.main.async {
                                self.iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:myImages[0], statusCallback: mqttEventCallback)
                            }
                        }
                    }
                }
                
                certificateId = defaults.string( forKey: "certificateId")
                if (certificateId == nil) {
                    
                    // Now create and store the certificate ID in NSUserDefaults
                    let csrDictionary = [ "commonName":CertificateSigningRequestCommonName, "countryName":CertificateSigningRequestCountryName, "organizationName":CertificateSigningRequestOrganizationName, "organizationalUnitName":CertificateSigningRequestOrganizationalUnitName ]
                    
                    self.iotManager.createKeysAndCertificate(fromCsr: csrDictionary, callback: {  (response ) -> Void in
                        if (response != nil)
                        {
                            defaults.set(response?.certificateId, forKey:"certificateId")
                            defaults.set(response?.certificateArn, forKey:"certificateArn")
                            certificateId = response?.certificateId
                            //  print("response: [\(String(describing: response))]")
                            
                            let attachPrincipalPolicyRequest = AWSIoTAttachPrincipalPolicyRequest()
                            attachPrincipalPolicyRequest?.policyName = PolicyName
                            attachPrincipalPolicyRequest?.principal = response?.certificateArn
                            
                            // Attach the policy to the certificate
                            self.iot.attachPrincipalPolicy(attachPrincipalPolicyRequest!).continueWith (block: { (task) -> AnyObject? in
                                if let error = task.error {
                                    print("failed: [\(error)]")
                                }
                                // print("result: [\(String(describing: task.result))]")
                                
                                // Connect to the AWS IoT platform
                                if (task.error == nil)
                                {
                                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                                        self.iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateId!, statusCallback: mqttEventCallback)
                                        
                                    })
                                }
                                return nil
                            })
                        }
                        else
                        {
                            
                        }
                    } )
                }
            }
            else
            {
                let uuid = UUID().uuidString;
                
                // Connect to the AWS IoT service
                iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateId!, statusCallback: mqttEventCallback)
            }
        }
        else
        {
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                self.iotDataManager.disconnect();
                DispatchQueue.main.async {
                    self.connected = false
                }
            }
        }
    } // end of setup?
    
    enum jsonError: Error {
        case notWork
    }
    
    func tempErrorHelp(data: [String: Any]?) throws -> [Double] {
        guard data?["temperatures"] is [Double] else{
            throw jsonError.notWork
        }
        guard data?["temperatures"] != nil else {
            throw jsonError.notWork
        }
        return data?["temperatures"] as! [Double]        }
    
    func rpCalibrateErrorHelp(data: [String: Any]?) throws -> Int {
        guard data?["calibrateInit"] is Int else{
            throw jsonError.notWork
        }
        guard data?["calibrateInit"] != nil else {
            throw jsonError.notWork
        }
        return data?["calibrateInit"] as! Int        }
    
    func rpBatteryErrorHelp(data: [String: Any]?) throws -> Double {
        guard data?["battery"] is Double else{
            throw jsonError.notWork
        }
        guard data?["battery"] != nil else {
            throw jsonError.notWork
        }
        return data?["battery"] as! Double        }//    return data["temperatures"]
    
    func rpStateErrorHelp(data: [String: Any]?) throws -> Int {
        guard data?["state"] is Int else{
            throw jsonError.notWork
        }
        guard data?["state"] != nil else {
            throw jsonError.notWork
        }
        return data?["state"] as! Int        }
    
    func subscribe(){
        print("we out here")
        iotDataManager?.subscribe(
            toTopic: subscribeTopic,
            qoS: .messageDeliveryAttemptedAtMostOnce, /* Quality of Service */
            messageCallback: {
                (payload) ->Void in
                do {
                    let json = try JSONSerialization.jsonObject(with: payload, options: []) as? [String: Any]
                    
                    DispatchQueue.main.async {
                        Server.temps = json?["temperatures"] as? [Double] ?? [0,0,0,0]
                        Server.rpCalibrate = json?["calibrateInit"] as? Int ?? 0
                        Server.rpState = json?["state"] as? Int ?? 2
                        Server.rpBattery = json?["battery"] as? Double ?? 1.00
                        Server.heatMap = json?["heatmap"] as? [Double] ?? Array(repeating: 0, count: 1024)
                        //  print(type(of: self).temps)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
        } )
    } // end of subscribe
    
    
    
    func publish(){
         print("publishing")
        let dic: [String:Any] = [
            "state" : switchState.state,
            "numBurners" : type(of: self).numBurn,
            "calibration" : type(of: self).calibrate,
            "alert" : type(of: self).alert,
            ]
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: dic,
            options: []) {
            let json = String(data: theJSONData,
                              encoding: .ascii)
            iotDataManager.publishString(json!, onTopic: publishTopic, qoS:.messageDeliveryAttemptedAtMostOnce)
        }
    }
    // end of publish
    
}

