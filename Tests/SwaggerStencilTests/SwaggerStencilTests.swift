import XCTest
import SwaggerParser
import PathKit
import Stencil
import StencilSwiftKit
@testable import SwaggerStencil

class SwaggerStencilTests: XCTestCase {
    var generatedFolderPath: String!
    var templateFolderPath: String!
    var fixtureFolder: URL!

    override func setUp() {
        let fileURL = URL(fileURLWithPath: #file).deletingLastPathComponent()
        generatedFolderPath = fileURL.appendingPathComponent("Generated").path
        templateFolderPath = fileURL.appendingPathComponent("Templates").path
        fixtureFolder = fileURL.appendingPathComponent("Fixtures")
    }

    func testExample() throws {

        // Load context:
        let fixture = try self.fixture(named: "uber.json")
        let swagger = try Swagger(JSONString: fixture)
        let context: [String : Any] = [
            "swagger": swagger,
            "path": generatedFolderPath,
        ]

        // Load environment:
        let ext = Extension()
        ext.registerStencilSwiftExtensions()
        ext.registerCustomFilters()
        let paths = [
            Path(templateFolderPath + "/Go/Server")
        ]
        let loader = FileSystemLoader(paths: paths)
        let environment = Environment(loader: loader, extensions: [ext],
                                      templateClass: StencilSwiftTemplate.self)

        do {
            let renderedTemplate = try environment.renderTemplate(name: "service.go", context: context)
            print(renderedTemplate)
        } catch {
            print(error)
        }
    }
}

private extension SwaggerStencilTests {
    func fixture(named fileName: String) throws -> String {
        let url = fixtureFolder.appendingPathComponent(fileName)
        return try String.init(contentsOf: url, encoding: .utf8)
    }
}