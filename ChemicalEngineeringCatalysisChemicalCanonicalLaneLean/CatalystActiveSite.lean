import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemical

structure ActiveSitePackage where
  siteDensity : ℝ
  siteArea : ℝ
  turnoverFrequency : ℝ -> ℝ
  activationEnergy : ℝ
  siteConcentration : ℝ -> ℝ

structure ActiveSiteEvidence (S : ActiveSitePackage) where
  siteDensityClosed : S.siteDensity > 0
  siteAreaClosed : S.siteArea > 0
  turnoverFrequencyClosed : ∀ (t : ℝ), t ≥ 0 → S.turnoverFrequency t ≥ 0
  activationEnergyClosed : S.activationEnergy > 0

def ActiveSiteClosed (S : ActiveSitePackage) : Prop :=
  S.siteDensity > 0 ∧ S.siteArea > 0 ∧
  (∀ t : ℝ, t ≥ 0 → S.turnoverFrequency t ≥ 0) ∧ S.activationEnergy > 0

theorem active_site_closed_from_evidence (S : ActiveSitePackage) (E : ActiveSiteEvidence S) :
    ActiveSiteClosed S := by
  exact And.intro E.siteDensityClosed
    (And.intro E.siteAreaClosed
      (And.intro E.turnoverFrequencyClosed E.activationEnergyClosed))

end ChemicalEngineeringCatalysisChemical
end HautevilleHouse