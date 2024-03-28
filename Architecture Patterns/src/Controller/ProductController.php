<?php

namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{
    #[Route('/product', name: 'app_product_create', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $product = new Product();
        $product->setName($data['name']);
        $product->setDescription($data['description']);
        $product->setPrice($data['price']);
        $product->setStock($data['stock']);
        $product->setCategory($data['category']);

        $entityManager->persist($product);
        $entityManager->flush();

        return new JsonResponse(['message' => 'Product created successfully'], Response::HTTP_CREATED);
    }

    #[Route('/product', name: 'app_product_show_all')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $products = $entityManager->getRepository(Product::class)->findAll();

        $formattedProducts = [];
        foreach ($products as $product) {
            $formattedProducts[] = [
                'id' => $product->getId(),
                'name' => $product->getName(),
                'description' => $product->getDescription(),
                'price' => $product->getPrice(),
                'stock' => $product->getStock(),
                'category' => $product->getCategory(),
            ];
        }

        return new JsonResponse($formattedProducts);
    }

    #[Route('/product/{id}', name: 'app_product_show', methods: ['GET'])]
    public function show($id, EntityManagerInterface $entityManager): Response
    {
        $product = $entityManager->getRepository(Product::class)->find($id);

        $formattedProduct = [
            'id' => $product->getId(),
            'name' => $product->getName(),
            'description' => $product->getDescription(),
            'price' => $product->getPrice(),
            'stock' => $product->getStock(),
            'category' => $product->getCategory()
        ];

        return new JsonResponse($formattedProduct);
    }

    #[Route('/product/{id}', name: 'app_product_update', methods: ['PUT'])]
    public function update($id, Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $existingProduct = $entityManager->getRepository(Product::class)->find($id);

        if ($existingProduct) {
            $existingProduct->setName($data['name']);
            $existingProduct->setDescription($data['description']);
            $existingProduct->setPrice($data['price']);
            $existingProduct->setStock($data['stock']);
            $existingProduct->setCategory($data['category']);

            $entityManager->flush();

            return new JsonResponse(['message' => 'Product updated successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'Product not found'], Response::HTTP_NOT_FOUND);
        }
    }

    #[Route('/product/{id}', name: 'app_product_delete', methods: ['DELETE'])]
    public function delete($id, EntityManagerInterface $entityManager): JsonResponse
    {
        $product = $entityManager->getRepository(Product::class)->find($id);

        if ($product) {
            $entityManager->remove($product);
            $entityManager->flush();

            return new JsonResponse(['message' => 'Product deleted successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'Product not found'], Response::HTTP_NOT_FOUND);
        }
    }
}
