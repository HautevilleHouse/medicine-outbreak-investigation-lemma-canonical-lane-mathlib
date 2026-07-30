import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure InterventionModelPackage where
  vaccinationCoverage : Prop
  quarantineEfficacy : Prop
  contactTracingEfficiency : Prop
  socialDistancingImpact : Prop
  healthcareCapacity : Prop

structure InterventionModelEvidence (I : InterventionModelPackage) where
  vaccinationCoverageClosed : I.vaccinationCoverage
  quarantineEfficacyClosed : I.quarantineEfficacy
  contactTracingEfficiencyClosed : I.contactTracingEfficiency
  socialDistancingImpactClosed : I.socialDistancingImpact
  healthcareCapacityClosed : I.healthcareCapacity

def InterventionModelClosed (I : InterventionModelPackage) : Prop :=
  I.vaccinationCoverage ∧ I.quarantineEfficacy ∧ I.contactTracingEfficiency ∧ I.socialDistancingImpact ∧ I.healthcareCapacity

theorem intervention_model_closed_from_evidence (I : InterventionModelPackage)
    (E : InterventionModelEvidence I) : InterventionModelClosed I := by
  exact And.intro E.vaccinationCoverageClosed
    (And.intro E.quarantineEfficacyClosed
      (And.intro E.contactTracingEfficiencyClosed
        (And.intro E.socialDistancingImpactClosed E.healthcareCapacityClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse