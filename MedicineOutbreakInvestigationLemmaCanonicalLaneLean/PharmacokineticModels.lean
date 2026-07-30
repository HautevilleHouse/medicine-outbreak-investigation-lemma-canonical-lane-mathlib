import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure PharmacokineticModelPackage where
  drugConcentrationCurve : Prop
  absorptionRate : Prop
  eliminationRate : Prop
  bioavailability : Prop
  volumeOfDistribution : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  drugConcentrationCurveClosed : P.drugConcentrationCurve
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  bioavailabilityClosed : P.bioavailability
  volumeOfDistributionClosed : P.volumeOfDistribution

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.drugConcentrationCurve ∧ P.absorptionRate ∧ P.eliminationRate ∧
  P.bioavailability ∧ P.volumeOfDistribution

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.drugConcentrationCurveClosed
    (And.intro E.absorptionRateClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.bioavailabilityClosed E.volumeOfDistributionClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse