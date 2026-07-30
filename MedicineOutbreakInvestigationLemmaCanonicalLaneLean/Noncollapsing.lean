import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.SEIRModel

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure NoncollapsingPackage {S : InfectedHostPackage} (Epkg : SEIRModelPackage S) where
  scaleInvariantCaseCount : Prop
  underreportingControl : Prop
  superspreadingLimit : Prop

structure NoncollapsingEvidence {S : InfectedHostPackage} {Epkg : SEIRModelPackage S}
    (N : NoncollapsingPackage Epkg) where
  scaleInvariantCaseCountClosed : N.scaleInvariantCaseCount
  underreportingControlClosed : N.underreportingControl
  superspreadingLimitClosed : N.superspreadingLimit

def NoncollapsingClosed {S : InfectedHostPackage} {Epkg : SEIRModelPackage S}
    (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantCaseCount ∧ N.underreportingControl ∧ N.superspreadingLimit

theorem noncollapsing_closed_from_evidence
    {S : InfectedHostPackage} {Epkg : SEIRModelPackage S}
    (N : NoncollapsingPackage Epkg) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantCaseCountClosed
    (And.intro E.underreportingControlClosed E.superspreadingLimitClosed)

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse