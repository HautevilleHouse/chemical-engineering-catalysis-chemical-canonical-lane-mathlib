import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemical

structure ReactionRatePackage where
  forwardRateConstant : ℝ
  reverseRateConstant : ℝ
  adsorptionConstant : ℝ
  temperature : ℝ
  activationEnergy : ℝ
  rateExpression : ℝ -> ℝ

structure RateLawEvidence (R : ReactionRatePackage) where
  forwardRateConstantClosed : R.forwardRateConstant > 0
  reverseRateConstantClosed : R.reverseRateConstant > 0
  adsorptionConstantClosed : R.adsorptionConstant > 0
  temperatureClosed : R.temperature > 0
  activationEnergyClosed : R.activationEnergy > 0

def RateLawClosed (R : ReactionRatePackage) : Prop :=
  R.forwardRateConstant > 0 ∧ R.reverseRateConstant > 0 ∧
  R.adsorptionConstant > 0 ∧ R.temperature > 0 ∧ R.activationEnergy > 0

theorem rate_law_closed_from_evidence (R : ReactionRatePackage) (E : RateLawEvidence R) :
    RateLawClosed R := by
  exact And.intro E.forwardRateConstantClosed
    (And.intro E.reverseRateConstantClosed
      (And.intro E.adsorptionConstantClosed
        (And.intro E.temperatureClosed E.activationEnergyClosed)))

end ChemicalEngineeringCatalysisChemical
end HautevilleHouse