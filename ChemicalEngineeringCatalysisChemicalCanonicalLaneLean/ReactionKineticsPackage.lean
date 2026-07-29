import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ReactionKineticsPackage where
  adsorptionModel : Prop
  surfaceReactionModel : Prop
  desorptionModel : Prop
  rateExpression : Prop

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.adsorptionModel ∧ R.surfaceReactionModel ∧ R.desorptionModel ∧ R.rateExpression

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse