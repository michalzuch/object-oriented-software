import Fluent
import Vapor

struct ProductDTO: Content {
    var id: UUID?
    var name: String?
    var info: String?
    var price: Double?
    var stock: Int?

    func toModel() -> Product {
        let model = Product()

        model.id = self.id
        if let name = self.name {
            model.name = name
        }
        if let info = self.info {
            model.info = info
        }
        if let price = self.price {
            model.price = price
        }
        if let stock = self.stock {
            model.stock = stock
        }
        
        return model
    }
}
