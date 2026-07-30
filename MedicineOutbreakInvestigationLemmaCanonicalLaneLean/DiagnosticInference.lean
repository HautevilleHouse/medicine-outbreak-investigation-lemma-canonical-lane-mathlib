import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineOutbreakInvestigationLemmaCanonicalLaneLean.CompartmentModelOutbreak

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationLemmaCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : Real
  specificity : Real
  prevalence : Real
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatio : Real

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  D.positivePredictiveValue ∧ D.negativePredictiveValue

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D :=
  And.intro E.positivePredictiveValueClosed E.negativePredictiveValueClosed

end MedicineOutbreakInvestigationLemmaCanonicalLaneLean
end HautevilleHouse