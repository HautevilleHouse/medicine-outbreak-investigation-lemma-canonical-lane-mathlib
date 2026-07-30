import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure InterventionEffectivenessPackage where
  vaccineEfficacy : Prop
  antiviralEffectiveness : Prop
  quarantineEfficacy : Prop
  socialDistancingEffect : Prop
  treatmentOutcomes : Prop

structure InterventionEffectivenessEvidence (I : InterventionEffectivenessPackage) where
  vaccineEfficacyClosed : I.vaccineEfficacy
  antiviralEffectivenessClosed : I.antiviralEffectiveness
  quarantineEfficacyClosed : I.quarantineEfficacy
  socialDistancingEffectClosed : I.socialDistancingEffect
  treatmentOutcomesClosed : I.treatmentOutcomes

def InterventionEffectivenessClosed (I : InterventionEffectivenessPackage) : Prop :=
  I.vaccineEfficacy ∧ I.antiviralEffectiveness ∧ I.quarantineEfficacy ∧
  I.socialDistancingEffect ∧ I.treatmentOutcomes

theorem intervention_effectiveness_closed_from_evidence (I : InterventionEffectivenessPackage)
    (E : InterventionEffectivenessEvidence I) : InterventionEffectivenessClosed I := by
  exact And.intro E.vaccineEfficacyClosed
    (And.intro E.antiviralEffectivenessClosed
      (And.intro E.quarantineEfficacyClosed
        (And.intro E.socialDistancingEffectClosed E.treatmentOutcomesClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse