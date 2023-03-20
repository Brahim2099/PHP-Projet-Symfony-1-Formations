<?php

namespace App\Form;

use App\Entity\Formation;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FormationAddType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('dateDebut', DateType::class)
            ->add('nombreHeures', IntegerType::class)
            ->add('departement', TextType::class)
            ->add('Produit', EntityType::class, ['class'=> 'App\Entity\Produit','choice_label'=>'libelle'])
            ->add('description', TextType::class)
            ->add('submit', SubmitType::class, ["label" => "Ajouter", "attr" => ["class" => "btn btn-success"]])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Formation::class,
        ]);
    }
}
