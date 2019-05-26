import Foundation

struct Server {
    let domain:Int
    let address:String
    let sslGrade:String
    let country:String
    let owner:String
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        guard let domain = json["domain"] as? Int else {throw SerializationError.missing("domain is missing")}
        guard let address = json["address"] as? String else {throw SerializationError.missing("address is missign")}
        guard let sslGrade = json["ssl_grade"] as? String else {throw SerializationError.missing("ssl_grade is missign")}
        guard let country = json["country"] as? String else {throw SerializationError.missing("country is missign")}
        guard let owner = json["owner"] as? String else {throw SerializationError.missing("owner is missign")}
        self.domain = domain
        self.address = address
        self.sslGrade = sslGrade
        self.country = country
        self.owner = owner
    }
}
