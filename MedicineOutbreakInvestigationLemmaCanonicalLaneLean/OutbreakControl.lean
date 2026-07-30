import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.CompartmentModel
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.ReproductionNumber
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.HerdImmunityThreshold

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure OutbreakControlPackage where
  compartmentModel : CompartmentModelPackage
  reproductionNumber : ReproductionNumberPackage
  herdImmunity : HerdImmunityThresholdPackage
  interventionsApplied : Prop
  effectiveReproductionBelowOne : Prop

structure OutbreakControlEvidence (O : OutbreakControlPackage) where
  compartmentModelClosed : CompartmentModelClosed O.compartmentModel
  reproductionNumberClosed : ReproductionNumberClosed O.reproductionNumber
  herdImmunityClosed : HerdImmunityThresholdClosed O.herdImmunity
  interventionsAppliedClosed : O.interventionsApplied
  effectiveReproductionBelowOneClosed : O.effectiveReproductionBelowOne

def OutbreakControlClosed (O : OutbreakControlPackage) : Prop :=
  CompartmentModelClosed O.compartmentModel ∧
  ReproductionNumberClosed O.reproductionNumber ∧
  HerdImmunityThresholdClosed O.herdImmunity ∧
  O.interventionsApplied ∧
  O.effectiveReproductionBelowOne

theorem outbreak_control_closed_from_evidence (O : OutbreakControlPackage) (E : OutbreakControlEvidence O) :
    OutbreakControlClosed O := by
  exact And.intro E.compartmentModelClosed
    (And.intro E.reproductionNumberClosed
      (And.intro E.herdImmunityClosed
        (And.intro E.interventionsAppliedClosed E.effectiveReproductionBelowOneClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse