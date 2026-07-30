import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.OutbreakAnalyticFoundation

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure SEIRAnalyticCertificate {S : InfectedHostPackage} (E : SEIRModelPackage S) where
  susceptibleDynamics : Prop
  exposedDynamics : Prop
  infectiousDynamics : Prop
  recoveredDynamics : Prop
  susceptibleDynamicsClosed : susceptibleDynamics
  exposedDynamicsClosed : exposedDynamics
  infectiousDynamicsClosed : infectiousDynamics
  recoveredDynamicsClosed : recoveredDynamics
  seirEvidence : SEIRModelEvidence E

def SEIRAnalyticCertificateClosed {S : InfectedHostPackage}
    {E : SEIRModelPackage S} (C : SEIRAnalyticCertificate E) : Prop :=
  C.susceptibleDynamics ∧ C.exposedDynamics ∧ C.infectiousDynamics ∧ C.recoveredDynamics ∧
  SEIRModelClosed E

theorem seir_analytic_certificate_closed
    {S : InfectedHostPackage} {E : SEIRModelPackage S}
    (C : SEIRAnalyticCertificate E) : SEIRAnalyticCertificateClosed C := by
  exact And.intro C.susceptibleDynamicsClosed
    (And.intro C.exposedDynamicsClosed
      (And.intro C.infectiousDynamicsClosed
        (And.intro C.recoveredDynamicsClosed
          (seir_model_closed_from_evidence E C.seirEvidence))))

structure ReproductionNumberAnalyticCertificate {S : InfectedHostPackage}
    {E : SEIRModelPackage S} (R : ReproductionNumberPackage E) where
  basicReprodDefined : Prop
  effectiveReprodComputed : Prop
  herdImmunityThreshold : Prop
  basicReprodDefinedClosed : basicReprodDefined
  effectiveReprodComputedClosed : effectiveReprodComputed
  herdImmunityThresholdClosed : herdImmunityThreshold
  reproductionNumberEvidence : ReproductionNumberEvidence R

def ReproductionNumberAnalyticCertificateClosed {S : InfectedHostPackage}
    {E : SEIRModelPackage S} {R : ReproductionNumberPackage E}
    (C : ReproductionNumberAnalyticCertificate R) : Prop :=
  C.basicReprodDefined ∧ C.effectiveReprodComputed ∧ C.herdImmunityThreshold ∧
  ReproductionNumberClosed R

theorem reproduction_number_analytic_certificate_closed
    {S : InfectedHostPackage} {E : SEIRModelPackage S}
    {R : ReproductionNumberPackage E} (C : ReproductionNumberAnalyticCertificate R) :
    ReproductionNumberAnalyticCertificateClosed C := by
  exact And.intro C.basicReprodDefinedClosed
    (And.intro C.effectiveReprodComputedClosed
      (And.intro C.herdImmunityThresholdClosed
        (reproduction_number_closed_from_evidence R C.reproductionNumberEvidence)))

structure InterventionAnalyticCertificate {S : InfectedHostPackage}
    {E : SEIRModelPackage S} {R : ReproductionNumberPackage E}
    (I : InterventionPackage R) where
  lockdownEffectiveness : Prop
  vaccineEfficacy : Prop
  travelRestrictionImpact : Prop
  lockdownEffectivenessClosed : lockdownEffectiveness
  vaccineEfficacyClosed : vaccineEfficacy
  travelRestrictionImpactClosed : travelRestrictionImpact
  interventionEvidence : InterventionEvidence I

def InterventionAnalyticCertificateClosed {S : InfectedHostPackage}
    {E : SEIRModelPackage S} {R : ReproductionNumberPackage E}
    {I : InterventionPackage R} (C : InterventionAnalyticCertificate I) : Prop :=
  C.lockdownEffectiveness ∧ C.vaccineEfficacy ∧ C.travelRestrictionImpact ∧
  InterventionClosed I

theorem intervention_analytic_certificate_closed
    {S : InfectedHostPackage} {E : SEIRModelPackage S}
    {R : ReproductionNumberPackage E} {I : InterventionPackage R}
    (C : InterventionAnalyticCertificate I) : InterventionAnalyticCertificateClosed C := by
  exact And.intro C.lockdownEffectivenessClosed
    (And.intro C.vaccineEfficacyClosed
      (And.intro C.travelRestrictionImpactClosed
        (intervention_closed_from_evidence I C.interventionEvidence)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse