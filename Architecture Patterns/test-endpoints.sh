#!/bin/bash

BASE_URL="http://localhost:8000"

mv ./var/data.db ./var/data_tmp.db
cp ./var/data_test.db ./var/data.db

function printResult {
    local result=$1
    local testName=$2
    
    if [ "$result" == "OK" ]; then
        echo -e "\033[0;32m${result} ${testName}\033[0m"
    else
        echo -e "\033[0;31m${result} ${testName}\033[0m"
    fi
}

function runAllTests {
    testGetAllProducts
    testGetProductById 1
    testCreateProduct
    testUpdateProduct 1
    testDeleteProduct 1
}

function testGetAllProducts {
    response=$(curl -s -X GET "${BASE_URL}/product")

    expectedData='[{"id":1,"name":"Laptop","description":"Powerful laptop for work and gaming","price":999.99,"stock":10,"category":1},{"id":2,"name":"Smartphone","description":"Latest smartphone with great features","price":599.99,"stock":20,"category":1},{"id":3,"name":"Headphones","description":"Noise-cancelling headphones for immersive experience","price":99.99,"stock":30,"category":1}]'
    
    if [ "$response" == "$expectedData" ]; then
        printResult "OK" "testGetAllProducts"
    else
        printResult "FAILED" "testGetAllProducts"
    fi
}

function testGetProductById {
    local id=$1
    response=$(curl -s -X GET "${BASE_URL}/product/${id}")

    expectedData='{"id":1,"name":"Laptop","description":"Powerful laptop for work and gaming","price":999.99,"stock":10,"category":1}'
    
    if [ "$response" == "$expectedData" ]; then
        printResult "OK" "testGetProductById"
    else
        printResult "FAILED" "testGetProductById"
    fi
}


function testCreateProduct {
    response=$(curl -s -X POST "${BASE_URL}/product" \
      -H "Content-Type: application/json" \
      -d '{
        "name": "New Product",
        "description": "This is a new product",
        "price": 99,
        "stock": 10,
        "category": 1
      }')
    
    expectedData='{"message":"Product created successfully"}'

    fullResponse=$(curl -s -X GET "${BASE_URL}/product")
    expectedFullData='[{"id":1,"name":"Laptop","description":"Powerful laptop for work and gaming","price":999.99,"stock":10,"category":1},{"id":2,"name":"Smartphone","description":"Latest smartphone with great features","price":599.99,"stock":20,"category":1},{"id":3,"name":"Headphones","description":"Noise-cancelling headphones for immersive experience","price":99.99,"stock":30,"category":1},{"id":4,"name":"New Product","description":"This is a new product","price":99,"stock":10,"category":1}]'
    
    if [ "$response" == "$expectedData" ] && [ "$fullResponse" == "$expectedFullData" ]; then
        printResult "OK" "testCreateProduct"
    else
        printResult "FAILED" "testCreateProduct"
    fi
}


function testUpdateProduct {
    local id=$1
    
    response=$(curl -s -X PUT "${BASE_URL}/product/${id}" \
      -H "Content-Type: application/json" \
      -d '{
        "name": "New Product",
        "description": "This is a new product",
        "price": 99,
        "stock": 10,
        "category": 1
      }')
    
    expectedData='{"message":"Product updated successfully"}'

    fullResponse=$(curl -s -X GET "${BASE_URL}/product")
    expectedFullData='[{"id":1,"name":"New Product","description":"This is a new product","price":99,"stock":10,"category":1},{"id":2,"name":"Smartphone","description":"Latest smartphone with great features","price":599.99,"stock":20,"category":1},{"id":3,"name":"Headphones","description":"Noise-cancelling headphones for immersive experience","price":99.99,"stock":30,"category":1},{"id":4,"name":"New Product","description":"This is a new product","price":99,"stock":10,"category":1}]'
    
    if [ "$response" == "$expectedData" ] && [ "$fullResponse" == "$expectedFullData" ]; then
        printResult "OK" "testUpdateProduct"
    else
        printResult "FAILED" "testUpdateProduct"
    fi
}

function testDeleteProduct {
    local id=$1
    
    response=$(curl -s -X DELETE "${BASE_URL}/product/${id}" \
      -H "Content-Type: application/json" \
      -d '{
        "name": "New Product",
        "description": "This is a new product",
        "price": 99,
        "stock": 10,
        "category": 1
      }')
    
    expectedData='{"message":"Product deleted successfully"}'

    fullResponse=$(curl -s -X GET "${BASE_URL}/product")
    expectedFullData='[{"id":2,"name":"Smartphone","description":"Latest smartphone with great features","price":599.99,"stock":20,"category":1},{"id":3,"name":"Headphones","description":"Noise-cancelling headphones for immersive experience","price":99.99,"stock":30,"category":1},{"id":4,"name":"New Product","description":"This is a new product","price":99,"stock":10,"category":1}]'
    
    if [ "$response" == "$expectedData" ] && [ "$fullResponse" == "$expectedFullData" ]; then
        printResult "OK" "testDeleteProduct"
    else
        printResult "FAILED" "testDeleteProduct"
    fi
}

runAllTests
mv ./var/data_tmp.db ./var/data.db
