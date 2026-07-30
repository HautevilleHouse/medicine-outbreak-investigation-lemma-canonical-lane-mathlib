import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure HerdImmunityThresholdPackage where
  basicReproductionNumber : ℝ
  vaccinationCoverage : ℝ
  herdImmunityThreshold : ℝ

def herdImmunityThresholdFormula (H : HerdImmunityThresholdPackage) : Prop :=
  H.herdImmunityThreshold = 1 - 1 / H.basicReproductionNumber

structure HerdImmunityThresholdEvidence (H : HerdImmunityThresholdPackage) where
  herdImmunityThresholdClosed : H.herdImmunityThreshold = 1 - 1 / H.basicReproductionNumber
  vaccinationCoverageClosed : H.vaccinationCoverage ≥ H.herdImmunityThreshold

def HerdImmunityThresholdClosed (H : HerdImmunityThresholdPackage) : Prop :=
  H.herdImmunityThreshold = 1 - 1 / H.basicReproductionNumber ∧ H.vaccinationCoverage ≥ H.herdImmunityThreshold

theorem herd_immunity_threshold_closed_from_evidence (H : HerdImmunityThresholdPackage) (E : HerdImmunityThresholdEvidence H) :
    HerdImmunityThresholdClosed H := by
  exact And.intro E.herdImmunityThresholdClosed E.vaccinationCoverageClosed

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse