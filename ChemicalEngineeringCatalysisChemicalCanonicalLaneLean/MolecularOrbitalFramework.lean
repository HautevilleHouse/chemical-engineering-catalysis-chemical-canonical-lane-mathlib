import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemical

structure MolecularOrbitalPackage where
  orbitalEnergy : ℝ
  overlapIntegral : ℝ
  hamiltonianMatrix : ℝ × ℝ × ℝ × ℝ
  electronDensity : ℝ -> ℝ
  bandGap : ℝ

structure OrbitalEvidence (M : MolecularOrbitalPackage) where
  orbitalEnergyClosed : M.orbitalEnergy < 0
  overlapIntegralClosed : M.overlapIntegral > 0
  bandGapClosed : M.bandGap > 0

def MolecularOrbitalClosed (M : MolecularOrbitalPackage) : Prop :=
  M.orbitalEnergy < 0 ∧ M.overlapIntegral > 0 ∧ M.bandGap > 0

theorem molecular_orbital_closed_from_evidence (M : MolecularOrbitalPackage) (E : OrbitalEvidence M) :
    MolecularOrbitalClosed M := by
  exact And.intro E.orbitalEnergyClosed (And.intro E.overlapIntegralClosed E.bandGapClosed)

end ChemicalEngineeringCatalysisChemical
end HautevilleHouse