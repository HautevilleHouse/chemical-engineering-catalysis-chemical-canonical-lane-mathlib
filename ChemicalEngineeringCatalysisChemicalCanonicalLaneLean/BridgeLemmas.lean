import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CatalysisWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse