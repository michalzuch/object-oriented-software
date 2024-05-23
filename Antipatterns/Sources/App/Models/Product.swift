import Fluent
import struct Foundation.UUID

final class Product: Model, @unchecked Sendable {
    static let schema = "products"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "info")
    var info: String

    @Field(key: "price")
    var price: Double

    @Field(key: "stock")
    var stock: Int

    init() { }

    init(id: UUID? = nil, name: String, price: Double, stock: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.stock = stock
    }
    
    func toDTO() -> ProductDTO {
        .init(
            id: self.id,
            name: self.$name.value,
            price: self.$price.value,
            stock: self.$stock.value
        )
    }
}
