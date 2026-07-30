import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.CompartmentModelOutbreak

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure BasicReproductiveNumberPackage where
  transmissionRate : Real
  recoveryRate : Real
  contactRate : Real
  R0 : Real
  R0Computed : Prop
  thresholdProperty : Prop

structure BasicReproductiveNumberEvidence (R : BasicReproductiveNumberPackage) where
  R0ComputedClosed : R.R0Computed
  thresholdPropertyClosed : R.thresholdProperty

def BasicReproductiveNumberClosed (R : BasicReproductiveNumberPackage) : Prop :=
  R.R0Computed ∧ R.thresholdProperty

theorem basic_reproductive_number_closed_from_evidence
    (R : BasicReproductiveNumberPackage)
    (E : BasicReproductiveNumberEvidence R) : BasicReproductiveNumberClosed R :=
  And.intro E.R0ComputedClosed E.thresholdPropertyClosed

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse