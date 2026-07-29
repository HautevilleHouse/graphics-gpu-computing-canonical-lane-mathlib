import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuPerformanceAnalysisPackage where
  occupancyModel : Prop
  memoryBandwidth : Prop
  computeUtilization : Prop
  powerEfficiency : Prop
  latencyHiding : Prop

structure GpuPerformanceAnalysisEvidence (P : GpuPerformanceAnalysisPackage) where
  occupancyModelClosed : P.occupancyModel
  memoryBandwidthClosed : P.memoryBandwidth
  computeUtilizationClosed : P.computeUtilization
  powerEfficiencyClosed : P.powerEfficiency
  latencyHidingClosed : P.latencyHiding

def GpuPerformanceAnalysisClosed (P : GpuPerformanceAnalysisPackage) : Prop :=
  P.occupancyModel ∧ P.memoryBandwidth ∧ P.computeUtilization ∧ P.powerEfficiency ∧ P.latencyHiding

theorem gpu_performance_analysis_closed_from_evidence (P : GpuPerformanceAnalysisPackage)
    (E : GpuPerformanceAnalysisEvidence P) : GpuPerformanceAnalysisClosed P := by
  exact And.intro E.occupancyModelClosed (And.intro E.memoryBandwidthClosed
    (And.intro E.computeUtilizationClosed (And.intro E.powerEfficiencyClosed E.latencyHidingClosed)))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
