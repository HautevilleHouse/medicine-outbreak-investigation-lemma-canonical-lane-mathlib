import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptiblePopulation : Prop
  infectedPopulation : Prop
  recoveredPopulation : Prop
  transitionRates : Prop
  reproductionNumber : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  susceptiblePopulationClosed : M.susceptiblePopulation
  infectedPopulationClosed : M.infectedPopulation
  recoveredPopulationClosed : M.recoveredPopulation
  transitionRatesClosed : M.transitionRates
  reproductionNumberClosed : M.reproductionNumber

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.susceptiblePopulation ∧ M.infectedPopulation ∧ M.recoveredPopulation ∧
  M.transitionRates ∧ M.reproductionNumber

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.susceptiblePopulationClosed
    (And.intro E.infectedPopulationClosed
      (And.intro E.recoveredPopulationClosed
        (And.intro E.transitionRatesClosed E.reproductionNumberClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse