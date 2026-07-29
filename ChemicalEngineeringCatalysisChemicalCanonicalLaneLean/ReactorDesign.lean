import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure PlugFlowReactorPackage where
  inletConcentration : ℝ
  outletConcentration : ℝ
  reactorVolume : ℝ
  flowRate : ℝ
  reactionRate : ℝ
  conversion : ℝ
  designEquation : reactorVolume = flowRate * (inletConcentration - outletConcentration) / reactionRate
  conversionDefinition : conversion = (inletConcentration - outletConcentration) / inletConcentration
  inletConcentrationPositive : inletConcentration > 0
  flowRatePositive : flowRate > 0

structure PlugFlowReactorEvidence (P : PlugFlowReactorPackage) where
  designEquationClosed : P.designEquation
  conversionDefinitionClosed : P.conversionDefinition
  inletConcentrationPositiveClosed : P.inletConcentrationPositive
  flowRatePositiveClosed : P.flowRatePositive

def PlugFlowReactorClosed (P : PlugFlowReactorPackage) : Prop :=
  P.designEquation ∧ P.conversionDefinition ∧ P.inletConcentrationPositive ∧ P.flowRatePositive

theorem plug_flow_reactor_closed_from_evidence (P : PlugFlowReactorPackage) (E : PlugFlowReactorEvidence P) :
    PlugFlowReactorClosed P := by
  exact And.intro E.designEquationClosed (And.intro E.conversionDefinitionClosed (And.intro E.inletConcentrationPositiveClosed E.flowRatePositiveClosed))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse