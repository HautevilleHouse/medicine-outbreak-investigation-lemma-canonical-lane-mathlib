import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure SEIREvidenceTerms {S : InfectedHostPackage} {E : SEIRModelPackage S}
    (C : SEIRAnalyticCertificate E) where
  susceptibleDynamics : C.susceptibleDynamics
  exposedDynamics : C.exposedDynamics
  infectiousDynamics : C.infectiousDynamics
  recoveredDynamics : C.recoveredDynamics
  seirClosed : SEIRModelClosed E

def SEIRAnalyticCertificate.evidenceTerms {S : InfectedHostPackage}
    {E : SEIRModelPackage S} (C : SEIRAnalyticCertificate E) : SEIREvidenceTerms C :=
  {
    susceptibleDynamics := C.susceptibleDynamicsClosed
    exposedDynamics := C.exposedDynamicsClosed
    infectiousDynamics := C.infectiousDynamicsClosed
    recoveredDynamics := C.recoveredDynamicsClosed
    seirClosed := seir_model_closed_from_evidence E C.seirEvidence
  }

structure ReproductionNumberEvidenceTerms {S : InfectedHostPackage}
    {E : SEIRModelPackage S} {R : ReproductionNumberPackage E}
    (C : ReproductionNumberAnalyticCertificate R) where
  basicReprodDefined : C.basicReprodDefined
  effectiveReprodComputed : C.effectiveReprodComputed
  herdImmunityThreshold : C.herdImmunityThreshold
  r0Closed : ReproductionNumberClosed R

def ReproductionNumberAnalyticCertificate.evidenceTerms
    {S : InfectedHostPackage} {E : SEIRModelPackage S}
    {R : ReproductionNumberPackage E} (C : ReproductionNumberAnalyticCertificate R)
    : ReproductionNumberEvidenceTerms C :=
  {
    basicReprodDefined := C.basicReprodDefinedClosed
    effectiveReprodComputed := C.effectiveReprodComputedClosed
    herdImmunityThreshold := C.herdImmunityThresholdClosed
    r0Closed := reproduction_number_closed_from_evidence R C.reproductionNumberEvidence
  }

structure InterventionEvidenceTerms {S : InfectedHostPackage}
    {E : SEIRModelPackage S} {R : ReproductionNumberPackage E}
    {I : InterventionPackage R} (C : InterventionAnalyticCertificate I) where
  lockdownEffectiveness : C.lockdownEffectiveness
  vaccineEfficacy : C.vaccineEfficacy
  travelRestrictionImpact : C.travelRestrictionImpact
  interventionClosed : InterventionClosed I

def InterventionAnalyticCertificate.evidenceTerms
    {S : InfectedHostPackage} {E : SEIRModelPackage S}
    {R : ReproductionNumberPackage E} {I : InterventionPackage R}
    (C : InterventionAnalyticCertificate I) : InterventionEvidenceTerms C :=
  {
    lockdownEffectiveness := C.lockdownEffectivenessClosed
    vaccineEfficacy := C.vaccineEfficacyClosed
    travelRestrictionImpact := C.travelRestrictionImpactClosed
    interventionClosed := intervention_closed_from_evidence I C.interventionEvidence
  }

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse