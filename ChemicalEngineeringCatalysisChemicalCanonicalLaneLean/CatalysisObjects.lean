import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure CatalystSite where
  carrier : Type
  composition : String
  active : Prop

structure CatalysisAdmittedObject where
  site : CatalystSite
  reactionMechanism : Type
  kineticsVerified : Prop
  thermodynamicsBalanced : Prop
  surfaceCoverageModel : Prop
  conclusion : kineticsVerified ∧ thermodynamicsBalanced ∧ surfaceCoverageModel

def CatalysisWitnessClosed (O : CatalysisAdmittedObject) : Prop :=
  O.kineticsVerified ∧ O.thermodynamicsBalanced ∧ O.surfaceCoverageModel

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse