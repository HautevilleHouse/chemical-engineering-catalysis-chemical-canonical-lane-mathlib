import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ThermodynamicConsistency where
  energyBalance : Prop
  entropyProduction : Prop
  equilibriumConstant : Prop

def ThermodynamicConsistencyClosed (T : ThermodynamicConsistency) : Prop :=
  T.energyBalance ∧ T.entropyProduction ∧ T.equilibriumConstant

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse