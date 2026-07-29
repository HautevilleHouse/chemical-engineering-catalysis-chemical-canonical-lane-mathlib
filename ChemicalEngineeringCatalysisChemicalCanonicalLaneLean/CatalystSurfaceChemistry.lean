import chemicalEngineeringCatalysisChemicalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure CatalystSurfaceChemistryPackage where
  adsorptionIsotherm : Prop
  activeSiteDensity : Prop
  turnoverFrequency : Prop
  surfaceReactionMechanism : Prop

structure CatalystSurfaceChemistryEvidence (C : CatalystSurfaceChemistryPackage) where
  adsorptionIsothermClosed : C.adsorptionIsotherm
  activeSiteDensityClosed : C.activeSiteDensity
  turnoverFrequencyClosed : C.turnoverFrequency
  surfaceReactionMechanismClosed : C.surfaceReactionMechanism

def CatalystSurfaceChemistryClosed (C : CatalystSurfaceChemistryPackage) : Prop :=
  C.adsorptionIsotherm ∧ C.activeSiteDensity ∧ C.turnoverFrequency ∧ C.surfaceReactionMechanism

theorem catalystSurfaceChemistryClosedFromEvidence (C : CatalystSurfaceChemistryPackage) (E : CatalystSurfaceChemistryEvidence C) :
    CatalystSurfaceChemistryClosed C := by
  exact And.intro E.adsorptionIsothermClosed (And.intro E.activeSiteDensityClosed (And.intro E.turnoverFrequencyClosed E.surfaceReactionMechanismClosed))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse
