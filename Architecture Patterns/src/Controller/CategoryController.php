<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;

class CategoryController extends AbstractController
{
    #[Route('/category', name: 'app_category_create', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $category = new Category();
        $category->setName($data['name']);

        $entityManager->persist($category);
        $entityManager->flush();

        return new JsonResponse(['message' => 'Category created successfully'], Response::HTTP_CREATED);
    }

    #[Route('/category', name: 'app_category_show_all')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $categories = $entityManager->getRepository(Category::class)->findAll();

        $formattedCategories = [];
        foreach ($categories as $category) {
            $formattedCategories[] = [
                'id' => $category->getId(),
                'name' => $category->getName(),
            ];
        }

        return new JsonResponse($formattedCategories);
    }

    #[Route('/category/{id}', name: 'app_category_show', methods: ['GET'])]
    public function show($id, EntityManagerInterface $entityManager): Response
    {
        $category = $entityManager->getRepository(Category::class)->find($id);

        $formattedCategory = [
            'id' => $category->getId(),
            'name' => $category->getName(),
        ];

        return new JsonResponse($formattedCategory);
    }

    #[Route('/category/{id}', name: 'app_category_update', methods: ['PUT'])]
    public function update($id, Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $existingCategory = $entityManager->getRepository(Category::class)->find($id);

        if ($existingCategory) {
            $existingCategory->setName($data['name']);

            $entityManager->flush();

            return new JsonResponse(['message' => 'Category updated successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }
    }

    #[Route('/category/{id}', name: 'app_category_delete', methods: ['DELETE'])]
    public function delete($id, EntityManagerInterface $entityManager): JsonResponse
    {
        $category = $entityManager->getRepository(Category::class)->find($id);

        if ($category) {
            $entityManager->remove($category);
            $entityManager->flush();

            return new JsonResponse(['message' => 'Category deleted successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }
    }
}
