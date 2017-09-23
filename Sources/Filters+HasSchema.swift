import SwaggerParser
import Stencil

extension Filters {
    static func hasSchema(value: Any?) throws -> Any? {
        let response: Response
        if let either = value as? Either<Response, Structure<Response>> {
            response = either.structure
        } else if let valueResponse = value as? Response {
            response = valueResponse
        } else {
            throw TemplateSyntaxError("Expected Response")
        }

        let hasSchema = response.schema != nil
        return hasSchema ? "true" : ""
    }

    static func responseSchemaType(value: Any?, arguments: [Any?]) throws -> Any? {
        let response: Response
        if let either = value as? Either<Response, Structure<Response>> {
            response = either.structure
        } else if let valueResponse = value as? Response {
            response = valueResponse
        } else {
            throw TemplateSyntaxError("Expected Response")
        }

        return try self.schemaType(value: response.schema, arguments: arguments)
    }
}
