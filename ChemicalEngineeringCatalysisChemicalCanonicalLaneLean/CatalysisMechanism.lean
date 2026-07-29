import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.ReactionKinetics
import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.MolecularOrbitalTheory

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure CatalysisMechanismPackage {R : ReactionRatePackage}
    {M : MolecularOrbitalPackage} where
  activeSite : Type u
  adsorptionEnergy : Prop
  turnoverFrequency : Prop
  sabatierPrinciple : Prop
  structureActivityRelationship : Prop

structure CatalysisMechanismEvidence {R : ReactionRatePackage}
    {M : MolecularOrbitalPackage} (C : CatalysisMechanismPackage R M) where
  adsorptionEnergyClosed : C.adsorptionEnergy
  turnoverFrequencyClosed : C.turnoverFrequency
  sabatierPrincipleClosed : C.sabatierPrinciple
  structureActivityRelationshipClosed : C.structureActivityRelationship

def CatalysisMechanismClosed {R : ReactionRatePackage}
    {M : MolecularOrbitalPackage} (C : CatalysisMechanismPackage R M) : Prop :=
  C.adsorptionEnergy ∧ C.turnoverFrequency ∧ C.sabatierPrinciple ∧ C.structureActivityRelationship

theorem catalysis_mechanism_closed_from_evidence
    {R : ReactionRatePackage} {M : MolecularOrbitalPackage}
    (C : CatalysisMechanismPackage R M) (E : CatalysisMechanismEvidence C) :
    CatalysisMechanismClosed C := by
  exact And.intro E.adsorptionEnergyClosed
    (And.intro E.turnoverFrequencyClosed
      (And.intro E.sabatierPrincipleClosed E.structureActivityRelationshipClosed))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse