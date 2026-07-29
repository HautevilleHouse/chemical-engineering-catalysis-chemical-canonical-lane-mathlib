import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure CatalystDeactivationModel where
  activeSitesDecline : Prop
  regenerationCycle : Prop
  activityFunction : Prop

def CatalystDeactivationClosed (C : CatalystDeactivationModel) : Prop :=
  C.activeSitesDecline ∧ C.regenerationCycle ∧ C.activityFunction

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse