import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure OutbreakDetectionPackage where
  incubationPeriod : Prop
  serialInterval : Prop
  reproductiveNumber : Prop
  clusterDetection : Prop
  spatialTemporalClustering : Prop

structure OutbreakDetectionEvidence (O : OutbreakDetectionPackage) where
  incubationPeriodClosed : O.incubationPeriod
  serialIntervalClosed : O.serialInterval
  reproductiveNumberClosed : O.reproductiveNumber
  clusterDetectionClosed : O.clusterDetection
  spatialTemporalClusteringClosed : O.spatialTemporalClustering

def OutbreakDetectionClosed (O : OutbreakDetectionPackage) : Prop :=
  O.incubationPeriod ∧ O.serialInterval ∧ O.reproductiveNumber ∧ O.clusterDetection ∧ O.spatialTemporalClustering

theorem outbreak_detection_closed_from_evidence (O : OutbreakDetectionPackage)
    (E : OutbreakDetectionEvidence O) : OutbreakDetectionClosed O := by
  exact And.intro E.incubationPeriodClosed
    (And.intro E.serialIntervalClosed
      (And.intro E.reproductiveNumberClosed
        (And.intro E.clusterDetectionClosed E.spatialTemporalClusteringClosed)))

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse