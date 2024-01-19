//
//  ConstantsAWS.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 11/29/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation
import AWSCore

//WARNING: To run this sample correctly, you must set the following constants.

let AWSRegion = AWSRegionType.USEast2 // e.g. AWSRegionType.USEast1
let CognitoIdentityPoolId = "us-east-2:0e77f361-3506-43e9-a5c3-1b6f839276d5" // corresp to testPool
let CertificateSigningRequestCommonName = "IoTSampleSwift Application"
let CertificateSigningRequestCountryName = "Your Country"
let CertificateSigningRequestOrganizationName = "Your Organization"
let CertificateSigningRequestOrganizationalUnitName = "Your Organizational Unit"
let PolicyName = "mypolicy"

// This is the endpoint in your AWS IoT console. eg: https://xxxxxxxxxx.iot.<region>.amazonaws.com

let IOT_ENDPOINT = "https://a2kmqozdg6gczx-ats.iot.us-east-2.amazonaws.com"
let ASWIoTDataManager = "MyIotDataManager"
