import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure ThermodynamicsPackage where
  enthalpyChange : ℝ
  entropyChange : ℝ
  gibbsFreeEnergy : ℝ
  equilibriumConstant : ℝ
  reactionSpontaneous : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  enthalpyChangeComputed : T.enthalpyChange ≠ 0
  entropyChangeComputed : T.entropyChange ≠ 0
  gibbsFreeEnergyComputed : T.gibbsFreeEnergy < 0
  equilibriumConstantComputed : T.equilibriumConstant > 0
  reactionSpontaneousClosed : T.reactionSpontaneous

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.enthalpyChange ≠ 0 ∧ T.entropyChange ≠ 0 ∧ T.gibbsFreeEnergy < 0 ∧ T.equilibriumConstant > 0 ∧ T.reactionSpontaneous

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.enthalpyChangeComputed (And.intro E.entropyChangeComputed (And.intro E.gibbsFreeEnergyComputed (And.intro E.equilibriumConstantComputed E.reactionSpontaneousClosed)))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse