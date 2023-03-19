<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Entity\Inscription;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[IsGranted('ROLE_USER')]
class InscriptionController extends AbstractController
{
    #[Route('/inscription/list', name: 'app_inscription_list')]
    public function list(ManagerRegistry $doctrine): Response
    {
        /** @var \App\Entity\Employe $employe */
        $employe = $this->getUser();

        if (in_array("ROLE_ADMIN", $employe->getRoles())) {
            $inscriptions = $doctrine->getManager()->getRepository(Inscription::class)->findAll();
        } else {
            $inscriptions = $employe->getInscriptions();
        }

        return $this->render('inscription/list.html.twig', ['inscriptions' => $inscriptions]);
    }

    #[Route('/inscription/list/enattente', name: 'app_inscription_list_enattente')]
    public function listEnattente(ManagerRegistry $doctrine): Response
    {
        /** @var \App\Entity\Employe $employe */
        $employe = $this->getUser();

        if (in_array("ROLE_ADMIN", $employe->getRoles())) {
            $inscriptions = $doctrine->getManager()->getRepository(Inscription::class)->findBy(["statut" => "En attente"]);
        } else {
            $inscriptions = $doctrine->getManager()->getRepository(Inscription::class)->findBy(["statut" => "En attente", "Employe" => $employe->getId()]);
        }

        return $this->render('inscription/list_enattente.html.twig', ['inscriptions' => $inscriptions]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/inscription/add/{id}', name: 'app_inscription_add')]
    public function add(ManagerRegistry $doctrine, int $id): Response
    {
        $inscription = new Inscription;
        $inscription->setEmploye($this->getUser());
        $inscription->setFormation($doctrine->getManager()->getRepository(Formation::class)->find($id));
        $inscription->setStatut("En attente");

        $entityManager = $doctrine->getManager();
        $entityManager->persist($inscription);
        $entityManager->flush();

        return $this->redirectToRoute("app_inscription_list");
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/inscription/edit/statut/{id}/{statut}', name: 'app_inscription_edit_statut')]
    public function editStatut(ManagerRegistry $doctrine, int $id, string $statut): Response
    {
        if ($statut == "Acceptée" || $statut == "Refusée" || $statut == "En attente") {
            $inscription = $doctrine->getManager()->getRepository(Inscription::class)->find($id);

            $inscription->setStatut($statut);

            $entityManager = $doctrine->getManager();
            $entityManager->persist($inscription);
            $entityManager->flush();
        }

        return $this->redirectToRoute("app_inscription_list");
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/inscription/remove/{id}', name: 'app_inscription_remove')]
    public function remove(ManagerRegistry $doctrine, int $id): Response
    {
        $inscription = $doctrine->getManager()->getRepository(Inscription::class)->find($id);

        $entityManager = $doctrine->getManager();
        $entityManager->remove($inscription);
        $entityManager->flush();

        return $this->redirectToRoute('app_inscription_list');
    }
}
