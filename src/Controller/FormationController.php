<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Form\FormationAddType;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[IsGranted('ROLE_USER')]
class FormationController extends AbstractController
{
    #[Route('/formation/list', name: 'app_formation_list')]
    public function list(ManagerRegistry $doctrine): Response
    {
        $formations = $doctrine->getManager()->getRepository(Formation::class)->findAll();

        return $this->render('formation/list.html.twig', ['formations' => $formations]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/formation/add', name: 'app_formation_add')]
    public function add(ManagerRegistry $doctrine, Request $request): Response
    {
        $formation = new Formation;

        $formulaire = $this->createForm(FormationAddType::class, $formation);
        $formulaire->handleRequest($request);

        if ($formulaire->isSubmitted() && $formulaire->isValid()) {
            $entityManager = $doctrine->getManager();
            $entityManager->persist($formation);
            $entityManager->flush();

            return $this->redirectToRoute("app_formation_list");
        }

        return $this->render("formation/add.html.twig", ["formulaire" => $formulaire->createView()]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/formation/remove/{id}', name: 'app_formation_remove')]
    public function remove(ManagerRegistry $doctrine, int $id): Response
    {
        $formation = $doctrine->getManager()->getRepository(Formation::class)->find($id);

        $entityManager = $doctrine->getManager();
        $entityManager->remove($formation);
        $entityManager->flush();

        return $this->redirectToRoute('app_formation_list');
    }
}