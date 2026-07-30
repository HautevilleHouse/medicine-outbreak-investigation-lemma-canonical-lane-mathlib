import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def outbreakProjection : Projection OutbreakEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem outbreak_projection_idempotent (x : OutbreakEndgameState) :
    outbreakProjection.toFun (outbreakProjection.toFun x) = outbreakProjection.toFun x := by
  exact outbreakProjection.idempotent x

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse