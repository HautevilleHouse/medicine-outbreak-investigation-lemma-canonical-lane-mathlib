import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure PharmacokineticsPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  halfLife : Prop
  bioavailability : Prop

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.halfLife ∧ P.bioavailability

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse
