import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure OutbreakSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure OutbreakAdmittedObject where
  space : OutbreakSpace
  hostPopulation : Prop
  pathogenIdentified : Prop
  transmissionModel : Type
  modelTopology : TopologicalSpace transmissionModel
  outbreakModelCalibrated : Prop
  conclusion : outbreakModelCalibrated

structure OutbreakEndgameState where
  object : OutbreakAdmittedObject

def OutbreakWitnessClosed (O : OutbreakAdmittedObject) : Prop :=
  O.outbreakModelCalibrated

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse