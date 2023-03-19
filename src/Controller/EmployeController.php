<?php

namespace App\Controller;

use App\Entity\Employe;
use App\Form\EmployeAddType;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

#[IsGranted('ROLE_ADMIN')]
class EmployeController extends AbstractController
{
    #[Route('/employe/list', name: 'app_employe_list')]
    public function list(ManagerRegistry $doctrine): Response
    {
        $employes = $doctrine->getManager()->getRepository(Employe::class)->findAll();

        return $this->render('employe/list.html.twig', ["employes" => $employes]);
    }

    #[Route("/employe/add", name: "app_employe_add")]
    public function add(ManagerRegistry $doctrine, Request $request, UserPasswordHasherInterface $passwordHasher): Response
    {
        $employe = new Employe;

        $formulaire = $this->createForm(EmployeAddType::class, $employe);
        $formulaire->handleRequest($request);

        if ($formulaire->isSubmitted() && $formulaire->isValid()) {
            $employe->setPassword($passwordHasher->hashPassword($employe, $employe->getPassword()));
            
            $entityManager = $doctrine->getManager();
            $entityManager->persist($employe);
            $entityManager->flush();

            return $this->redirectToRoute("app_employe_list");
        }

        return $this->render("employe/add.html.twig", ["formulaire" => $formulaire->createView()]);
    }

    #[Route("/employe/remove/{id}", name: "app_employe_remove")]
    public function remove(ManagerRegistry $doctrine, int $id): Response
    {
        $employe = $doctrine->getManager()->getRepository(Employe::class)->find($id);

        $entityManager = $doctrine->getManager();
        $entityManager->remove($employe);
        $entityManager->flush();

        return $this->redirectToRoute("app_employe_list");
    }
}
