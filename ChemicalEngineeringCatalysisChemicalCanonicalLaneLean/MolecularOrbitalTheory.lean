import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemicalCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  adsorbateOrbitals : Type
  metalBandStructure : Type
  hybridizationModel : Prop
  dbandCenter : ℝ
  bindingEnergyEstimate : ℝ

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  adsorbateOrbitalsDefined : Nonempty M.adsorbateOrbitals
  metalBandStructureDefined : Nonempty M.metalBandStructure
  hybridizationModelClosed : M.hybridizationModel
  dbandCenterComputed : M.dbandCenter < 0
  bindingEnergyEstimateClosed : M.bindingEnergyEstimate < 0

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  Nonempty M.adsorbateOrbitals ∧ Nonempty M.metalBandStructure ∧ M.hybridizationModel ∧ M.dbandCenter < 0 ∧ M.bindingEnergyEstimate < 0

theorem molecular_orbital_theory_closed_from_evidence (M : MolecularOrbitalTheoryPackage) (E : MolecularOrbitalTheoryEvidence M) :
    MolecularOrbitalTheoryClosed M := by
  exact And.intro E.adsorbateOrbitalsDefined (And.intro E.metalBandStructureDefined (And.intro E.hybridizationModelClosed (And.intro E.dbandCenterComputed E.bindingEnergyEstimateClosed)))

end ChemicalEngineeringCatalysisChemicalCanonicalLaneLean
end HautevilleHouse