import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure LangmuirHinshelwoodPackage where
  surfaceSiteDensity : ℝ
  rateConstantAdsorption : ℝ
  rateConstantDesorption : ℝ
  equilibriumConstant : ℝ
  temperature : ℝ
  activationEnergy : ℝ
  surfaceCoverage : ℝ
  reactionOrder : ℕ
  adsorptionEquilibrium : equilibriumConstant = rateConstantAdsorption / rateConstantDesorption
  langmuirIsotherm : surfaceCoverage = equilibriumConstant * 1.0 / (1.0 + equilibriumConstant * 1.0)
  activationEnergyPositive : activationEnergy > 0

structure LangmuirHinshelwoodEvidence (P : LangmuirHinshelwoodPackage) where
  adsorptionEquilibriumClosed : P.adsorptionEquilibrium
  langmuirIsothermClosed : P.langmuirIsotherm
  activationEnergyPositiveClosed : P.activationEnergyPositive

def LangmuirHinshelwoodClosed (P : LangmuirHinshelwoodPackage) : Prop :=
  P.adsorptionEquilibrium ∧ P.langmuirIsotherm ∧ P.activationEnergyPositive

theorem langmuir_hinshelwood_closed_from_evidence (P : LangmuirHinshelwoodPackage) (E : LangmuirHinshelwoodEvidence P) :
    LangmuirHinshelwoodClosed P := by
  exact And.intro E.adsorptionEquilibriumClosed (And.intro E.langmuirIsothermClosed E.activationEnergyPositiveClosed)

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse