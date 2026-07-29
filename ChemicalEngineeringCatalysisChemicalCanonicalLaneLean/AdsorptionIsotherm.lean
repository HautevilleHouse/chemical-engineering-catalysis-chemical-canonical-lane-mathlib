import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringCatalysisChemical

structure AdsorptionIsothermPackage where
  langmuirConstant : ℝ
  partialPressure : ℝ
  surfaceCoverage : ℝ -> ℝ
  temperature : ℝ
  adsorptionEnthalpy : ℝ
  coverageExpression : ℝ -> ℝ

structure IsothermEvidence (A : AdsorptionIsothermPackage) where
  langmuirConstantClosed : A.langmuirConstant > 0
  partialPressureClosed : A.partialPressure > 0
  temperatureClosed : A.temperature > 0
  adsorptionEnthalpyClosed : A.adsorptionEnthalpy < 0

def AdsorptionIsothermClosed (A : AdsorptionIsothermPackage) : Prop :=
  A.langmuirConstant > 0 ∧ A.partialPressure > 0 ∧
  A.temperature > 0 ∧ A.adsorptionEnthalpy < 0

theorem adsorption_isotherm_closed_from_evidence (A : AdsorptionIsothermPackage) (E : IsothermEvidence A) :
    AdsorptionIsothermClosed A := by
  exact And.intro E.langmuirConstantClosed
    (And.intro E.partialPressureClosed
      (And.intro E.temperatureClosed E.adsorptionEnthalpyClosed))

end ChemicalEngineeringCatalysisChemical
end HautevilleHouse