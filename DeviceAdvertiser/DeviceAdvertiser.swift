import Foundation
import MultipeerConnectivity

public final class DeviceAdvertiser: NSObject {
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    private let serviceType: String
    
    public init(serviceType: String) {
        self.serviceType = serviceType
        super.init()
    }
    
    public func setDeviceToken(_ deviceToken: String) {
        if let advertiser = nearbyServiceAdvertiser {
            advertiser.stopAdvertisingPeer()
        }
        
        let peerID = MCPeerID(displayName: UIDevice.current.name)
        
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
            peer: peerID,
            discoveryInfo: ["token": deviceToken, "appID": Bundle.main.bundleIdentifier ?? ""],
            serviceType: serviceType
        )
        
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
}

extension DeviceAdvertiser: MCNearbyServiceAdvertiserDelegate {
    public func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                           didReceiveInvitationFromPeer peerID: MCPeerID,
                           withContext context: Data?,
                           invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(false, MCSession())
    }
}
