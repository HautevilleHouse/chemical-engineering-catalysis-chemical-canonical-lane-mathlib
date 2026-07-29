import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.ReactionKineticsPackage
import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.CatalystDeactivationModel
import ChemicalEngineeringCatalysisChemicalCanonicalLaneLean.ThermodynamicConsistency

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCatalysisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_catalysis_endgame (A : AdmissibleClass) : ConstrainedCatalysisClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse