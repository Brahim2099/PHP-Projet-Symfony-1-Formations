<?php

namespace App\Controller;

use App\Entity\Inscription;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[IsGranted('ROLE_USER')]
class NavigationController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $inscriptionsEnattentes = $doctrine->getManager()->getRepository(Inscription::class)->findBy(["statut" => "En attente"]);
        $inscriptionsAcceptees = $doctrine->getManager()->getRepository(Inscription::class)->findBy(["statut" => "Acceptée"]);
        $inscriptionsRefusees = $doctrine->getManager()->getRepository(Inscription::class)->findBy(["statut" => "Refusée"]);

        return $this->render('index.html.twig', ["inscriptionsEnattentes" => $inscriptionsEnattentes, "inscriptionsAcceptees" => $inscriptionsAcceptees, "inscriptionsRefusees" => $inscriptionsRefusees]);
    }
}
