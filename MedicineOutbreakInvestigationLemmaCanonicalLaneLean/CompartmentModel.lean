import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptible : Type u
  exposed : Type v
  infected : Type w
  recovered : Type x
  transitionRates : Prop
  basicReproductiveNumber : Prop
  populationStationary : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  transitionRatesClosed : C.transitionRates
  basicReproductiveNumberClosed : C.basicReproductiveNumber
  populationStationaryClosed : C.populationStationary

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.transitionRates ∧ C.basicReproductiveNumber ∧ C.populationStationary

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.transitionRatesClosed
    (And.intro E.basicReproductiveNumberClosed E.populationStationaryClosed)

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse