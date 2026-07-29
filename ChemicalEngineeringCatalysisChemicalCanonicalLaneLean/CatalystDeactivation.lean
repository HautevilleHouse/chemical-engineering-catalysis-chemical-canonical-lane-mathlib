import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure DeactivationKineticsPackage where
  initialActivity : ℝ
  deactivationRateConstant : ℝ
  time : ℝ
  activity : ℝ
  decayOrder : ℕ
  deactivationModel : activity = initialActivity * Real.exp (-deactivationRateConstant * time)
  deactivationRateConstantPositive : deactivationRateConstant > 0
  initialActivityPositive : initialActivity > 0

structure DeactivationKineticsEvidence (P : DeactivationKineticsPackage) where
  deactivationModelClosed : P.deactivationModel
  deactivationRateConstantPositiveClosed : P.deactivationRateConstantPositive
  initialActivityPositiveClosed : P.initialActivityPositive

def DeactivationKineticsClosed (P : DeactivationKineticsPackage) : Prop :=
  P.deactivationModel ∧ P.deactivationRateConstantPositive ∧ P.initialActivityPositive

theorem deactivation_kinetics_closed_from_evidence (P : DeactivationKineticsPackage) (E : DeactivationKineticsEvidence P) :
    DeactivationKineticsClosed P := by
  exact And.intro E.deactivationModelClosed (And.intro E.deactivationRateConstantPositiveClosed E.initialActivityPositiveClosed)

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse