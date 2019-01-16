Shopify Challenge - 2019

API Specification:

To run, download the graphql-api folder and run 
```
  cd graphql-api
  rails server
```
Then navigate to http://localhost:3000/graphiql to test out the API.

The general procedure to test out the API would be to:
1. Create a product
2. Create a Cart
3. Create a Cart Product, that acts as a link between a Cart and a quantity of Product
4. Complete the cart to purchase the product, with the assumption that there is enough product inventory available. If there isn't, then the cart won't be completed

Eg:

Create a Product
```
mutation{
  createProduct(
    title: "phone",
    price: 899.99,
    inventory_count: 20
  ){
    id
    title
    price
    inventory_count
  }
}
```

Create a Cart
```
mutation{
  createCart{
    id
  }
}
```

Create a Cart Product
```
mutation{
  createCartProduct(
    cart_id:2, 
    product_id:2, 
    quantity:2
  ){
    id
    cart{
      id
      total_cost
    }
    product{
      id
      title
      price
      inventory_count
    }
    quantity
    total_cost
  }
}
```

Complete a Cart
```
mutation{
  completeCart(cart_id:2){
    id
    total_cost
    cart_products {
      id
    }
  }
}
```

Confirm that the inventory of Product has decreased
```
{
  product(product_id:2){
    title
    price
    inventory_count
  }
}
```
