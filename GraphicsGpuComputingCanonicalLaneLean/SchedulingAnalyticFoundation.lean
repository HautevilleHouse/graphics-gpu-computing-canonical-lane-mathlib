import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsGpuComputingCanonicalLaneLean.GpuComputeCore
import HautevilleHouse.GraphicsGpuComputingCanonicalLaneLean.KernelExecutionPackage
import HautevilleHouse.GraphicsGpuComputingCanonicalLaneLean.MemoryModelPackage

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure SchedulingAnalyticFoundation where
  core : GpuComputeCore
  coreEvidence : GpuComputeCoreClosed core
  execution : KernelExecutionPackage core
  executionEvidence : KernelExecutionEvidence execution
  memory : MemoryModelPackage
  memoryEvidence : MemoryModelEvidence memory

def SchedulingAnalyticFoundationClosed (A : SchedulingAnalyticFoundation) : Prop :=
  GpuComputeCoreClosed A.core ∧ KernelExecutionClosed A.execution ∧ MemoryModelClosed A.memory

theorem scheduling_analytic_foundation_closed_from_evidence (A : SchedulingAnalyticFoundation) : SchedulingAnalyticFoundationClosed A := by
  exact And.intro A.coreEvidence (And.intro A.executionEvidence A.memoryEvidence)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse