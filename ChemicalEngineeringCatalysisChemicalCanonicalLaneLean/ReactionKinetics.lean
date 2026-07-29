import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ReactionKineticsPackage where
  rateConstant : ℝ
  activationEnergy : ℝ
  temperature : ℝ
  rateExpression : Prop
  surfaceReactionControlled : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateConstantComputed : R.rateConstant > 0
  activationEnergyComputed : R.activationEnergy > 0
  temperatureComputed : R.temperature > 0
  rateExpressionClosed : R.rateExpression
  surfaceReactionControlledClosed : R.surfaceReactionControlled

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.rateConstant > 0 ∧ R.activationEnergy > 0 ∧ R.temperature > 0 ∧ R.rateExpression ∧ R.surfaceReactionControlled

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateConstantComputed (And.intro E.activationEnergyComputed (And.intro E.temperatureComputed (And.intro E.rateExpressionClosed E.surfaceReactionControlledClosed)))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse