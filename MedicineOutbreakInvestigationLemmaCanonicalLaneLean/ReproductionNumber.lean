import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure ReproductionNumberPackage where
  basicReproductionNumber : ℝ
  effectiveReproductionNumber : ℝ
  transmissionRate : ℝ
  recoveryRate : ℝ

def reproductionNumberComputed (R : ReproductionNumberPackage) : Prop :=
  R.basicReproductionNumber = R.transmissionRate / R.recoveryRate

structure ReproductionNumberEvidence (R : ReproductionNumberPackage) where
  basicReproductionNumberClosed : R.basicReproductionNumber = R.transmissionRate / R.recoveryRate
  effectiveReproductionNumberClosed : R.effectiveReproductionNumber ≤ R.basicReproductionNumber

def ReproductionNumberClosed (R : ReproductionNumberPackage) : Prop :=
  R.basicReproductionNumber = R.transmissionRate / R.recoveryRate ∧ R.effectiveReproductionNumber ≤ R.basicReproductionNumber

theorem reproduction_number_closed_from_evidence (R : ReproductionNumberPackage) (E : ReproductionNumberEvidence R) :
    ReproductionNumberClosed R := by
  exact And.intro E.basicReproductionNumberClosed E.effectiveReproductionNumberClosed

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse