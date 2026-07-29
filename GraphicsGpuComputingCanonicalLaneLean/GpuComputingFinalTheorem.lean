import canonicalLaneMathlib.AdmissibleClass
import GraphicsGpuComputingCanonicalLaneLean.GpuKernelArchitecture
import GraphicsGpuComputingCanonicalLaneLean.ParallelExecutionModel
import GraphicsGpuComputingCanonicalLaneLean.MemoryConsistencyModel
import GraphicsGpuComputingCanonicalLaneLean.ShadingPipeline
import GraphicsGpuComputingCanonicalLaneLean.GpuPerformanceAnalysis

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

def ConstrainedGpuComputingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gpu_computing_endgame (A : AdmissibleClass) :
    ConstrainedGpuComputingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
