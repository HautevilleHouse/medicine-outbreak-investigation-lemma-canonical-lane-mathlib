import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type u
  timeDomain : Type v
  transitionRates : compartments -> compartments -> Real
  initialConditions : compartments -> Real
  totalPopulation : Real
  positivityPreserving : Prop
  conservationLaw : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  positivityPreservingClosed : M.positivityPreserving
  conservationLawClosed : M.conservationLaw

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.positivityPreserving ∧ M.conservationLaw

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M :=
  And.intro E.positivityPreservingClosed E.conservationLawClosed

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse