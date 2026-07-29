import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.Thermodynamics

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ChemicalEquilibriumPackage {T : ThermodynamicsPackage} where
  reactionQuotient : Type u
  equilibriumComposition : Prop
  leChatelierPrinciple : Prop
  equilibriumConstantExpression : Prop

structure ChemicalEquilibriumEvidence {T : ThermodynamicsPackage}
    (E : ChemicalEquilibriumPackage T) where
  equilibriumCompositionClosed : E.equilibriumComposition
  leChatelierPrincipleClosed : E.leChatelierPrinciple
  equilibriumConstantExpressionClosed : E.equilibriumConstantExpression

def ChemicalEquilibriumClosed {T : ThermodynamicsPackage}
    (E : ChemicalEquilibriumPackage T) : Prop :=
  E.equilibriumComposition ∧ E.leChatelierPrinciple ∧ E.equilibriumConstantExpression

theorem chemical_equilibrium_closed_from_evidence
    {T : ThermodynamicsPackage} (E : ChemicalEquilibriumPackage T)
    (Ev : ChemicalEquilibriumEvidence E) : ChemicalEquilibriumClosed E := by
  exact And.intro Ev.equilibriumCompositionClosed
    (And.intro Ev.leChatelierPrincipleClosed Ev.equilibriumConstantExpressionClosed)

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse