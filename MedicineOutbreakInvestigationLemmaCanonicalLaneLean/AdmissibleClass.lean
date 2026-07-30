import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : OutbreakAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OutbreakWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse