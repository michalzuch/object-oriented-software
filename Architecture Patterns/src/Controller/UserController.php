<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;

class UserController extends AbstractController
{
    #[Route('/user', name: 'app_user_create', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $user = new User();
        $user->setName($data['name']);
        $user->setEmail($data['email']);

        $entityManager->persist($user);
        $entityManager->flush();

        return new JsonResponse(['message' => 'User created successfully'], Response::HTTP_CREATED);
    }

    #[Route('/user', name: 'app_user_show_all')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $users = $entityManager->getRepository(User::class)->findAll();

        $formattedUsers = [];
        foreach ($users as $user) {
            $formattedUsers[] = [
                'id' => $user->getId(),
                'name' => $user->getName(),
                'email' => $user->getEmail(),
            ];
        }

        return new JsonResponse($formattedUsers);
    }

    #[Route('/user/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show($id, EntityManagerInterface $entityManager): Response
    {
        $user = $entityManager->getRepository(User::class)->find($id);

        $formattedUser = [
            'id' => $user->getId(),
            'name' => $user->getName(),
            'email' => $user->getEmail(),
        ];

        return new JsonResponse($formattedUser);
    }

    #[Route('/user/{id}', name: 'app_user_update', methods: ['PUT'])]
    public function update($id, Request $request, EntityManagerInterface $entityManager): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $existingUser = $entityManager->getRepository(User::class)->find($id);

        if ($existingUser) {
            $existingUser->setName($data['name']);
            $existingUser->setEmail($data['email']);

            $entityManager->flush();

            return new JsonResponse(['message' => 'User updated successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }
    }

    #[Route('/user/{id}', name: 'app_user_delete', methods: ['DELETE'])]
    public function delete($id, EntityManagerInterface $entityManager): JsonResponse
    {
        $user = $entityManager->getRepository(User::class)->find($id);

        if ($user) {
            $entityManager->remove($user);
            $entityManager->flush();

            return new JsonResponse(['message' => 'User deleted successfully'], Response::HTTP_OK);
        } else {
            return new JsonResponse(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }
    }
}
