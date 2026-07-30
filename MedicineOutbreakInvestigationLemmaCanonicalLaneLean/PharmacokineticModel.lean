import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure PharmacokineticModelPackage where
  drugConcentration : Type u
  absorptionRate : Prop
  eliminationRate : Prop
  volumeOfDistribution : Prop
  doseResponseCurve : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  volumeOfDistributionClosed : P.volumeOfDistribution
  doseResponseCurveClosed : P.doseResponseCurve

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorptionRate ∧ P.eliminationRate ∧ P.volumeOfDistribution ∧ P.doseResponseCurve

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.volumeOfDistributionClosed E.doseResponseCurveClosed))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse