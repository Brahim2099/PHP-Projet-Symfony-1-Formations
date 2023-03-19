<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitAddType;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[IsGranted('ROLE_ADMIN')]
class ProduitController extends AbstractController
{
    #[Route('/produit/list', name: 'app_produit_list')]
    public function list(ManagerRegistry $doctrine): Response
    {
        $produits = $doctrine->getManager()->getRepository(Produit::class)->findAll();

        return $this->render('produit/list.html.twig', ["produits" => $produits]);
    }

    #[Route('/produit/add', name: 'app_produit_add')]
    public function add(ManagerRegistry $doctrine, Request $request): Response
    {
        $produit = new Produit();

        $formulaire = $this->createForm(ProduitAddType::class, $produit);
        $formulaire->handleRequest($request);

        if ($formulaire->isSubmitted() && $formulaire->isValid()) {
            $entityManager = $doctrine->getManager();
            $entityManager->persist($produit);
            $entityManager->flush();

            return $this->redirectToRoute("app_produit_list");
        }

        return $this->render('produit/add.html.twig', ["formulaire" => $formulaire->createView()]);
    }

    #[Route('/produit/remove/{id}', name: 'app_produit_remove')]
    public function remove(ManagerRegistry $doctrine, int $id): Response
    {
        $produit = $doctrine->getManager()->getRepository(Produit::class)->find($id);

        $entityManager = $doctrine->getManager();
        $entityManager->remove($produit);
        $entityManager->flush();

        return $this->redirectToRoute('app_produit_list');
    }
}
