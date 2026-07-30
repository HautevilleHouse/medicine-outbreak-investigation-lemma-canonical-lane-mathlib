import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OutbreakWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse