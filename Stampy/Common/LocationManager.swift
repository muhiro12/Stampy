//
//  LocationManager.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/02/01.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications

class LocationManager: CLLocationManager {

    static let shared = LocationManager()
    override private init() {}

    func start() {
        LocationManager.shared.distanceFilter = 5

        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways {
            LocationManager.shared.startMonitoring()
        } else {
            requestAlwaysAuthorization()
        }
    }

    func startMonitoring() {
        guard let uuid = UUID(uuidString: Environments.beaconUUID) else {
            return
        }

        delegate = self

        let region = CLBeaconRegion(uuid: uuid, identifier: uuid.uuidString)

        super.startMonitoring(for: region)
    }

}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        guard let beaconRegion = region as? CLBeaconRegion else {
            return
        }

        let uuid = beaconRegion.uuid.uuidString

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let now = formatter.string(from: date)

        if now < "10:00" {
            let content = UNMutableNotificationContent()
            content.title = "Attendance"
            content.subtitle = uuid
            StampType.shared.run(type: .attendance)

            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        guard let beaconRegion = region as? CLBeaconRegion else {
            return
        }

        let uuid = beaconRegion.uuid.uuidString

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let now = formatter.string(from: date)

        if now > "18:30" {
            let content = UNMutableNotificationContent()
            content.title = "Leave"
            content.subtitle = uuid
            StampType.shared.run(type: .leave)

            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }

}
