import Foundation

struct Domain {
    let ID:Int64
    let servers:[Server]
    let serverChanged:Bool
    let sslGrade:String
    let previusSslGrade:String
    let logo:String
    let title:String
    let isDown:Bool
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }

    init(json:[String:Any]) throws {
        guard let ID = json["ID"] as? Int64 else {throw SerializationError.missing("ID is missing")}
        guard let servers = json["servers"] as? [Server] else {throw SerializationError.missing("servers is missing")}
        guard let serverChanged = json["servers_changed"] as? Bool else {throw SerializationError.missing("servers_changed is missing")}
        guard let sslGrade = json["ssl_grade"] as? String else {throw SerializationError.missing("ssl_grade is missing")}
        guard let previusSslGrade = json["previus_ssl_grade"] as? String else {throw SerializationError.missing("previus_ssl_grade is missing")}
        guard let logo = json["logo"] as? String else {throw SerializationError.missing("logo is missing")}
        guard let title = json["title"] as? String else {throw SerializationError.missing("title is missing")}
        guard let isDown = json["is_down"] as? Bool else {throw SerializationError.missing("is_down is missing")}
        self.ID = ID
        self.servers = servers
        self.serverChanged = serverChanged
        self.sslGrade = sslGrade
        self.previusSslGrade = previusSslGrade
        self.logo = logo
        self.title = title
        self.isDown = isDown
    }
}
