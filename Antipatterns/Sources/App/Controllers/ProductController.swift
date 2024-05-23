import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")

        products.get(use: { try await self.index(req: $0) })
        products.post(use: { try await self.create(req: $0) })
        products.group(":productID") { product in
            product.get(use: { try await self.read(req: $0) })
            product.delete(use: { try await self.delete(req: $0) })
            product.put(use: { try await self.update(req: $0) })
        }
    }

    func create(req: Request) async throws -> ProductDTO {
        let product = try req.content.decode(ProductDTO.self).toModel()

        try await product.save(on: req.db)
        return product.toDTO()
    }

    func read(req: Request) async throws -> ProductDTO {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        return product.toDTO()
    }

    func index(req: Request) async throws -> [ProductDTO] {
        try await Product.query(on: req.db).all().map { $0.toDTO() }
    }

    func update(req: Request) async throws -> ProductDTO {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        let updatedProduct = try req.content.decode(ProductDTO.self).toModel()
        product.name = updatedProduct.name
        product.info = updatedProduct.info
        product.price = updatedProduct.price
        product.stock = updatedProduct.stock

        try await product.update(on: req.db)
        return product.toDTO()
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await product.delete(on: req.db)
        return .noContent
    }
}
