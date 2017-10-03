import Foundation

extension Dictionary where Key == String, Value == String {

    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// - returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    func stringFromQueryParameters() -> String {
        let parameterArray = map { key, value -> String in
            let percentEscapedKey = key.addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = value.addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }

        return parameterArray.joined(separator: "&")
    }
}