import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ArrheniusPackage where
  preExponentialFactor : ℝ
  activationEnergy : ℝ
  gasConstant : ℝ
  temperature : ℝ
  rateConstant : ℝ
  arrheniusEquation : rateConstant = preExponentialFactor * Real.exp (-activationEnergy / (gasConstant * temperature))
  activationEnergyPositive : activationEnergy > 0
  temperaturePositive : temperature > 0

structure ArrheniusEvidence (P : ArrheniusPackage) where
  arrheniusEquationClosed : P.arrheniusEquation
  activationEnergyPositiveClosed : P.activationEnergyPositive
  temperaturePositiveClosed : P.temperaturePositive

def ArrheniusClosed (P : ArrheniusPackage) : Prop :=
  P.arrheniusEquation ∧ P.activationEnergyPositive ∧ P.temperaturePositive

theorem arrhenius_closed_from_evidence (P : ArrheniusPackage) (E : ArrheniusEvidence P) :
    ArrheniusClosed P := by
  exact And.intro E.arrheniusEquationClosed (And.intro E.activationEnergyPositiveClosed E.temperaturePositiveClosed)

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse